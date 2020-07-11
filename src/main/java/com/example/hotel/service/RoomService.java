package com.example.hotel.service;

import com.example.hotel.entity.Roominfo;

import javax.servlet.http.HttpServletRequest;

public interface RoomService {
    public abstract String roomOpe(String tname, Integer page, Integer limit, HttpServletRequest request);

    public abstract String addRoom(Roominfo roominfo);

    public abstract String updateRoom(Roominfo roominfo);

    public abstract String deleteRoom(Roominfo roominfo);

    String updateState(Long rid);
}
