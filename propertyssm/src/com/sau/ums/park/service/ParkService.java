package com.sau.ums.park.service;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Park;

public interface ParkService {

    //查询停车场列表
    public PageInfo<Park> listPark(Park park, Integer pageNum);

}
