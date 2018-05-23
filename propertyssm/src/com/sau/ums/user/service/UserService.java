package com.sau.ums.user.service;

import javax.transaction.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.User;

public interface UserService {

    //登录
    User login(String username, String password);

    //查询用户列表
    public PageInfo<User> listUser(User user, Integer pageNum);

    //删除用户
    @Transactional
    public boolean delUser(Integer id);

}
