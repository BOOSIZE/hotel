package com.example.hotel.dao;

import com.example.hotel.entity.Orderinfo;
import com.example.hotel.entity.Userinfo;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

/**
 * @author 翁佳伟
 * @create 2020-06-25 21:25
 */
@Mapper
public interface OrderInfoDao {

    @Select("<script> SELECT COUNT(*) FROM orderinfo WHERE otype='预定' </script>")
    int getSum();

    @Select("<script> SELECT * FROM orderinfo WHERE otype='预定' " +
            "ORDER BY otime desc LIMIT #{limit} OFFSET #{end}  </script>")
    List<Orderinfo> alreadyList(Integer limit, int end);

    @Select("<script> SELECT COUNT(*) FROM orderinfo WHERE otype='入住' </script>")
    int getPreSum();

    @Select("<script> SELECT * FROM orderinfo WHERE otype='入住' " +
            "ORDER BY oend desc LIMIT #{limit} OFFSET #{end}  </script>")
    List<Orderinfo> preList(Integer limit, int end);

    @Select("<script> SELECT COUNT(*) FROM orderinfo WHERE account=#{account} </script>")
    int getAllSum(@Param("account") String account);

    @Select("<script> SELECT * FROM orderinfo WHERE account=#{account} " +
            "ORDER BY otime desc LIMIT #{limit} OFFSET #{end}  </script>")
    List<Orderinfo> allList(Integer limit, int end, @Param("account") String account);
}