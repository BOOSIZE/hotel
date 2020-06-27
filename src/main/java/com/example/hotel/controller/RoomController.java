package com.example.hotel.controller;

import com.example.hotel.service.RoomService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

@Controller
@RequestMapping("/room/")
public class RoomController {

    @Autowired
    private RoomService roomServiceImpl;

    @RequestMapping("roomOpe")
    @ResponseBody
    public String roomOpe(String tname, Integer page, Integer limit, HttpServletRequest request) {

        return roomServiceImpl.roomOpe(tname,page,limit,request);
    }

    @RequestMapping("tname")
    @ResponseBody
    public String tname() {
        return roomServiceImpl.tname();
    }
}
