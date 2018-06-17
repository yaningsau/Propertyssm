package com.sau.ums.park.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Park;
import com.sau.ums.bean.Propertyfee;

@Repository
public interface ParkDao {

    //查询停车场列表
    public List<Park> listPark(Park park);

    //删除
    public void delPark(Park park);

    //添加
    public void addPark(Park park);

    //根据车位号查询信息
    Park getParkInfoById(String carnum);

    //修改
    public void updatePark(Park park);

    //根据房号查询停车位数量
    List<Park> getParkInfoByRoom(String room);

    //添加停车位物业费
    public void updateParkFee(Propertyfee propertyfee);
}
