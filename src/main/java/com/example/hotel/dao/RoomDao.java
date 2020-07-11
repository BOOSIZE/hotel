package com.example.hotel.dao;

import com.example.hotel.entity.Roominfo;
import org.apache.ibatis.annotations.*;

import java.beans.IntrospectionException;
import java.util.List;

@Mapper
public interface RoomDao {

    @Select("<script> SELECT COUNT(*) FROM typeinfo,roominfo WHERE typeinfo.tid=roominfo.tid " +
            "<when test='tname!=null'> AND typeinfo.tname =#{tname}</when></script>")
    public abstract int getSum(String tname);

    @Select("<script> SELECT * FROM typeinfo,roominfo WHERE typeinfo.tid=roominfo.tid " +
            "<when test='tname!=null'> AND typeinfo.tname = #{tname}</when>" +
            " LIMIT #{limit} OFFSET #{end}  </script>")
    public abstract List<Roominfo> roomOpe(Integer limit, int end, String tname);

    @Select("select * from roominfo where rnum = #{rnum} ")
    public abstract Roominfo getRoominfo(String rnum);

    @Insert("INSERT INTO roominfo (rnum, rtype, tid)" +
            " VALUES (#{rnum},#{rtype},#{tid})")
    public abstract int addRoom(Roominfo roominfo);

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
    public abstract int updateRoom(Roominfo roominfo);

    @Delete("delete from roominfo where rid = #{rid}")
    public abstract int deleteRoom(Roominfo roominfo);

    @Update("UPDATE ROOMINFO SET RTYPE ='未入住' WHERE RID=#{rid}")
    int updateState(Long rid);
}
