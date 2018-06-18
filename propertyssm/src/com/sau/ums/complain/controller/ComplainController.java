package com.sau.ums.complain.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

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

    @RequestMapping("listC.do")
    public String listC(Complain complain, Integer pageNum, ModelMap model) {

        pageNum = 1;

        Complain c = new Complain();
        c.setStatus(complain.getStatus());

        PageInfo<Complain> page = cs.listComplain(complain, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", c);

        return "listComplain";
    }

    //删除
    @RequestMapping("delComplain.do")
    @ResponseBody
    public Map<String, Object> delComplain(Integer id, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = cs.delComplain(id);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //添加
    @RequestMapping("addComplain.do")
    @ResponseBody
    public Map<String, Object> addComplain(Complain complain,
            HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = cs.addComplain(complain);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    //根据id获取信息
    @RequestMapping("getComplainInfoById.do")
    public String getComplainInfoById(Integer id, ModelMap model) {
        Complain complain = new Complain();
        try {
            complain = cs.getComplainInfoById(id);
            model.addAttribute("complain", complain);
        } catch (Exception e) {
            e.getMessage();
        }
        return "updateComplain";
    }

    //修改
    @RequestMapping("updateComplain.do")
    @ResponseBody
    public Map<String, Object> updateComplain(Complain complain,
            HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = cs.updateComplain(complain);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

}
