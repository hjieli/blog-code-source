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

import com.lvruan.po.SetInfo;
import com.lvruan.service.set.SetService;

@Controller
@RequestMapping("back")
public class SetController {
	
	@Autowired
	SetService setService;
	
	@RequestMapping("set/list")
	public ModelAndView list(HttpServletRequest request){
		ModelAndView model = new ModelAndView("admin/main/setManager/list");
		HttpSession session = request.getSession();
		SetInfo set = (SetInfo)session.getAttribute("set");
		if(set==null){
			SetInfo setNew = setService.findSet();
			model.addObject("set",setNew);
		}else{
			model.addObject("set",set);
		}
		return model;
	}
	
	@RequestMapping("set/update")
	public @ResponseBody Map<String,Object> update(HttpServletRequest request){
		Map<String,Object> msgMap = new HashMap<String,Object>();
		SetInfo set = new SetInfo();
		if(request.getParameter("name").equals("")||request.getParameter("name")==null){
			msgMap.put("result", "网站昵称不能为空");
			return msgMap;
		}
		if(request.getParameter("author").equals("")||request.getParameter("author")==null){
			msgMap.put("result", "网站作者不能为空");
			return msgMap;
		}
		if(request.getParameter("bottomStr").equals("")||request.getParameter("bottomStr")==null){
			msgMap.put("result", "网站底部文字不能为空");
			return msgMap;
		}
		set.setsName(request.getParameter("name"));
		set.setsAuthor(request.getParameter("author"));
		set.setsBottomstr(request.getParameter("bottomStr"));
		set.setsKeyword(request.getParameter("keywords"));
		set.setsDescripte(request.getParameter("descript"));
		set.setId(1);
		if(setService.updateByPrimaryKeySelective(set)!=1){
			msgMap.put("result", "更新失败");
			return msgMap;
		}
		HttpSession session = request.getSession();
		session.setAttribute("set", set);
		msgMap.put("result", "success");
		return msgMap;
	}
}
