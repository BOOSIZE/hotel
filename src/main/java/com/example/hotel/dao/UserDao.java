package com.example.hotel.dao;

import com.example.hotel.entity.Userinfo;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.MappedJdbcTypes;

import javax.annotation.ManagedBean;
import javax.jws.soap.SOAPBinding;
import java.util.List;

@Mapper
public interface UserDao
{
	@Insert("INSERT INTO USERINFO (ACCOUNT, PASSWORD, UNAME, USEX, AMT,UROLE, UDATE)" +
			" VALUES (#{account},#{password},#{uname},#{usex},'0',#{urole},#{udate})")
	public abstract int reg(Userinfo userinfo);

	@Select("SELECT * FROM USERINFO WHERE ACCOUNT =#{account}")
	public abstract Userinfo getUser(String account);

	@Select("<script> SELECT COUNT(*) FROM userinfo WHERE urole!=1 " +
			"<when test='urole!=null'> AND urole =#{urole}</when></script>")
    int getSum(String urole);

	@Select("<script> SELECT * FROM userinfo WHERE urole!=1 " +
			"<when test='urole!=null'> AND urole = #{urole}</when>" +
			"ORDER BY udate desc LIMIT #{limit} OFFSET #{end}  </script>")
	List<Userinfo> userOpe(Integer limit, int end, String urole);

	@Delete("delete from userinfo where account = #{account}")
	int delUser(Userinfo userinfo);
}