package com.example.hotel.dao;

import com.example.hotel.entity.Menu;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;

import java.util.List;

@Mapper
public interface MenuDao
{
	@Select("SELECT * FROM MENU WHERE UROLE=#{urole}")
	public abstract List<Menu> getFathers(String urole);

	@Select("SELECT * FROM MENU WHERE FNUM=#{num}")
	public abstract List<Menu> getSons(String num);
}