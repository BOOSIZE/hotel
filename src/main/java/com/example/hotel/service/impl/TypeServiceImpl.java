package com.example.hotel.service.impl;


import com.example.hotel.dao.TypeDao;
import com.example.hotel.entity.TableModel;
import com.example.hotel.entity.Typeinfo;
import com.example.hotel.service.TypeService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired(required = false)
    private TypeDao typeDao;

    @Override
    public String typeOpe(String tname, Integer page, Integer limit, HttpServletRequest request) {
        if (tname == null || tname.equals("")){tname = null;}
        TableModel tableModel = new TableModel();
        tableModel.setCount(typeDao.getSum(tname));
        tableModel.setData(typeDao.typeOpe(limit,limit*(page-1),tname));

        return new Gson().toJson(tableModel);
    }

    @Override
    public String tname() {
        return new Gson().toJson(typeDao.tname());
    }

    @Override
    public String addType(Typeinfo typeinfo) {
        String result = "false";
        if (typeDao.getTypeinfo(typeinfo.getTname())!=null){
            result = "have";
        }else {
            if (typeDao.addType(typeinfo)>0){
                result = "true";
            }
        }
        return result;
    }
}
