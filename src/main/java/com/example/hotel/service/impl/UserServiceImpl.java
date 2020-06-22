package com.example.hotel.service.impl;

import com.example.hotel.dao.MenuDao;
import com.example.hotel.dao.UserDao;
import com.example.hotel.entity.Menu;
import com.example.hotel.entity.Userinfo;
import com.example.hotel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.servlet.http.HttpSession;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;

@Service
public class UserServiceImpl implements UserService
{
	@Autowired(required = false)
	private UserDao userDao;

	@Autowired(required = false)
	private MenuDao menuDao;

	@Override
	public String reg(Userinfo userinfo)
	{
		String str="no";
		userinfo.setUdate(new SimpleDateFormat("yyyy-MM-dd").format(new Date()));
		int n=userDao.reg(userinfo);
		if(n>0)
		{
			str="yes";
		}
		return str;
	}

	@Override
	public String log(String account, String password, HttpSession session)
	{
		String str="nobody";
		Userinfo userinfo=userDao.getUser(account);
		if(userinfo!=null)
		{
			str="no";
			if(userinfo.getPassword().equals(password))
			{
				session.setAttribute("user",userinfo);
				HashMap<String, ArrayList<Menu>> map=new HashMap<>();

				List<Menu> fathers=menuDao.getFathers(userinfo.getUrole());

				for(Menu menu :fathers)
				{
					ArrayList<Menu> sons=(ArrayList<Menu>) menuDao.getSons(menu.getMnum());
					map.put(menu.getMname(),sons);
				}

				session.setAttribute("menu",map);
				switch (userinfo.getUrole())
				{
					case "1" :
						str="yes2";
						break;
					default:
						str="yes";
						break;
				}
			}
		}
		return str;
	}

	@Override
	public String checkAccount(String account)
	{
		String str="no";
		Userinfo userinfo=userDao.getUser(account);
		if(userinfo==null)
		{
			str="yes";
		}
		return str;
	}
}