package com.sau.ums.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.User;
import com.sau.ums.user.dao.UserDao;
import com.sau.ums.util.Constant;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserDao udao;

    //登录
    public User login(String username, String password) {
        User user = null;

        //根据用户名获取用户信息
        user = udao.getUserByName(username);

        //如果用户存在，判断密码是否正确
        if (username != null) {
            if (!password.equals(user.getPassword())) {
                user = null;
            }
        }
        return user;
    }

    //查询用户列表
    @Override
    public PageInfo<User> listUser(User user, Integer pageNum) {
        PageInfo<User> page = null;
        if ((user.getUsername() != null) && (!"".equals(user.getUsername()))) {
            user.setUsername("%" + user.getUsername() + "%");
        }
        //查询用户列表
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<User> userlist = udao.listUser(user);
        page = new PageInfo<User>(userlist);
        return page;
    }

    //删除用户
    @Override
    public boolean delUser(Integer id) {
        boolean isSuccess = false;
        //删除用户
        udao.delUser(id);
        isSuccess = true;

        return isSuccess;
    }
}
