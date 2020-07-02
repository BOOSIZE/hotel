package com.example.hotel.service;

import com.example.hotel.entity.Roominfo;
import com.example.hotel.entity.Typeinfo;

import javax.servlet.http.HttpServletRequest;

public interface TypeService {
    public abstract String typeOpe(String tname, Integer page, Integer limit, HttpServletRequest request);

    public abstract String tname();

    public abstract String addType(Typeinfo typeinfo);

    public abstract Typeinfo getTypeinfo(String tname);

    public abstract String updateType(Typeinfo typeinfo);

    String deleteType(Typeinfo typeinfo);
}
