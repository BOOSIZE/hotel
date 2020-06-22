package com.example.hotel.controller;

import com.example.hotel.entity.Userinfo;
import com.example.hotel.service.UserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

@Controller
@RequestMapping("/user/")
public class UserController
{
	@Autowired
	private UserService userServiceImpl;

	@RequestMapping("checkAccount")
	@ResponseBody
	public String checkAccount(String account)
	{
		return userServiceImpl.checkAccount(account);
	}

	@RequestMapping("reg")
	@ResponseBody
	public String reg(Userinfo userinfo)
	{
		return userServiceImpl.reg(userinfo);
	}

	@RequestMapping("log")
	@ResponseBody
	public String log(String account, String password, HttpSession session)
	{
		return userServiceImpl.log(account, password, session);
	}
	@RequestMapping("userOpe")
	@ResponseBody
	public String userOpe(String urole, Integer page, Integer limit, HttpServletRequest request)
	{

		return userServiceImpl.userOpe(urole,page,limit,request);
	}

}