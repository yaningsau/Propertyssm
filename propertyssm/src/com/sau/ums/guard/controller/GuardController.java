package com.sau.ums.guard.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Guard;
import com.sau.ums.guard.service.GuardService;

@Controller
public class GuardController {

    @Autowired
    public GuardService gs;

    @RequestMapping("listGuard.do")
    public String listGuard(Guard guard, Integer pageNum, ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }

        Guard g = new Guard();
        g.setName(guard.getName());

        PageInfo<Guard> page = gs.listGuard(guard, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", g);

        return "listGuard";
    }

}
