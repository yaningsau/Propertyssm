package com.sau.ums.park.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Park;

@Repository
public interface ParkDao {

    //查询停车场列表
    public List<Park> listPark(Park park);

}
