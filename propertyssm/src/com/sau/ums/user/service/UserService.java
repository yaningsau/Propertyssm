package com.sau.ums.user.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.bean.User;

public interface UserService {

    //登录
    User login(String username, String password);

    //查询用户列表
    public PageInfo<User> listUser(User user, Integer pageNum);

    //删除用户
    @Transactional
    public boolean delUser(Integer id);

    //添加用户
    public boolean addUser(User user);

    //修改用户信息
    public boolean updateUser(User user);

    //根据id获取用户信息
    User getUserInfoById(Integer id);

    //根据用户名查询用户信息
    User getUserInfoByUserName(String username);

    //修改密码
    boolean updatePasswd(String newPw, String username);

    //
    Integer getUserInfoByIdCard(String idcard);

    //用户注册
    void updateUserLogin(User user);

    boolean addHouseFee(Propertyfee propertyfee);

    //添加家属
    public boolean addFamily(User user);

    //查询
    List<User> getUserInfo(String room);

    //根据用户名获取用户信息
    String getUserName(String username);

    String getUserIDcard(String idcard);

}
