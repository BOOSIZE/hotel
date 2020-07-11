package com.example.hotel.service;

import com.example.hotel.entity.Roominfo;
import com.example.hotel.entity.Typeinfo;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

public interface TypeService {
    public abstract String typeOpe(String tname, Integer page, Integer limit, HttpServletRequest request);

    public abstract String tname();

    public abstract String addType(Typeinfo typeinfo);

    public abstract Typeinfo getTypeinfo(String tname);

    public abstract String updateType(Typeinfo typeinfo);

    public abstract String deleteType(Typeinfo typeinfo);

    public abstract String getList(HttpSession session);

    public abstract String render(HttpSession session,String tname,String people,String amt);

    public abstract String getType(Long tid,HttpSession session);

    Typeinfo getTypeinfoByid(Long tid);
}
