package com.example.hotel.dao;

import com.example.hotel.entity.Userinfo;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.type.MappedJdbcTypes;

import javax.annotation.ManagedBean;
import javax.jws.soap.SOAPBinding;

@Mapper
public interface UserDao
{
	@Insert("INSERT INTO USERINFO (ACCOUNT, PASSWORD, UNAME, USEX, AMT,UROLE, UDATE)" +
			" VALUES (#{account},#{password},#{uname},#{usex},'0','1',#{udate})")
	public abstract int reg(Userinfo userinfo);

	@Select("SELECT * FROM USERINFO WHERE ACCOUNT =#{account}")
	public abstract Userinfo getUser(String account);

}