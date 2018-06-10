package com.sau.ums.propertyfee.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.propertyfee.service.PropertyFeeService;

/**
 * Created by luchang on 2018/6/6.
 */
@Controller
public class PropertyFeeController {

    @Autowired
    PropertyFeeService propertyFeeService;

    //获取用户列表
    @RequestMapping("/listPropertyfee.do")
    public String listPropertyfee(Propertyfee propertyfee, Integer pageNum,
            ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }

        //调用service方法处理请求
        PageInfo<Propertyfee> page = propertyFeeService.listPropertyfee(
            propertyfee, pageNum);

        //生成响应信息
        model.addAttribute("page", page);
        return "listPropertyfee";
    }
}
