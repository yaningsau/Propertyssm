package com.sau.ums.repair.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Repair;

@Repository
public interface RepairDao {

    //查询报修列表
    public List<Repair> listRepair(Repair repair);

    //删除
    public void delRepair(Repair repair);

    //添加
    public void addRepair(Repair repair);

    //修改
    public void updateRepair(Repair repair);

    //根据id查询信息
    Repair getRepairInfoById(Integer id);

}
