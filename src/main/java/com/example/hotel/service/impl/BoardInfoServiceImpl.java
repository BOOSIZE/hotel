package com.example.hotel.service.impl;

import com.example.hotel.dao.BoardInfoDao;
import com.example.hotel.entity.Boardinfo;
import com.example.hotel.entity.TableModel;
import com.example.hotel.service.BoardInfoService;
import com.google.gson.Gson;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

/**
 * @author 翁佳伟
 * @create 2020-06-29 11:19
 */
@Service
public class BoardInfoServiceImpl implements BoardInfoService {

    @Autowired(required = false)
    BoardInfoDao boardInfoDao;

    @Override
    public String backBoardList(Integer page, Integer limit) {
        TableModel tableModel = new TableModel();
        tableModel.setCount(boardInfoDao.getSum());
        tableModel.setData(boardInfoDao.backBoardList(limit, limit * (page - 1)));
        return new Gson().toJson(tableModel);
    }

    @Override
    public String deleteBoardById(Boardinfo boardinfo) {
        String result = "false";
        if (boardInfoDao.deleteBoardById(boardinfo) > 0) {
            result = "true";
        }
        return result;
    }

    @Override
    public String insertBoard(String account, String content) {
        String result = "false";
        SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
        String time = simpleDateFormat.format(new Date());
        if (boardInfoDao.insertBoard(account, content, time) > 0) {
            result = "true";
        }
        return result;
    }

    @Override
    public List<Boardinfo> frontBoardList() {
        return boardInfoDao.frontBoardList();
    }
}
