package com.example.hotel.dao;

import com.example.hotel.entity.Roominfo;
import com.example.hotel.entity.Typeinfo;
import org.apache.ibatis.annotations.*;

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

    @Delete("delete from typeinfo where tid = #{tid}")
    public abstract int deleteType(Typeinfo typeinfo);

    @Select("<script> SELECT * FROM TYPEINFO WHERE 1=1" +
            "<when test='tname!=null'> AND TNAME LIKE CONCAT ('%',#{tname},'%') </when>" +
            "<when test='people!=null'> AND TPEOPLE =#{people}</when>" +
            "<when test='end!=null'> AND AMT BETWEEN #{begin} AND #{end} </when> " +
            "<when test='begin!=null and end==null'> AND AMT >= #{begin} </when></script>")
    public abstract List<Typeinfo> getList(String tname,String people,Integer begin,Integer end);

    @Select("SELECT * FROM TYPEINFO WHERE TID=#{tid}")
    Typeinfo getType(Long tid);

}
