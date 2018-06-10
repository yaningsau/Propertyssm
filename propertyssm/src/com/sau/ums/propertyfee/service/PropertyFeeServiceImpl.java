package com.sau.ums.propertyfee.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;
import com.sau.ums.propertyfee.dao.PropertyFeeDao;
import com.sau.ums.util.Constant;

/**
 * Created by luchang on 2018/6/6.
 */
@Service
public class PropertyFeeServiceImpl implements PropertyFeeService {

    @Autowired
    PropertyFeeDao propertyFeeDao;

    @Override
    public PageInfo<Propertyfee> listPropertyfee(Propertyfee propertyfee,
            Integer pageNum) {
        PageInfo<Propertyfee> page = null;
        //查询用户列表
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Propertyfee> propertyfeelist = propertyFeeDao
                .listPropertyfee(propertyfee);
        page = new PageInfo<Propertyfee>(propertyfeelist);
        return page;
    }
}
