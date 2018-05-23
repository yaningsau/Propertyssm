package com.sau.ums.guard.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    //删除
    @RequestMapping("delGuard.do")
    @ResponseBody
    public Map<String, Object> delGuard(Integer id, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = gs.delGuard(id);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //添加
    @RequestMapping("addGuard.do")
    @ResponseBody
    public Map<String, Object> addGuard(Guard guard, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = gs.addGuard(guard);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

}
