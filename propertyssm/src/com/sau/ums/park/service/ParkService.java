package com.sau.ums.park.service;

import java.util.List;

import org.springframework.transaction.annotation.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Park;
import com.sau.ums.bean.Propertyfee;

public interface ParkService {

    //查询停车场列表
    public PageInfo<Park> listPark(Park park, Integer pageNum);

    //删除
    @Transactional
    public boolean delPark(Park park);

    //添加
    public boolean addPark(Park park);

    //根据车位号查询信息
    Park getParkInfoById(String carnum);

    //修改
    public boolean updatePark(Park park);

    //根据房间号查询停车位数量
    List<Park> getParkInfoByRoom(String room);

    //添加车位费
    public boolean updateParkFee(Propertyfee propertyfee);

    //查询housefee
    public Propertyfee getHousefee(String room);

    //查询
    List<Park> getParkInfo();

    //修改
    public boolean TupdatePark(Park park);

}
