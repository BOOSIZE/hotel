package com.example.hotel.controller;

import com.example.hotel.entity.Orderinfo;
import com.example.hotel.entity.Userinfo;
import com.example.hotel.service.OrderInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 翁佳伟
 * @create 2020-06-25 21:20
 */
@Controller
@RequestMapping("/back/order")
public class BackOrderInfoController {

    @Autowired
    OrderInfoService orderInfoService;


    @RequestMapping("/already/list")
    @ResponseBody
    public String alreadyList(Integer page, Integer limit, HttpServletRequest request) {
        return orderInfoService.alreadyList(page, limit, request);
    }

    @RequestMapping("/pre/list")
    @ResponseBody
    public String preList(Integer page, Integer limit, HttpServletRequest request) {
        return orderInfoService.preList(page, limit, request);
    }

    @RequestMapping("/all/list")
    @ResponseBody
    public String allList(Integer page, Integer limit, String account,String urole) {
        return orderInfoService.allList(page, limit, account,urole);
    }

    @RequestMapping("checkIn")
    @ResponseBody
    public String checkIn(Orderinfo orderInfo) {
        return orderInfoService.checkIn(orderInfo);

    }
}
