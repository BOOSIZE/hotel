package com.example.hotel.service.impl;


import com.example.hotel.dao.RoomDao;
import com.example.hotel.dao.TypeDao;
import com.example.hotel.entity.Roominfo;
import com.example.hotel.entity.TableModel;
import com.example.hotel.entity.Typeinfo;
import com.example.hotel.service.TypeService;
import com.google.gson.Gson;
import org.apache.ibatis.annotations.Insert;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

@Service
public class TypeServiceImpl implements TypeService {

    @Autowired(required = false)
    private TypeDao typeDao;

    @Autowired(required = false)
    private RoomDao roomDao;

    @Override
    public String typeOpe(String tname, Integer page, Integer limit, HttpServletRequest request) {
        if (tname == null || tname.equals("")) {
            tname = null;
        }
        TableModel tableModel = new TableModel();
        tableModel.setCount(typeDao.getSum(tname));
        tableModel.setData(typeDao.typeOpe(limit, limit * (page - 1), tname));

        return new Gson().toJson(tableModel);
    }

    @Override
    public String tname() {
        return new Gson().toJson(typeDao.tname());
    }

    @Override
    public String addType(Typeinfo typeinfo) {
        String result = "false";
        if (typeDao.getTypeinfo(typeinfo.getTname()) != null) {
            result = "have";
        } else {
            if (typeDao.addType(typeinfo) > 0) {
                result = "true";
            }
        }
        return result;
    }

    @Override
    public Typeinfo getTypeinfo(String tname) {
        return typeDao.getTypeinfo(tname);
    }

    @Override
    public String updateType(Typeinfo typeinfo) {
        String result = "false";

        if (typeDao.updateType(typeinfo) > 0) {
            result = "true";
        }

        return result;
    }

    @Override
    public String deleteType(Typeinfo typeinfo) {
        String result = "false";
        if (roomDao.getSum(typeinfo.getTname()) > 0) {
            result = "have";
        }else {
           if (typeDao.deleteType(typeinfo) > 0){
               result = "true";
           }
        }
        return result;
    }

    @Override
    public String getList(HttpSession session)
    {
        String str="no";

        List<Typeinfo> list=(List) session.getAttribute("roomList");
        if(list==null)
        {
            list=typeDao.getList(null,null,null,null);

            session.setAttribute("roomList",list);

            str="yes";
        }

        return str;
    }

    @Override
    public String render(HttpSession session ,String tname,String people,String amt)
    {
        if(people.equals("不限"))
        {
            people=null;
        }

        Integer begin=null;
        Integer end=null;



        switch (amt)
        {
            case "1" :
                begin=1;
                end=99;
                break;

            case "2" :
                begin=100;
                end=199;
                break;

            case "3" :
                begin=200;
                end=499;
                break;

            case "4" :
                begin=500;
                break;
        }


        List<Typeinfo> list=typeDao.getList(tname,people,begin,end);
        session.setAttribute("roomList",list);
        session.setAttribute("tname",tname);
        session.setAttribute("people",people);
        session.setAttribute("amt",amt);
        return "yes";
    }

    @Override
    public String getType(Long tid, HttpSession session)
    {

        Typeinfo typeinfo=typeDao.getType(tid);

        int count=roomDao.getCount(tid);

        typeinfo.setSum(count+"");

        session.setAttribute("type",typeinfo);

        return "room";
    }

    @Override
    public Typeinfo getTypeinfoByid(Long tid) {
        return typeDao.getType(tid);
    }

}
