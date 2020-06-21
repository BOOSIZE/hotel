package com.example.hotel.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/go/")
public class GoController
{
	/**
	 *
	 * @param path:路径
	 * @return
	 */
	@RequestMapping("to/{path}")
	public String to(@PathVariable("path") String path)
	{
		return path;
	}
}