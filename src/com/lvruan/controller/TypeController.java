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
import com.lvruan.po.TypeInfo;
import com.lvruan.service.type.TypeService;

@Controller
@RequestMapping("back")
public class TypeController {

	@Autowired
    TypeService service; 
	
	@RequestMapping("type/add")
	public @ResponseBody Map<String, Object> add(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String name=request.getParameter("name");
		TypeInfo t=new TypeInfo();
		t.settName(name);
		service.insert(t);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("type/list")
	public ModelAndView list(HttpServletRequest request){
		ModelAndView view=new ModelAndView("admin/main/typeManager/list");
		List<TypeInfo> list=service.findAll();
		String jsonStr=JSONArray.toJSONString(list);
		view.addObject("jsondata", jsonStr);
		return view;
	}
	
	@RequestMapping("type/del")
	public @ResponseBody Map<String, Object> del(HttpServletRequest request){
		Map<String , Object> map=new HashMap<String, Object>();
		String id=request.getParameter("id");
		service.deleteByPrimaryKey(Integer.parseInt(id));
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("type/edit_list")
	public @ResponseBody Map<String, Object> edit_list(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id=request.getParameter("id");
		TypeInfo tp=service.selectByPrimaryKey(Integer.parseInt(id));
		System.out.println(tp.gettName());
		map.put("result", "success");
		map.put("id", tp.gettName());
		return map;
	}
	
	@RequestMapping("type/edit")
	public @ResponseBody Map<String, Object> edit(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id=request.getParameter("id");
		System.out.println(id);
		String name=request.getParameter("name");
		System.out.println(name);
		TypeInfo ty=new TypeInfo();
		ty.setId(Integer.parseInt(id));
		ty.settName(name);
		service.updateByPrimaryKeySelective(ty);
		map.put("result", "success");
		return map;
	}
}
