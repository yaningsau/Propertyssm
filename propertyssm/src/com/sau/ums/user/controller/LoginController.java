package com.sau.ums.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.sau.ums.bean.User;
import com.sau.ums.user.service.UserService;

// 定义成Controller
@Controller
/*
 * 设置Controller的访问路径.
 * 
 * @RequestMapping("以/开头的相对于WEB应用上下文的访问路径")
 */
@SessionAttributes({ "loguser" })
public class LoginController {

    @Autowired
    private UserService us;

    //标注成处理请求的方法
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    public String login(String username, String password, ModelMap model) {

        //调用Servise层方法处理请求
        User user = us.login(username, password);

        //生成响应
        if (user != null) {
            model.addAttribute("loguser", user);
            if (user.getKind().equals("管理员")) {
                return "admin";
            } else if (user.getKind().equals("业主")) {
                return "owner";
            } else if (user.getKind().equals("家属")) {
                return "family";
            } else if (user.getKind().equals("保安")) {
                return "security";
            } else {
                return "other";
            }

        } else {
            return "login";
        }

    }

}
