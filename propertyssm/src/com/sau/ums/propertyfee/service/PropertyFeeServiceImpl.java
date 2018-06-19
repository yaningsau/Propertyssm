package com.sau.ums.propertyfee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.propertyfee.dao.PropertyFeeDao;
import com.sau.ums.util.Constant;

@Service
public class PropertyFeeServiceImpl implements PropertyFeeService {

    @Autowired
    PropertyFeeDao pdao;

    @Override
    public PageInfo<Propertyfee> listPropertyfee(Propertyfee propertyfee,
            Integer pageNum) {
        PageInfo<Propertyfee> page = null;
        //查询用户列表
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Propertyfee> propertyfeelist = pdao.listPropertyfee(propertyfee);
        page = new PageInfo<Propertyfee>(propertyfeelist);
        return page;
    }

    @Override
    public Propertyfee getHousefee(String room) {

        return pdao.getHousefee(room);
    }

    @Override
    public boolean Propertyfee(Propertyfee propertyfee) {

        boolean isSuccess = false;

        pdao.Propertyfee(propertyfee);
        isSuccess = true;

        return isSuccess;
    }

    @Override
    public List<Propertyfee> getPropertyInfo() {

        return pdao.getPropertyInfo();
    }

    @Override
    public boolean TPropertyfee(Propertyfee propertyfee) {
        boolean isSuccess = false;

        pdao.TPropertyfee(propertyfee);
        isSuccess = true;

        return isSuccess;
    }

    @Override
    public boolean delPropertyfee(Integer id) {
        boolean isSuccess = false;

        pdao.delPropertyfee(id);
        isSuccess = true;

        return isSuccess;
    }
}
