package com.example.hotel.dao;

import com.example.hotel.entity.OrderDetails;
import com.example.hotel.entity.Orderinfo;
import com.example.hotel.entity.Userinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;

import java.util.List;

/**
 * @author 翁佳伟
 * @create 2020-06-25 21:25
 */
@Mapper
public interface OrderInfoDao {

    @Select("<script> SELECT COUNT(*) FROM orderinfo WHERE otype='入住' </script>")
    public abstract int getSum();

    @Select("<script> SELECT * FROM orderinfo WHERE otype='入住' " +
            "ORDER BY otime desc LIMIT #{limit} OFFSET #{end}  </script>")
    public abstract List<Orderinfo> alreadyList(Integer limit, int end);

    @Select("<script> SELECT COUNT(*) FROM orderinfo WHERE otype='预定' </script>")
    public abstract int getPreSum();

    @Select("<script> SELECT * FROM orderinfo WHERE otype='预定' " +
            "ORDER BY oend desc LIMIT #{limit} OFFSET #{end}  </script>")
    public abstract List<Orderinfo> preList(Integer limit, int end);

    @Select("<script> SELECT COUNT(*) FROM orderinfo WHERE account=#{account} </script>")
    public abstract int getAllSum(@Param("account") String account);

    @Select("<script> SELECT * FROM orderinfo WHERE account=#{account} "
            + " <when test='urole!=null'> AND otype = #{urole}</when> " +
            "ORDER BY otime desc LIMIT #{limit} OFFSET #{end}  </script>")
    public abstract List<Orderinfo> allList(Integer limit, int end, @Param("account") String account, String urole);

    @Update("update orderinfo set otype='入住' where oid=#{iod}")
    public abstract Integer checkIn(long oid);

    @Update("update orderinfo set otype='退房' where oid=#{iod}")
    public abstract Integer back(long oid);

    @Select("SELECT o.ACCOUNT as account,\n" +
            "       p.PNAME   as pname,\n" +
            "       p.PCODE   as pcode,\n" +
            "       p.PSEX    as psex,\n" +
            "       r.RNUM    as rnum,\n" +
            "       r.RTYPE    as rtype\n" +
            "FROM orderinfo o,\n" +
            "     roominfo r,\n" +
            "     typeinfo t,\n" +
            "     peopleinfo p\n" +
            "WHERE o.RID = r.RID\n" +
            "  and r.TID = t.TID\n" +
            "  and o.OID = p.OID and o.OID=#{oid}")
    OrderDetails detail(String oid);
}
