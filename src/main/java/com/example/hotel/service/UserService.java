package com.example.hotel.service;

import com.example.hotel.entity.Userinfo;

import javax.servlet.http.HttpSession;

public interface UserService
{
	public abstract String checkAccount(String account);

	public abstract String reg(Userinfo userinfo);

	public abstract String log(String account, String password, HttpSession session);
}