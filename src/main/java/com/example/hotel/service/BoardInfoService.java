package com.example.hotel.service;

import com.example.hotel.entity.Boardinfo;

import java.util.List;

/**
 * @author 翁佳伟
 * @create 2020-06-29 11:18
 */
public interface BoardInfoService {


    String backBoardList(Integer page, Integer limit);

    String deleteBoardById(Boardinfo boardinfo);

    String insertBoard(String account, String content);

    List<Boardinfo> frontBoardList();
}
