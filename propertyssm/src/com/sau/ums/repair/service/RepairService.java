package com.sau.ums.repair.service;


import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Repair;
import org.springframework.transaction.annotation.Transactional;

public interface RepairService {

    //查询报修列表
    public PageInfo<Repair> listRepair(Repair repair, Integer pageNum);

    //删除
    @Transactional
    public boolean delRepair(Repair repair);

    //添加
    public boolean addRepair(Repair repair);

}
