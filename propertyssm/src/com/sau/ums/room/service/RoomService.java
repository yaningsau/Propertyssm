package com.sau.ums.room.service;

import javax.transaction.Transactional;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Room;

public interface RoomService {

    //查询房屋列表
    public PageInfo<Room> listRoom(Room room, Integer pageNum);

    //删除房屋
    @Transactional
    public boolean delRoom(Room room);

    //添加房屋
    public boolean addRoom(Room room);

}
