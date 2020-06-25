package com.example.hotel.service;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 翁佳伟
 * @create 2020-06-25 21:22
 */
public interface OrderInfoService {
    String alreadyList(Integer page, Integer limit, HttpServletRequest request);

    String preList(Integer page, Integer limit, HttpServletRequest request);

    String allList(Integer page, Integer limit, String account);
}
