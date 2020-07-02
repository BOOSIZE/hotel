package com.example.hotel.dao;

import com.example.hotel.entity.Boardinfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
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
    public abstract int getSum();

    @Select("<script> SELECT * FROM boardinfo  " +
            "ORDER BY time desc LIMIT #{limit} OFFSET #{end}  </script>")
    public abstract List<Boardinfo> backBoardList(Integer limit, int end);


    @Delete("delete from boardinfo where id = #{id}")
    public abstract int deleteBoardById(Boardinfo boardinfo);


    @Insert("insert into boardinfo (content,operator,time) values (#{content},#{account},#{time})")
    public abstract int insertBoard(String account, String content, String time);

    @Select("SELECT * FROM boardinfo")
    public abstract List<Boardinfo> frontBoardList();
}
