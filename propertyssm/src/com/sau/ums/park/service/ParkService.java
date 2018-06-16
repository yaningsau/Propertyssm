package com.sau.ums.park.service;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Park;

public interface ParkService {

    //查询停车场列表
    public PageInfo<Park> listPark(Park park, Integer pageNum);

    //删除
    @Transactional
    public boolean delPark(Park park);

    //添加
    public boolean addPark(Park park);

    //根据车位好查询信息
    Park getParkInfoById(String carnum);

    //修改
    public boolean updatePark(Park park);

}
