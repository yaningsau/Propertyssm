package com.sau.ums.protect.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //删除
    @RequestMapping("delProtect.do")
    @ResponseBody
    public Map<String, Object> delProtect(Protect protect, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = ps.delProtect(protect);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //添加安防
    @RequestMapping("addProtect.do")
    @ResponseBody
    public Map<String, Object> addProtect(Protect protect, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = ps.addProtect(protect);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

}
