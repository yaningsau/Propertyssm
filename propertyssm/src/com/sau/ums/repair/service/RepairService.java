package com.sau.ums.repair.service;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Repair;

public interface RepairService {

    //查询报修列表
    public PageInfo<Repair> listRepair(Repair repair, Integer pageNum);

}
