package com.example.hotel.dao;

import com.example.hotel.entity.Roominfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

@Mapper
public interface RoomDao {

    @Select("<script> SELECT COUNT(*) FROM typeinfo,roominfo WHERE typeinfo.tid=roominfo.tid " +
            "<when test='tname!=null'> AND typeinfo.tname =#{tname}</when></script>")
    int getSum(String tname);

    @Select("<script> SELECT * FROM typeinfo,roominfo WHERE typeinfo.tid=roominfo.tid " +
            "<when test='tname!=null'> AND typeinfo.tname = #{tname}</when>" +
            " LIMIT #{limit} OFFSET #{end}  </script>")
    List<Roominfo> roomOpe(Integer limit, int end, String tname);

    @Select("select * from roominfo where rnum = #{rnum} ")
    Roominfo getRoominfo(String rnum);

    @Insert("INSERT INTO roominfo (rnum, rtype, tid)" +
            " VALUES (#{rnum},#{rtype},#{tid})")
    int addRoom(Roominfo roominfo);

    @Update("<script> " +
            "update roominfo set " +
            "<trim suffixOverrides=','>" +
            "<if test = 'rnum != null'> " +
            " rnum = #{rnum}, " +
            "</if> " +
            "<if test = 'tid != null'> " +
            " tid = #{tid} " +
            "</if> " +
            "</trim>" +
            "where rid = #{rid} " +
            "</script>")
    int updateRoom(Roominfo roominfo);
}
