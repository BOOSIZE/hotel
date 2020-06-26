package com.example.hotel.service.impl;

import com.example.hotel.dao.OrderInfoDao;
import com.example.hotel.entity.Orderinfo;
import com.example.hotel.entity.TableModel;
import com.example.hotel.service.OrderInfoService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

/**
 * @author 翁佳伟
 * @create 2020-06-25 21:24
 */
@Service
public class OrderInfoServiceImpl implements OrderInfoService {

    @Autowired(required = false)
    OrderInfoDao orderInfoDao;

    @Override
    public String alreadyList(Integer page, Integer limit, HttpServletRequest request) {
        TableModel tableModel = new TableModel();
        tableModel.setCount(orderInfoDao.getSum());
        tableModel.setData(orderInfoDao.alreadyList(limit, limit * (page - 1)));
        return new Gson().toJson(tableModel);
    }

    @Override
    public String preList(Integer page, Integer limit, HttpServletRequest request) {
        TableModel tableModel = new TableModel();
        tableModel.setCount(orderInfoDao.getPreSum());
        tableModel.setData(orderInfoDao.preList(limit, limit * (page - 1)));
        return new Gson().toJson(tableModel);
    }

    @Override
    public String allList(Integer page, Integer limit, String account,String urole) {
        if (urole == null || urole.equals("")){
            urole = null;
        }
        TableModel tableModel = new TableModel();
        tableModel.setCount(orderInfoDao.getAllSum(account));
        tableModel.setData(orderInfoDao.allList(limit, limit * (page - 1), account,urole));
        return new Gson().toJson(tableModel);
    }

    @Override
    public String checkIn(Orderinfo orderInfo) {
        String result = "false";

        Integer index = orderInfoDao.checkIn(orderInfo.getOid());
        if (index > 0) {
            result = "true";
        }
        return result;
    }
}
