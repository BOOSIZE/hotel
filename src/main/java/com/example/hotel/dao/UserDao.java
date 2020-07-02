package com.example.hotel.dao;

import com.example.hotel.entity.Userinfo;
import org.apache.ibatis.annotations.*;
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
	public abstract int getSum(String urole);

	@Select("<script> SELECT * FROM userinfo WHERE urole!=1 " +
			"<when test='urole!=null'> AND urole = #{urole}</when>" +
			"ORDER BY udate desc LIMIT #{limit} OFFSET #{end}  </script>")
	public abstract List<Userinfo> userOpe(Integer limit, int end, String urole);

	@Delete("delete from userinfo where account = #{account}")
	public abstract int delUser(Userinfo userinfo);

	@Update("UPDATE USERINFO SET AMT =#{money} WHERE ACCOUNT=#{account}")
	public  abstract int addMoney(String money,String account);

	@Update("UPDATE USERINFO SET PASSWORD =#{pass} WHERE ACCOUNT=#{account}")
	public abstract int updatePass(String pass,String account);
}