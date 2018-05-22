package com.sau.ums.complain.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Complain;
import com.sau.ums.complain.service.ComplainService;

@Controller
public class ComplainController {

    @Autowired
    public ComplainService cs;

    @RequestMapping("listComplain.do")
    public String listComplain(Complain complain, Integer pageNum,
            ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }

        Complain c = new Complain();
        c.setStatus(complain.getStatus());

        PageInfo<Complain> page = cs.listComplain(complain, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", c);

        return "listComplain";
    }

}
