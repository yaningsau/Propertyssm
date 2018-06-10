package com.sau.ums.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;
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
        if (user != null) {
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

    //添加用户
    @Override
    public boolean addUser(User user) {
        boolean isSuccess = false;

        udao.addUser(user);
        isSuccess = true;

        return isSuccess;
    }

    //修改用户信息
    @Override
    public boolean updateUser(User user) {
        boolean isSuccess = false;

        udao.updateUser(user);
        isSuccess = true;

        return isSuccess;
    }

    //根据id获取用户信息
    @Override
    public User getUserInfoById(Integer id) {
        return udao.getUserInfoById(id);
    }

    @Override
    public User getUserInfoByUserName(String username) {
        return udao.getUserInfoByUserName(username);
    }

    @Override
    public boolean updatePasswd(String newPw, String username) {
        boolean isSuccess = false;
        udao.updatePasswd(newPw, username);

        isSuccess = true;

        return isSuccess;
    }

    @Override
    public Integer getUserInfoByIdCard(String idcard) {
        return udao.getUserInfoByIdCard(idcard);
    }

    @Override
    public void updateUserLogin(User user) {
        udao.updateUserLogin(user);
    }

    @Override
    public boolean addHouseFee(Propertyfee propertyfee) {
        boolean isSuccess = false;
        udao.addHouseFee(propertyfee);
        isSuccess = true;
        return isSuccess;
    }
}
