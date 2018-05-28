package com.sau.ums.user.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.User;

@Repository
public interface UserDao {

    //根据用户名获取用户信息
    User getUserByName(String username);

    //查询用户列表
    public List<User> listUser(User user);

    //删除用户
    public void delUser(Integer id);

    //添加用户
    public void addUser(User user);

    //修改用户信息
    public void updateUser(User user);

}
