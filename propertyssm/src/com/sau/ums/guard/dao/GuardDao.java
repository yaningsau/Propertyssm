package com.sau.ums.guard.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Guard;

@Repository
public interface GuardDao {

    //查询外来人员列表
    public List<Guard> listGuard(Guard guard);

}
