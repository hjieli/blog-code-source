package com.lvruan.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.lvruan.po.ArticleInfo;
import com.lvruan.po.LinkInfo;
import com.lvruan.po.SetInfo;
import com.lvruan.po.TagInfo;
import com.lvruan.service.article.ArticleService;
import com.lvruan.service.link.LinkService;
import com.lvruan.service.set.SetService;
import com.lvruan.service.tag.TagService;

@Controller
public class WebController {
	@Autowired
	ArticleService articleService;
	
	@Autowired
	TagService tagService;
	
	@Autowired
	SetService setService;
	
	@Autowired
	LinkService linkService;
	@RequestMapping("index")
	public ModelAndView index(){
		ModelAndView model = new ModelAndView("index");
//		List<ArticleInfo> articleList = articleService.findFiveObject();
//		SetInfo set = setService.findSet();//��վ��Ϣ
//		int count = articleService.findCount();
//		model.addObject("articleList",articleList);
//		model.addObject("set",set);
//		model.addObject("count",count);
		return model;
	}
	
	@RequestMapping("bloglist")
	public ModelAndView bloglist(){
		ModelAndView model = new ModelAndView("bloglist");
		List<ArticleInfo> bloglist = articleService.findAll();
		SetInfo set = setService.findSet();//��վ��Ϣ
		model.addObject("set",set);
		model.addObject("bloglist",bloglist);
		return model;
	}
	
	@RequestMapping("article/{id}")
	public ModelAndView article(@PathVariable("id") int id){
		ModelAndView model = new ModelAndView("detail");
		//�������µ��������
		
		ArticleInfo article = articleService.selectByPrimaryKey(id);
		int num = article.getaViewnum();
		article.setaViewnum(num+1);
		articleService.updateByPrimaryKeySelective(article);
		model.addObject("article",article);
		return model;
	}
	
	@RequestMapping("top")
	public ModelAndView top(){
		ModelAndView model = new ModelAndView("top");
		SetInfo set = setService.findSet();//��վ��Ϣ
		List<TagInfo> tags = tagService.findAll();
		model.addObject("set",set);
		model.addObject("tags",tags);
		return model;
	}
	
	@RequestMapping("head")
	public ModelAndView head(){
		ModelAndView model = new ModelAndView("head");
		SetInfo set = setService.findSet();//��վ��Ϣ
		model.addObject("set",set);
		return model;
	}
	
	@RequestMapping("welcome")
	public ModelAndView welcome(){
		ModelAndView model = new ModelAndView("welcome");
		List<ArticleInfo> articleList = articleService.findFiveObject();
		model.addObject("articleList",articleList);
		return model;
	}
	
	@RequestMapping("bottom")
	public ModelAndView bottom(){
		ModelAndView model = new ModelAndView("bottom");
		SetInfo set = setService.findSet();//��վ��Ϣ
		List<LinkInfo> list = linkService.findAll();
		model.addObject("set",set);
		model.addObject("linklist",list);
		return model;
	}
}
