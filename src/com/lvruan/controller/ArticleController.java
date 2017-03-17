package com.lvruan.controller;

import java.util.Date;
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
import com.lvruan.po.ArticleInfo;
import com.lvruan.po.ProjectInfo;
import com.lvruan.po.TypeInfo;
import com.lvruan.service.article.ArticleService;
import com.lvruan.service.type.TypeService;

@Controller
@RequestMapping("back")
public class ArticleController {
	
	@Autowired
	ArticleService articleService;
	@Autowired
	TypeService typeService;

	@RequestMapping("article/list")
	public ModelAndView list(HttpServletRequest request){
		ModelAndView model = new ModelAndView("admin/main/articleManager/list");
		List<ArticleInfo> list = articleService.findAll();
		List<TypeInfo> Type = typeService.findAll();
		String jsonStr = JSONArray.toJSON(list).toString();
		String jsontype = JSONArray.toJSONString(Type);
		System.out.println("-------\r\n"+jsonStr);
		model.addObject("jsondata",jsonStr);
		model.addObject("jsonType", jsontype);
		return model;
	}
	
	@RequestMapping("article/select_like")   //查询搜索
	public ModelAndView findLike(HttpServletRequest request){
		ModelAndView view = new ModelAndView("admin/main/articleManager/list");
		String name = request.getParameter("title");
		System.out.println(name);
		List<ArticleInfo> list = articleService.find_like(name);
		List<TypeInfo> type=typeService.findAll();   //分类信息
		String jsontype=JSONArray.toJSONString(type);
		String jsonStr = JSONArray.toJSONString(list).toString();
		view.addObject("jsonType", jsontype);
		view.addObject("jsondata", jsonStr);
		view.addObject("title", name);
		return view;
	}
	
	@RequestMapping("article/add")
	public @ResponseBody Map<String,Object> add(HttpServletRequest request){
		Map<String,Object> msgMap = new HashMap<String, Object>();
		ArticleInfo article = new ArticleInfo();
		article.setaTitle(request.getParameter("title"));
		article.setaDescripte(request.getParameter("descript"));
		article.setaDatetime(new Date());
		article.setaCover("#");
		article.setaContent(request.getParameter("content"));
		article.setaTypeid(1);
		article.setaTags(request.getParameter("tag"));
		article.setaViewnum(700);
		
		articleService.insertSelective(article);
		msgMap.put("result", "success");
		return msgMap;
	}
	
	@RequestMapping("article/del")   /*删除文章*/
	public @ResponseBody Map<String, Object> del(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id=request.getParameter("id");
		articleService.deleteByPrimaryKey(Integer.parseInt(id));
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("article/edit")   /*修改文章内容*/
	public @ResponseBody Map<String, Object> edit(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id = request.getParameter("id");
		String title=request.getParameter("title");
		String interest=request.getParameter("interest");
		String descripte=request.getParameter("descripte");
		String content=request.getParameter("content");
		String tag=request.getParameter("tags");
		System.out.println("descripte:"+descripte);
		ArticleInfo p=new ArticleInfo();
		p.setaTitle(title);
		p.setId(Integer.parseInt(id));
		p.setaTypeid(Integer.parseInt(interest));
		p.setaDescripte(descripte);
		p.setaContent(content);
		p.setaTags(tag);
		articleService.updateByPrimaryKeySelective(p);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("article/edit_list")    /*获取点击文章的相关内容*/
	public ModelAndView findEdit(HttpServletRequest request){
		ModelAndView view=new ModelAndView("admin/main/articleManager/edit");
		String id=request.getParameter("id");
		System.out.println(id);
		List<ArticleInfo> info = articleService.selectByPrimaryKey1(Integer.parseInt(id));
	    view.addObject("list", info);
	    int str = 0;
	    for (ArticleInfo a : info) {
			str = a.getaTypeid();
		}
	    List<TypeInfo> type=typeService.findAll();
	    String jsontype=JSONArray.toJSONString(type);
		view.addObject("jsontype", jsontype);
		view.addObject("str", str);
	    return view;
	}
}
