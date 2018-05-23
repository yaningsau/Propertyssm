package com.sau.ums.park.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Park;
import com.sau.ums.park.service.ParkService;

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

}
