package com.sau.ums.propertyfee.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.propertyfee.service.PropertyFeeService;

@Controller
public class PropertyFeeController {

    @Autowired
    PropertyFeeService ps;

    //获取用户列表
    @RequestMapping("/listPropertyfee.do")
    public String listPropertyfee(Propertyfee propertyfee, Integer pageNum,
            ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }

        //调用service方法处理请求
        PageInfo<Propertyfee> page = ps.listPropertyfee(propertyfee, pageNum);

        //生成响应信息
        model.addAttribute("page", page);
        return "listPropertyfee";
    }

    //根据room获取信息
    @RequestMapping("getHousefee.do")
    public String getHousefee(String room, ModelMap model, HttpSession session) {

        //session.getAttribute("room");
        Propertyfee propertyfee = new Propertyfee();
        try {
            propertyfee = ps.getHousefee(room);
            model.addAttribute("propertyfee", propertyfee);
        } catch (Exception e) {
            e.getMessage();
        }
        return "Propertyfee";
    }

    //修改
    @RequestMapping("Propertyfee.do")
    @ResponseBody
    public Map<String, Object> Propertyfee(Propertyfee propertyfee,
            HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = ps.Propertyfee(propertyfee);

        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

}
