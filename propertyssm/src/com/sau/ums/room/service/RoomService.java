package com.sau.ums.room.service;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Room;

public interface RoomService {

    //查询房屋列表
    public PageInfo<Room> listRoom(Room room, Integer pageNum);

}
