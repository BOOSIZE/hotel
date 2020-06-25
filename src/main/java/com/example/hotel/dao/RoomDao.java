package com.example.hotel.dao;

import com.example.hotel.entity.Typeinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface RoomDao {

    @Select("<script> SELECT COUNT(*) FROM typeinfo WHERE 1=1 " +
            "<when test='tname!=null'> AND tname =#{tname}</when></script>")
    int getSum(String tname);

    @Select("<script> SELECT * FROM typeinfo WHERE 1=1 " +
            "<when test='tname!=null'> AND tname = #{tname}</when>" +
            " LIMIT #{limit} OFFSET #{end}  </script>")
    List<Typeinfo> roomOpe(Integer limit, int end, String tname);

    @Select("select distinct tname from typeinfo")
    List<String> tname();
}
