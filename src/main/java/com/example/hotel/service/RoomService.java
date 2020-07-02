package com.example.hotel.service;

import com.example.hotel.entity.Roominfo;

import javax.servlet.http.HttpServletRequest;

public interface RoomService {
    String roomOpe(String tname, Integer page, Integer limit, HttpServletRequest request);

    String addRoom(Roominfo roominfo);

    String updateRoom(Roominfo roominfo);

    String deleteRoom(Roominfo roominfo);
}
