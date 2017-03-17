package com.lvruan.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lvruan.common.MD5;
import com.lvruan.po.SetInfo;
import com.lvruan.po.UserInfo;
import com.lvruan.service.set.SetService;
import com.lvruan.service.user.UserService;

@Controller
@RequestMapping("back")
public class LoginController {

	@Autowired
	UserService userService;
	
	@Autowired
	SetService setService;
	
	@RequestMapping("login")
	public @ResponseBody Map<String,Object> login(HttpServletRequest request){
		Map<String,Object> msgMap = new HashMap<String,Object>();
		String nameStr = request.getParameter("uname").toString();
		if(nameStr.equals("")||"".equals(nameStr)){
			msgMap.put("result", "用户名不能为空");
			return msgMap;
		}
		String pwdStr = request.getParameter("upwd").toString();
		System.out.println(MD5.encryption(pwdStr)+"---");
		if(pwdStr.equals("")||"".equals(pwdStr)){
			msgMap.put("result", "密码不能为空");
			return msgMap;
		}
		UserInfo user = new UserInfo();
		user.setuName(nameStr);
		//在数据库验证
		user = userService.findByName(user);
		if(user!=null){
			if(user.getuPwd().equals(MD5.encryption(pwdStr))){
				msgMap.put("result", "success");
				HttpSession session = request.getSession();
				session.setAttribute("user", user);
				return msgMap;
			}else{
				msgMap.put("result", "用户名不存在或密码不正确");
				return msgMap;
			}
		}else{
			msgMap.put("result", "用户名不存在或密码不正确");
			return msgMap;
		}
	}
	
	@RequestMapping("index")
	public ModelAndView inde(HttpServletRequest request){
		ModelAndView model = new ModelAndView("admin/main/index");
		SetInfo set = setService.findSet();
		model.addObject("set",set);
		HttpSession session = request.getSession();
		session.setAttribute("set", set);
		/*
		 * 执行数据查询操作
		 * */
		return model;
	}
	
	@RequestMapping("exit")
	public ModelAndView exit(HttpServletRequest request){
		ModelAndView view = new ModelAndView("admin/login");
		HttpSession session = request.getSession();
		session.setAttribute("user", null);
		return view;
	}
	
}
