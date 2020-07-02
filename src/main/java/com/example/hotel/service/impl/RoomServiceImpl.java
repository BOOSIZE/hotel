package com.example.hotel.service.impl;

import com.example.hotel.dao.RoomDao;
import com.example.hotel.dao.TypeDao;
import com.example.hotel.entity.Roominfo;
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

    @Autowired(required = false)
    private TypeDao typeDao;

    @Override
    public String roomOpe(String tname, Integer page, Integer limit, HttpServletRequest request) {
        if (tname == null || tname.equals("")){tname = null;}
        TableModel tableModel = new TableModel();
        tableModel.setCount(roomDao.getSum(tname));
        tableModel.setData(roomDao.roomOpe(limit,limit*(page-1),tname));

        return new Gson().toJson(tableModel);
    }

    @Override
    public String addRoom(Roominfo roominfo) {
        String result = "false";
        if (roomDao.getRoominfo(roominfo.getRnum())!=null){
            result = "have";
        }else {
            roominfo.setTid(typeDao.getTypeinfo(roominfo.getTname()).getTid());
            roominfo.setRtype("未入住");
            if (roomDao.addRoom(roominfo)>0){
                result = "true";
            }
        }
        return result;
    }

    @Override
    public String updateRoom(Roominfo roominfo) {
        String result = "false";
        Roominfo r = roomDao.getRoominfo(roominfo.getRnum());
        if (r!=null && r.getRid() != roominfo.getRid()){
            result = "have";
        }else {
            if (roominfo.getState() == 2){
                roominfo.setTid(typeDao.getTypeinfo(roominfo.getTname()).getTid());
            }
            if (roomDao.updateRoom(roominfo)>0){
                result = "true";
            }
        }
        return result;
    }

    @Override
    public String deleteRoom(Roominfo roominfo) {
        String result = "false";
        Roominfo roominfo1 = roomDao.getRoominfo(roominfo.getRnum());
        if (roominfo1.getRtype().equals("未入住")) {
            if (roomDao.deleteRoom(roominfo) > 0) {
                result = "true";
            }
        }else {
            result = "have";
        }
        return result;
    }

}
