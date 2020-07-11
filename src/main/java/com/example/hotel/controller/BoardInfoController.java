package com.example.hotel.controller;

import com.example.hotel.entity.Boardinfo;
import com.example.hotel.service.BoardInfoService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

/**
 * @author 翁佳伟
 * @create 2020-06-29 9:46
 */
@Controller
@RequestMapping("/board")
public class BoardInfoController {

    @Autowired
    BoardInfoService boardInfoService;

    @RequestMapping("/back/list")
    @ResponseBody
    public String backBoardList(Integer page, Integer limit) {
        return boardInfoService.backBoardList(page, limit);
    }

    @RequestMapping("/front/list")
    @ResponseBody
    public Map<String, Object> frontBoardList() {
        Map<String, Object> map = new HashMap<String, Object>();
        List<Boardinfo> boardinfos = boardInfoService.frontBoardList();
        map.put("boardinfos", boardinfos);
        return map;
    }

    @RequestMapping("/back/delete")
    @ResponseBody
    public String deleteBoardById(Boardinfo boardinfo) {
        return boardInfoService.deleteBoardById(boardinfo);
    }

    @RequestMapping("/back/insert")
    @ResponseBody
    public String insertBoard(String account, String content)
    {
        return boardInfoService.insertBoard(account, content);



    }
}
