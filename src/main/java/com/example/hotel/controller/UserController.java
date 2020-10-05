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

	@RequestMapping("addUser")
	@ResponseBody
	public String addUser(Userinfo userinfo)
	{
		return userServiceImpl.addUser(userinfo);
	}


	@RequestMapping("delUser")
	@ResponseBody
	public String delUser(Userinfo userinfo)
	{

		return userServiceImpl.delUser(userinfo);
	}

	@RequestMapping("addMoney")
	@ResponseBody
	public String addMoney(HttpSession session,String money)
	{
		return userServiceImpl.addMoney(session, money);
	}

	@RequestMapping("updatePass")
	@ResponseBody
	public String updatePass(HttpSession session,String pass)
	{
		return userServiceImpl.updatePass(session, pass);
	}

	@RequestMapping("getMoney")
	@ResponseBody
	public String getMoney(HttpSession session)
	{
		Userinfo userinfo=(Userinfo) session.getAttribute("user");
		return userinfo.getAmt();
	}
}