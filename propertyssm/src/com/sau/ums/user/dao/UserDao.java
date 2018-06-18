package com.sau.ums.user.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Propertyfee;
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

    //根据id获取用户信息
    User getUserInfoById(Integer id);

    User getUserInfoByUserName(String username);

    void updatePasswd(@Param("newPw") String newPw,
            @Param("username") String username);

    //根据身份证号获取用户信息
    Integer getUserInfoByIdCard(@Param("idcard") String idcard);

    //用户注册
    void updateUserLogin(User user);

    void addHouseFee(Propertyfee propertyfee);

    //添加家属信息
    public void addFamily(User user);

    //查询
    List<User> getUserInfo(String room);

    String getUserName(String username);

}
