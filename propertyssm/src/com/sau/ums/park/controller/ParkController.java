package com.sau.ums.park.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Park;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.park.service.ParkService;
import com.sau.ums.util.Constant;

@Controller
public class ParkController {

    @Autowired
    public ParkService ps;

    @RequestMapping("listPark.do")
    public String listPark(Park park, Integer pageNum, ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        Park p = new Park();
        p.setCarnum(park.getCarnum());
        p.setRoom(park.getRoom());
        p.setStatus(park.getStatus());

        PageInfo<Park> page = ps.listPark(park, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", p);

        return "listPark";

    }

    //删除
    @RequestMapping("delPark.do")
    @ResponseBody
    public Map<String, Object> delPark(Park park, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = ps.delPark(park);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //添加
    @RequestMapping("addPark.do")
    @ResponseBody
    public Map<String, Object> addPark(Park park, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = ps.addPark(park);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //查询信息
    @RequestMapping("getParkInfoById.do")
    public String getParkInfoById(String carnum, ModelMap model) {
        Park park = new Park();
        try {
            park = ps.getParkInfoById(carnum);
            model.addAttribute("park", park);
        } catch (Exception e) {
            e.getMessage();
        }
        return "updatePark";
    }

    //修改
    @RequestMapping("updatePark.do")
    @ResponseBody
    public Map<String, Object> updatePark(Park park, HttpServletRequest request) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        boolean isParkFeeSuccess = false;

        String room = request.getParameter("room");

        List<Park> parkInfo = ps.getParkInfoByRoom(room);
        int num = parkInfo.size();
        float parkfee = Constant.PARKFEE_PER_CAR * num;
        float housefee = ps.getHousefee(room).getHousefee();
        float payment = parkfee + housefee;
        Propertyfee propertyfee = new Propertyfee();

        propertyfee.setParkfee(parkfee);
        propertyfee.setPayment(payment);
        propertyfee.setRoom(room);

        isSuccess = ps.updatePark(park);
        isParkFeeSuccess = ps.updateParkFee(propertyfee);
        if (isSuccess && isParkFeeSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }
}
