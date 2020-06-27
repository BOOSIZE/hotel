package com.example.hotel.service;

import com.example.hotel.entity.Typeinfo;

import javax.servlet.http.HttpServletRequest;

public interface TypeService {
    String typeOpe(String tname, Integer page, Integer limit, HttpServletRequest request);

    String tname();

    String addType(Typeinfo typeinfo);
}
