package com.sau.ums.protect.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Protect;

@Repository
public interface ProtectDao {

    //查询安防列表
    public List<Protect> listProtect(Protect protect);

    //删除安防
    public void delProtect(Protect protect);

    //添加安防
    public void addProtect(Protect protect);

    //修改
    public void updateProtect(Protect protect);

    //根据id查询信息
    Protect getProtectInfoById(Integer id);

}
