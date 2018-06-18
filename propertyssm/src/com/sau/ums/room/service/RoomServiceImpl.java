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

    //删除房屋
    @Override
    public boolean delRoom(Room room) {
        boolean isSuccess = false;

        rdao.delRoom(room);
        isSuccess = true;
        return isSuccess;
    }

    //添加
    @Override
    public boolean addRoom(Room room) {
        boolean isSuccess = false;

        rdao.addRoom(room);
        isSuccess = true;

        return isSuccess;
    }

    //根据房间号查询房屋信息
    @Override
    public Room getRoomInfoById(String room) {
        return rdao.getRoomInfoById(room);
    }

    //添加业主
    @Override
    public boolean updateRoomInfo(Room room) {
        boolean isSuccess = false;
        rdao.updateRoomInfo(room);
        isSuccess = true;
        return isSuccess;
    }

    //修改信息
    @Override
    public boolean updateRoom(Room room) {
        boolean isSuccess = false;
        rdao.updateRoom(room);
        isSuccess = true;
        return isSuccess;
    }

    @Override
    public String getRoom(String room) {
        return rdao.getRoom(room);
    }

}
