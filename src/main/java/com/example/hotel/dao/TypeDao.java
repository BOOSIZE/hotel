package com.example.hotel.dao;

import com.example.hotel.entity.Typeinfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface TypeDao {

    @Select("<script> SELECT COUNT(*) FROM typeinfo WHERE 1=1 " +
            "<when test='tname!=null'> AND tname  LIKE CONCAT('%',#{tname},'%')</when></script>")
    int getSum(String tname);

    @Select("<script> SELECT * FROM typeinfo WHERE 1=1 " +
            "<when test='tname!=null'> AND tname  LIKE CONCAT('%',#{tname},'%')</when>" +
            " LIMIT #{limit} OFFSET #{end}  </script>")
    List<Typeinfo> typeOpe(Integer limit, int end, String tname);

    @Select("select tname from typeinfo")
    List<String> tname();

    @Select("select * from typeinfo where tname = #{tname} ")
    Typeinfo getTypeinfo(String tname);

    @Insert("INSERT INTO typeinfo (tname, img, tpeople, amt, tcount)" +
            " VALUES (#{tname},#{img},#{tpeople},#{amt},#{tcount})")
    int addType(Typeinfo typeinfo);

    @Update("update typeinfo set tname = #{tname},img = #{img},tpeople = #{tpeople},amt = #{amt},tcount = #{tcount} " +
            "where tid = #{tid}")
    int updateType(Typeinfo typeinfo);
}
