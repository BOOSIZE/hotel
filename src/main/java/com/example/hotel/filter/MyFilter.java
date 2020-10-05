package com.example.hotel.filter;


import com.example.hotel.entity.Userinfo;

import javax.servlet.*;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;

@WebFilter(filterName="myFilter",urlPatterns={"/*"})
public class MyFilter implements Filter
{
	public MyFilter()
	{}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException
	{

	}

	@Override
	public void destroy()
	{

	}

	@Override
	public void doFilter(ServletRequest servletRequest, ServletResponse servletResponse, FilterChain filterChain) throws IOException, ServletException
	{
		HttpServletRequest req=(HttpServletRequest)servletRequest;
		HttpServletResponse resp=(HttpServletResponse)servletResponse;
		String servletPath = req.getServletPath();


		if(servletPath.endsWith("log") || servletPath.endsWith("reg") || servletPath.endsWith("nomain")
			|| servletPath.contains("layui") || servletPath.endsWith(".css") || servletPath.endsWith(".js")
				|| servletPath.endsWith(".jpg") || servletPath.endsWith(".png") || servletPath.endsWith("checkAccount")
				|| servletPath.endsWith("getList") || servletPath.endsWith("render")
		)
		{
			filterChain.doFilter(servletRequest, servletResponse);
		}

		else
		{
			Userinfo userinfo=(Userinfo)req.getSession().getAttribute("user");
			if(userinfo!=null)
			{
				filterChain.doFilter(servletRequest, servletResponse);
			}
			else
			{
				resp.sendRedirect(req.getContextPath()+"/go/to/log");
			}
		}


	}
}