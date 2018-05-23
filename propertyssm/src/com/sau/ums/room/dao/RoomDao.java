package com.sau.ums.room.dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.sau.ums.bean.Room;

@Repository
public interface RoomDao {

    //查询房屋列表
    public List<Room> listRoom(Room room);

    //删除房屋
    public void delRoom(Room room);

}
