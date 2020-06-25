package com.example.hotel.service;

import javax.servlet.http.HttpServletRequest;

public interface RoomService {
    String roomOpe(String tname, Integer page, Integer limit, HttpServletRequest request);
}
