package com.example.hotel.service;

import com.example.hotel.entity.Boardinfo;

import java.util.List;

/**
 * @author 翁佳伟
 * @create 2020-06-29 11:18
 */
public interface BoardInfoService {


    public abstract String backBoardList(Integer page, Integer limit);

    public abstract String deleteBoardById(Boardinfo boardinfo);

    public abstract String insertBoard(String account, String content);

    public abstract List<Boardinfo> frontBoardList();
}
