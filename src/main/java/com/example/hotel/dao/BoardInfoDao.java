package com.example.hotel.dao;

import com.example.hotel.entity.Boardinfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.Date;
import java.util.List;

/**
 * @author 翁佳伟
 * @create 2020-06-29 11:35
 */
@Mapper
public interface BoardInfoDao {

    @Select("<script> SELECT COUNT(*) FROM boardinfo </script>")
    int getSum();

    @Select("<script> SELECT * FROM boardinfo  " +
            "ORDER BY time desc LIMIT #{limit} OFFSET #{end}  </script>")
    List<Boardinfo> backBoardList(Integer limit, int end);


    @Delete("delete from boardinfo where id = #{id}")
    int deleteBoardById(Boardinfo boardinfo);


    @Delete("insert into boardinfo (content,operator,time) values (#{content},#{account},#{time})")
    int insertBoard(String account, String content, String time);

    @Select("SELECT * FROM boardinfo")
    List<Boardinfo> frontBoardList();
}
