package com.sau.ums.user.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.bean.Room;
import com.sau.ums.bean.User;
import com.sau.ums.room.service.RoomService;
import com.sau.ums.user.service.UserService;
import com.sau.ums.util.Constant;

@Controller
public class UserController {

    @Autowired
    public UserService us;

    @Autowired
    public RoomService roomService;

    //获取用户列表
    @RequestMapping("/listUser.do")
    public String listUser(User user, Integer pageNum, ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        User u = new User();
        u.setUsername(user.getUsername());
        u.setKind(user.getKind());

        //调用service方法处理请求
        PageInfo<User> page = us.listUser(user, pageNum);

        //生成响应信息
        model.addAttribute("page", page);
        model.addAttribute("condition", u);

        return "listUser";
    }

    @RequestMapping("/list.do")
    public String list(User user, Integer pageNum, ModelMap model) {
        pageNum = 1;
        User u = new User();
        u.setUsername(user.getUsername());
        u.setKind(user.getKind());

        //调用service方法处理请求
        PageInfo<User> page = us.listUser(user, pageNum);

        //生成响应信息
        model.addAttribute("page", page);
        model.addAttribute("condition", u);

        return "listUser";
    }

    //删除用户
    @RequestMapping("delUser.do")
    @ResponseBody
    public Map<String, Object> delUser(Integer id, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = us.delUser(id);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;

    }

    //添加用户
    @RequestMapping("addUser.do")
    @ResponseBody
    public Map<String, Object> addUser(User user, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();

        boolean isSuccess = false;

        boolean isRoomSuccess = false;

        boolean isHouseFeeSuccess = false;

        Propertyfee propertyfee = new Propertyfee();

        //SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
        //String date = df.format(new Date());// new Date()为获取当前系统时间，也可使用当前时间戳
        String room = request.getParameter("room");
        if (room != null && room != "") {
            //根据房间号获取房屋表对应数据
            Room roomInfo = roomService.getRoomInfoById(room);
            //计算房屋的物业费
            float houseFee = Constant.HOUSEFEE_PER_SQUARE_METER
                    * roomInfo.getArea();
            propertyfee.setHousefee(houseFee);
            propertyfee.setRoom(room);
            propertyfee.setPayment(houseFee);
            propertyfee.setArrearage(houseFee);
            propertyfee.setStatus("未缴费");
            //propertyfee.setTime(Timestamp.valueOf(date));
            roomInfo.setName(user.getName());
            roomInfo.setNumber(user.getNum());
            isRoomSuccess = roomService.updateRoomInfo(roomInfo);
            isSuccess = us.addUser(user);
            isHouseFeeSuccess = us.addHouseFee(propertyfee);
            if (isSuccess && isRoomSuccess && isHouseFeeSuccess) {
                map.put("tip", "success");
            } else {
                map.put("tip", "error");
            }
        } else {
            //根据房间号获取房屋表对应数据
            isSuccess = us.addUser(user);
            if (isSuccess) {
                map.put("tip", "success");
            } else {
                map.put("tip", "error");
            }
        }
        return map;

    }

    //修改用户信息
    @RequestMapping("updateUser.do")
    @ResponseBody
    public Map<String, Object> updateUser(User user, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = us.updateUser(user);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    // 根据id获取用户信息

    @RequestMapping("getUserInfoById.do")
    public String getUserInfoById(Integer id, ModelMap model) {
        User user = new User();
        try {
            user = us.getUserInfoById(id);
            model.addAttribute("user", user);
        } catch (Exception e) {
            e.getMessage();
        }
        return "updateUser";
    }

    @RequestMapping("updatePasswd.do")
    @ResponseBody
    public Map<String, Object> updatePasswd(
            @RequestParam("originalPw") String originalPw,
            @RequestParam("newPw") String newPw,
            @RequestParam("username") String username) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        User user = us.getUserInfoByUserName(username);
        if (user.getPassword().equals(originalPw)) {
            us.updatePasswd(newPw, username);
            resultMap.put("success", true);
            resultMap.put("message", "");
        } else {
            resultMap.put("success", false);
            resultMap.put("message", "初始密码不正确！");
        }
        return resultMap;
    }

    @RequestMapping("register.do")
    @ResponseBody
    public Map<String, Object> registerAccount(User user) {
        Map<String, Object> resultMap = new HashMap<String, Object>();
        //根据身份证号验证是否可以注册账号
        Integer queryInfo = us.getUserInfoByIdCard(user.getIdcard());
        if (null != queryInfo) {
            us.updateUserLogin(user);
            resultMap.put("success", true);
            resultMap.put("message", "");
        } else {
            resultMap.put("success", false);
            resultMap.put("message", "该用户由于无有效身份信息，无法完成账号注册！");
        }
        return resultMap;
    }

    //删除用户
    @RequestMapping("addFamily.do")
    @ResponseBody
    public Map<String, Object> addFamily(User user, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = us.addFamily(user);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;

    }
}
