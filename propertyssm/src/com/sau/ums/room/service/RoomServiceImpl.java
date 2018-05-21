package com.sau.ums.room.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.github.pagehelper.PageHelper;
import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Room;
import com.sau.ums.room.dao.RoomDao;
import com.sau.ums.util.Constant;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired
    private RoomDao rdao;

    //查询房屋列表
    @Override
    public PageInfo<Room> listRoom(Room room, Integer pageNum) {
        PageInfo<Room> page = null;
        if ((room.getRoom() != null) && (!"".equals(room.getRoom()))) {
            room.setRoom("%" + room.getRoom() + "%");
        }
        PageHelper.startPage(pageNum, Constant.PAGE_SIZE);
        List<Room> roomlist = rdao.listRoom(room);
        page = new PageInfo<Room>(roomlist);
        return page;
    }

}