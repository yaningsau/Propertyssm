package com.sau.ums.room.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Room;

@Repository
public interface RoomDao {

    //查询房屋列表
    public List<Room> listRoom(Room room);

    //删除房屋
    public void delRoom(Room room);

    //添加房屋
    public void addRoom(Room room);

    //根据房间号查询房屋信息
    public Room getRoomInfoById(@Param("room") String room);

    public void updateRoomInfo(Room room);

}
