package com.example.hotel.service;

import com.example.hotel.entity.Orderinfo;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 翁佳伟
 * @create 2020-06-25 21:22
 */
public interface OrderInfoService {
    public abstract String alreadyList(Integer page, Integer limit, HttpServletRequest request);

    public abstract String preList(Integer page, Integer limit, HttpServletRequest request);

    public abstract String allList(Integer page, Integer limit, String account,String urole);

    public abstract String checkIn(Orderinfo orderInfo);
}
