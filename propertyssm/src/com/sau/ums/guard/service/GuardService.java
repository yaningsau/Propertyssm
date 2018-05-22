package com.sau.ums.guard.service;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Guard;

public interface GuardService {

    //查询外来人员列表
    public PageInfo<Guard> listGuard(Guard guard, Integer pageNum);

}
