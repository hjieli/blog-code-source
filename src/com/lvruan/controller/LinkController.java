package com.lvruan.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSONArray;
import com.lvruan.po.LinkInfo;
import com.lvruan.service.link.LinkService;

@Controller
@RequestMapping("back")
public class LinkController {
	
	@Autowired
	LinkService linkService;

	@RequestMapping("link/list")
	public ModelAndView list(HttpServletRequest request){
		ModelAndView model = new ModelAndView("admin/main/linkManager/list");
		List<LinkInfo> list = linkService.findAll();
		String jsonStr = JSONArray.toJSON(list).toString();
		System.out.println("-------\r\n"+jsonStr);
		model.addObject("jsondata",jsonStr);
		return model;
	}
	
	@RequestMapping("link/add")
	public @ResponseBody Map<String,Object> add(HttpServletRequest request){
		Map<String,Object> msgMap = new HashMap<String, Object>();
		LinkInfo link = new LinkInfo();
		link.setlUrl(request.getParameter("lUrl"));
		link.setlName(request.getParameter("lName"));
		link.setlSort(Integer.parseInt(request.getParameter("lSort")));
		
		linkService.insertSelective(link);
		msgMap.put("result", "success");
		return msgMap;
	}
	
	@RequestMapping("link/edit_list")
	public ModelAndView findEdit(HttpServletRequest request){
		ModelAndView view=new ModelAndView("admin/main/linkManager/edit");
		String id=request.getParameter("id");
		System.out.println(id);
		LinkInfo info=linkService.selectByPrimaryKey(Integer.parseInt(id));
	    view.addObject("list", info);
	    return view;
	}
	
	@RequestMapping("link/del")
	public @ResponseBody Map<String, Object> del(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id=request.getParameter("id");
		System.out.println(id);
		linkService.deleteByPrimaryKey(Integer.parseInt(id));
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("link/edit")
	public @ResponseBody Map<String, Object> edit(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id = request.getParameter("id");
		String lUrl=request.getParameter("lUrl");
		String lName=request.getParameter("lName");
		String lSort=request.getParameter("lSort");
		LinkInfo p=new LinkInfo();
		p.setId(Integer.parseInt(id));
		p.setlUrl(lUrl);
		p.setlSort(Integer.parseInt(lSort));
		p.setlName(lName);
		linkService.updateByPrimaryKeySelective(p);
		map.put("result", "success");
		return map;
	}
	
}
