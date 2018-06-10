package com.sau.ums.propertyfee.service;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Propertyfee;

/**
 * Created by luchang on 2018/6/6.
 */
public interface PropertyFeeService {

    //查询物业费列表
    PageInfo<Propertyfee> listPropertyfee(Propertyfee propertyfee, Integer pageNum);
}
