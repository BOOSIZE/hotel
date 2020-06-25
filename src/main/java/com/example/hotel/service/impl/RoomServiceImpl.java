package com.example.hotel.service.impl;


import com.example.hotel.dao.RoomDao;
import com.example.hotel.entity.TableModel;
import com.example.hotel.service.RoomService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class RoomServiceImpl implements RoomService {

    @Autowired(required = false)
    private RoomDao roomDao;

    @Override
    public String roomOpe(String tname, Integer page, Integer limit, HttpServletRequest request) {
        if (tname == null || tname.equals("")){tname = null;}
        TableModel tableModel = new TableModel();
        tableModel.setCount(roomDao.getSum(tname));
        tableModel.setData(roomDao.roomOpe(limit,limit*(page-1),tname));

        return new Gson().toJson(tableModel);
    }

    @Override
    public String tname() {
        return new Gson().toJson(roomDao.tname());
    }
}
