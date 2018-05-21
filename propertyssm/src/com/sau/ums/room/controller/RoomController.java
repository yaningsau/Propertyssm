package com.sau.ums.room.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Room;
import com.sau.ums.room.service.RoomService;

@Controller
public class RoomController {

    @Autowired
    public RoomService rs;

    @RequestMapping("listRoom.do")
    public String listRoom(Room room, Integer pageNum, ModelMap model) {
        if (pageNum == null) {
            pageNum = 1;
        }
        Room r = new Room();
        r.setRoomtype(room.getRoomtype());
        r.setRoom(room.getRoom());

        PageInfo<Room> page = rs.listRoom(room, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", r);

        return "listRoom";
    }

}
