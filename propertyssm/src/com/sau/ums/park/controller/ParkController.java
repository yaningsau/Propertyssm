package com.sau.ums.park.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

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

}
