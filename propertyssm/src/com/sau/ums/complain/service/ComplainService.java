package com.sau.ums.complain.service;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Complain;

public interface ComplainService {

    //查询投诉列表
    public PageInfo<Complain> listComplain(Complain complain, Integer pageNum);

}
