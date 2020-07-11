package com.example.hotel.controller;

import com.example.hotel.entity.Boardinfo;
import com.example.hotel.entity.OrderDetails;
import com.example.hotel.entity.Orderinfo;
import com.example.hotel.service.OrderInfoService;
import com.example.hotel.service.RoomService;
import com.sun.org.apache.xpath.internal.operations.Or;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.annotation.Order;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 翁佳伟
 * @create 2020-06-25 21:20
 */
@Controller
@RequestMapping("/back/order")
public class OrderInfoController {

    @Autowired
    OrderInfoService orderInfoService;
    @Autowired
    RoomService roomService;


    @RequestMapping("/back")
    @ResponseBody
    public String back(Long oid, Long rid) {

        String index = orderInfoService.back(oid);//true
        String index2 = roomService.updateState(rid);//true
        if (index.equals("true") && index2.equals("true")) {
            return "true";
        }

        return "false";
    }

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
    public String allList(Integer page, Integer limit, String account, String urole) {
        return orderInfoService.allList(page, limit, account, urole);
    }

    @RequestMapping("/checkIn")
    @ResponseBody
    public String checkIn(Orderinfo orderInfo) {
        return orderInfoService.checkIn(orderInfo);

    }

    @RequestMapping("/detail")
    @ResponseBody
    public Map<String, Object> detail(String oid) {
        Map<String, Object> map = new HashMap<String, Object>();
        OrderDetails orderDetails = orderInfoService.detail(oid);
        map.put("orderDetail", orderDetails);
        return map;
    }
}
