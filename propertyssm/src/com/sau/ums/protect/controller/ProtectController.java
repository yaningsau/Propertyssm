package com.sau.ums.protect.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Protect;
import com.sau.ums.protect.service.ProtectService;

@Controller
public class ProtectController {

    @Autowired
    public ProtectService ps;

    @RequestMapping("listProtect.do")
    public String listProtect(Protect protect, Integer pageNum, ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        Protect p = new Protect();
        p.setFacility(protect.getFacility());

        PageInfo<Protect> page = ps.listProtect(protect, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", p);

        return "listProtect";
    }

}