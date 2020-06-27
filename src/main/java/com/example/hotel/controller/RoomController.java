package com.example.hotel.controller;

import com.example.hotel.entity.Roominfo;
import com.example.hotel.entity.Typeinfo;
import com.example.hotel.service.RoomService;
import com.example.hotel.service.TypeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

@Controller
@RequestMapping("/room/")
public class RoomController {

    @Autowired
    private RoomService roomServiceImpl;

    @RequestMapping("roomOpe")
    @ResponseBody
    public String roomOpe(String tname, Integer page, Integer limit, HttpServletRequest request) {

        return roomServiceImpl.roomOpe(tname, page, limit, request);
    }


    @RequestMapping("addRoom")
    @ResponseBody
    public String addRoom(Roominfo roominfo) {
        return roomServiceImpl.addRoom(roominfo);
    }
    @RequestMapping("updateRoom")
    @ResponseBody
    public String updateRoom(Roominfo roominfo) {
        return roomServiceImpl.updateRoom(roominfo);
    }


}
