package com.sau.ums.repair.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Repair;
import com.sau.ums.repair.service.RepairService;

@Controller
public class RepairController {

    @Autowired
    public RepairService rs;

    @RequestMapping("listRepair.do")
    public String listRepair(Repair repair, Integer pageNum, ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        Repair r = new Repair();
        r.setName(repair.getName());
        r.setRoom(repair.getRoom());
        r.setStatus(repair.getStatus());

        PageInfo<Repair> page = rs.listRepair(repair, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", r);
        return "listRepair";
    }

}
