package com.sau.ums.park.service;

import javax.transaction.Transactional;

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

}
