package com.sau.ums.propertyfee.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;

public interface PropertyFeeService {

    //查询物业费列表
    PageInfo<Propertyfee> listPropertyfee(Propertyfee propertyfee,
            Integer pageNum);

    //根据房号获取物业费
    Propertyfee getHousefee(String room);

    //修改
    public boolean Propertyfee(Propertyfee propertyfee);

    //查询
    List<Propertyfee> getPropertyInfo();

    //刷新
    public boolean TPropertyfee(Propertyfee propertyfee);

    @Transactional
    public boolean delPropertyfee(Integer id);

}
