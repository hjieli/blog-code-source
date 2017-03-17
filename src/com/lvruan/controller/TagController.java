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
import com.lvruan.po.TagInfo;
import com.lvruan.service.tag.TagService;

@Controller
@RequestMapping("back")
public class TagController {
	
	@Autowired
    TagService tagService;
	
	@RequestMapping("tag/list")
	public ModelAndView findAll(HttpServletRequest request){
		ModelAndView view = new ModelAndView("admin/main/tagManager/list");
		List<TagInfo> tag = tagService.findAll();
		String jsondata = JSONArray.toJSONString(tag);
		view.addObject("jsondata", jsondata);
		return view;
	}
	
	@RequestMapping("tag/add")
	public @ResponseBody Map<String, Object> add(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		TagInfo t = new TagInfo();
		String tag = request.getParameter("name");
		t.settName(tag);
		tagService.insert(t);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("tag/del")
	public @ResponseBody Map<String, Object> del(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id");
		tagService.deleteByPrimaryKey(Integer.parseInt(id));
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("tag/edit_list")
	public @ResponseBody Map<String, Object> edit_list(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		String id = request.getParameter("id");
		TagInfo tag = tagService.selectByPrimaryKey(Integer.parseInt(id));
		map.put("result", "success");
		map.put("id", tag.gettName());
		return map;
	}
	
	@RequestMapping("tag/edit")
	public @ResponseBody Map<String, Object> edit(HttpServletRequest request){
		Map<String, Object> map = new HashMap<String, Object>();
		TagInfo t = new TagInfo();
		String id = request.getParameter("id");
		String name = request.getParameter("name");
		t.setId(Integer.parseInt(id));
		t.settName(name);
		tagService.updateByPrimaryKey(t);
		map.put("result", "success");
		return map;
	}
}
