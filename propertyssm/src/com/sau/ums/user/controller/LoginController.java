package com.sau.ums.user.controller;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sau.ums.bean.Park;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.bean.User;
import com.sau.ums.park.service.ParkService;
import com.sau.ums.propertyfee.service.PropertyFeeService;
import com.sau.ums.user.service.UserService;
import com.sau.ums.util.Constant;
import com.sau.ums.util.time;

// 定义成Controller
@Controller
/*
 * 设置Controller的访问路径.
 * 
 * @RequestMapping("以/开头的相对于WEB应用上下文的访问路径")
 */
@SessionAttributes({ "loguser" })
public class LoginController {

    @Autowired
    private UserService us;

    @Autowired
    private ParkService ps;

    @Autowired
    private PropertyFeeService pfs;

    //标注成处理请求的方法
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(String username, String password, ModelMap model) {

        //调用Servise层方法处理请求
        User user = us.login(username, password);

        SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        //刷新停车场数据库
        Park park2 = new Park();
        List<Park> parkinfo = ps.getParkInfo();
        for (Park park1 : parkinfo) {

            try {
                long now = time.dateToStamp(date);
                //long endtime = park1.getEndtime().getTime();
                Date endtime = park1.getEndtime();
                if (endtime != null) {
                    if (now > endtime.getTime()) {
                        String carnum = park1.getCarnum();
                        park2.setBegintime(null);
                        park2.setEndtime(null);
                        park2.setRoom(null);
                        park2.setStatus("未使用");
                        park2.setCarnum(carnum);
                        ps.TupdatePark(park2);
                    }
                }

            } catch (ParseException e) {
                e.printStackTrace();
            }
        }

        //刷新物业费数据库
        Calendar now = Calendar.getInstance();
        //Propertyfee propertyfee = new Propertyfee();
        //User user2 = new User();
        List<Propertyfee> pInfo = pfs.getPropertyInfo();
        for (Propertyfee propertyfee2 : pInfo) {
            int ndate = now.get(Calendar.DAY_OF_MONTH);
            //int ndate = 1;
            if (ndate == 1) {
                String room = propertyfee2.getRoom();
                Timestamp time;
                String status;
                float housefee = propertyfee2.getHousefee();
                float arrearage = propertyfee2.getArrearage();
                List<Park> parkInfo = ps.getParkInfoByRoom(room);
                // String Ustatus = us.getUserInfo(room);
                List<User> Ustatus = us.getUserInfo(room);
                String s = Ustatus.get(0).getStatus();
                int num = parkInfo.size();
                float parkfee = Constant.PARKFEE_PER_CAR * num;
                float payment = parkfee + housefee;
                if (s.equals("退休")) {
                    arrearage = arrearage + payment;
                    time = null;
                    status = "未缴费";
                } else {
                    status = "已缴费";
                    arrearage = 0;
                    time = Timestamp.valueOf(date);
                }

                propertyfee2.setRoom(room);
                propertyfee2.setParkfee(parkfee);
                propertyfee2.setArrearage(arrearage);
                propertyfee2.setPayment(payment);
                propertyfee2.setStatus(status);
                propertyfee2.setTime(time);

                pfs.TPropertyfee(propertyfee2);

            }
        }

        //生成响应
        if (user != null) {
            model.addAttribute("loguser", user);
            if (user.getKind().equals("管理员")) {
                return "admin";
            } else if (user.getKind().equals("业主")) {
                return "owner";
            } else if (user.getKind().equals("家属")) {
                return "family";
            } else if (user.getKind().equals("保安")) {
                return "security";
            } else {
                return "other";
            }

        } else {
            return "login";
        }

    }
}
