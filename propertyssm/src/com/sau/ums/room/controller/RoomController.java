package com.sau.ums.room.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.github.pagehelper.PageInfo;
import com.sau.ums.bean.Room;
import com.sau.ums.room.service.RoomService;

@Controller
public class RoomController {

    @Autowired
    public RoomService rs;

    //获取房屋列表
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

    //获取房屋列表
    @RequestMapping("listR.do")
    public String listR(Room room, Integer pageNum, ModelMap model) {

        pageNum = 1;

        Room r = new Room();
        r.setRoomtype(room.getRoomtype());
        r.setRoom(room.getRoom());

        PageInfo<Room> page = rs.listRoom(room, pageNum);

        model.addAttribute("page", page);
        model.addAttribute("condition", r);

        return "listRoom";
    }

    //删除房屋
    @RequestMapping("delRoom.do")
    @ResponseBody
    public Map<String, Object> delRoom(Room room, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = rs.delRoom(room);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;

    }

    //添加房屋
    @RequestMapping("addRoom.do")
    @ResponseBody
    public Map<String, Object> addRoom(Room room, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = rs.addRoom(room);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;

    }

    //修改房屋信息
    @RequestMapping("updateRoom.do")
    @ResponseBody
    public Map<String, Object> updateRoom(Room room, HttpSession session) {
        Map<String, Object> map = new HashMap<String, Object>();
        boolean isSuccess = false;

        isSuccess = rs.updateRoom(room);
        if (isSuccess) {
            map.put("tip", "success");
        } else {
            map.put("tip", "error");
        }
        return map;
    }

    @RequestMapping("getRoomInfoById.do")
    public String getRoomInfoById(String room, ModelMap model) {
        Room rm = new Room();
        try {
            rm = rs.getRoomInfoById(room);
            model.addAttribute("rm", rm);
        } catch (Exception e) {
            e.getMessage();
        }
        return "updateRoom";
    }

}
