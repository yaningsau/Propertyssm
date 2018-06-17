package com.sau.ums.propertyfee.service;

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
}
