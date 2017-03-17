package com.lvruan.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.multipart.commons.CommonsMultipartResolver;
import org.springframework.web.servlet.ModelAndView;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.lvruan.po.ProjectInfo;
import com.lvruan.po.TypeInfo;
import com.lvruan.service.project.ProjectService;
import com.lvruan.service.type.TypeService;

@Controller
@RequestMapping("back")
public class ProjectController {

	private String fileNameExtractorRegex = "filename=\".+\"";
	@Autowired
	ProjectService projectService;
	@Autowired
	TypeService typeService;
	
	@RequestMapping("project/add")      /*项目的添加*/
	public @ResponseBody Map<String, Object> add(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		ProjectInfo project=new ProjectInfo();
		String title=request.getParameter("title");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		String tag=request.getParameter("tag");
		Date now=new Date();
		SimpleDateFormat sdf=new SimpleDateFormat("yyyy-MM-dd HH:mm");
		String str=sdf.format(now);    //当前时间
		Date time = null;
		try {
			time = sdf.parse(str);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		System.out.println("当前时间："+time);
		project.setpName(title);   //项目昵称
		project.setpContent(content);   //项目内容
		project.setpAuthor("run");   //作者
		project.setpTag(tag);    //项目标签
		project.setpTypeid(Integer.parseInt(type));    //项目分类
		project.setpTime(now);    //当前时间
		int i=projectService.insertSelective(project);
	    map.put("result", "success");
		
		return map;
	}
	
	@RequestMapping("project/list")    /*显示所有数据*/
	public ModelAndView findAll(HttpServletRequest request){
		ModelAndView view=new ModelAndView("admin/main/projectManager/list");
		List<ProjectInfo> list=projectService.findAll();   //项目信息
		List<TypeInfo> type=typeService.findAll();   //分类信息
		String jsonStr=JSONArray.toJSONString(list).toString();   //转换伟json格式
		String jsontype=JSONArray.toJSONString(type);
		System.out.println("-------\r\n"+jsonStr);
		view.addObject("jsondata", jsonStr);
		view.addObject("jsontype", jsontype);
		return view;
	}
	
	@RequestMapping("project/select_like")
	public ModelAndView findLike(HttpServletRequest request){
		ModelAndView view = new ModelAndView("admin/main/projectManager/list");
		String name = request.getParameter("title");
		List<ProjectInfo> list = projectService.select_like(name);
		List<TypeInfo> type=typeService.findAll();   //分类信息
		String jsontype=JSONArray.toJSONString(type);
		String jsonStr = JSONArray.toJSONString(list);
		view.addObject("jsontype", jsontype);
		view.addObject("jsondata", jsonStr);
		view.addObject("title", name);
		return view;
	}
	
	@RequestMapping("project/edit")   /*修改项目内容*/
	public @ResponseBody Map<String, Object> edit(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id = request.getParameter("id");
		String title=request.getParameter("title");
		String type=request.getParameter("type");
		String content=request.getParameter("content");
		String tag=request.getParameter("tag");
		ProjectInfo p=new ProjectInfo();
		p.setId(Integer.parseInt(id));
		p.setpName(title);
		p.setpTypeid(Integer.parseInt(type));
		p.setpContent(content);
		p.setpTag(tag);
		projectService.updateByPrimaryKeySelective(p);
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("project/edit_list")    /*获取点击项目的相关内容*/
	public ModelAndView findEdit(HttpServletRequest request){
		ModelAndView view=new ModelAndView("admin/main/projectManager/edit");
		String id=request.getParameter("id");
		System.out.println(id);
		List<ProjectInfo> info=projectService.selectByPrimaryKey(Integer.parseInt(id));
		List<TypeInfo> type=typeService.findAll();   //分类信息
		int str = 0;
		for (ProjectInfo p : info) {
			str=p.getpTypeid();
		}
		String jsontype=JSONArray.toJSONString(type);
		view.addObject("jsontype", jsontype);
	    view.addObject("list", info);
	    view.addObject("str", str);
	    return view;
	}
	
	@RequestMapping("project/del")   /*删除项目*/
	public @ResponseBody Map<String, Object> del(HttpServletRequest request){
		Map<String, Object> map=new HashMap<String, Object>();
		String id=request.getParameter("id");
		projectService.deleteByPrimaryKey(Integer.parseInt(id));
		map.put("result", "success");
		return map;
	}
	
	@RequestMapping("project/file")
	public @ResponseBody Map<String, Object> file(HttpServletRequest request,HttpServletResponse response) throws ServletException,IOException{
        Map<String, Object> map=new HashMap<String, Object>();
        long  startTime=System.currentTimeMillis();
        //将当前上下文初始化给  CommonsMutipartResolver （多部分解析器）
       CommonsMultipartResolver multipartResolver=new CommonsMultipartResolver(
               request.getSession().getServletContext());
       //检查form中是否有enctype="multipart/form-data"
       if(multipartResolver.isMultipart(request))
       {
           //将request变成多部分request
           MultipartHttpServletRequest multiRequest=(MultipartHttpServletRequest)request;
          //获取multiRequest 中所有的文件名
           Iterator iter=multiRequest.getFileNames();
            
           while(iter.hasNext())
           {
               //一次遍历所有文件
               MultipartFile file=multiRequest.getFile(iter.next().toString());
               if(file!=null)
               {
                   String path="E:/image/"+file.getOriginalFilename();
                   System.out.println(path);
                   //上传
                   file.transferTo(new File(path));
               }
                
           }
          
       }
       long  endTime=System.currentTimeMillis();
       System.out.println("方法三的运行时间："+String.valueOf(endTime-startTime)+"ms");
        map.put("result", "success");
        return map;
	}

}
