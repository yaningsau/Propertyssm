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

}
