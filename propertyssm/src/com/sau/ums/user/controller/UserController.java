package com.sau.ums.user.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.User;
import com.sau.ums.user.service.UserService;

@Controller
public class UserController {

    @Autowired
    public UserService us;

    @RequestMapping("/listUser.do")
    public String listUser(User user, Integer pageNum, ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        User u = new User();
        u.setUsername(user.getUsername());
        u.setKind(user.getKind());

        //调用service方法处理请求
        PageInfo<User> page = us.listUser(user, pageNum);

        //生成响应信息
        model.addAttribute("page", page);
        model.addAttribute("condition", u);

        return "listUser";
    }

}
