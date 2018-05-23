package com.sau.ums.repair.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //删除
    @RequestMapping("delRepair.do")
    @ResponseBody
    public Map<String, Object> delProtect(Repair repair, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = rs.delRepair(repair);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //添加
    @RequestMapping("addRepair.do")
    @ResponseBody
    public Map<String, Object> addProtect(Repair repair, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = rs.addRepair(repair);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

}
