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
    public abstract int getSum(String tname);

    @Select("<script> SELECT * FROM typeinfo WHERE 1=1 " +
            "<when test='tname!=null'> AND tname  LIKE CONCAT('%',#{tname},'%')</when>" +
            " LIMIT #{limit} OFFSET #{end}  </script>")
    public abstract List<Typeinfo> typeOpe(Integer limit, int end, String tname);

    @Select("select tname from typeinfo")
    public abstract List<String> tname();

    @Select("select * from typeinfo where tname = #{tname} ")
    public abstract Typeinfo getTypeinfo(String tname);

    @Insert("INSERT INTO typeinfo (tname, img, tpeople, amt, tcount)" +
            " VALUES (#{tname},#{img},#{tpeople},#{amt},#{tcount})")
    public abstract int addType(Typeinfo typeinfo);

    @Update("update typeinfo set tname = #{tname},img = #{img},tpeople = #{tpeople},amt = #{amt},tcount = #{tcount} " +
            "where tid = #{tid}")
    public abstract int updateType(Typeinfo typeinfo);
}
