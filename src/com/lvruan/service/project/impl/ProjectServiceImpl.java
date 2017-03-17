package com.lvruan.service.project.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lvruan.mapper.ProjectMapper;
import com.lvruan.po.ProjectInfo;
import com.lvruan.service.project.ProjectService;

public class ProjectServiceImpl implements ProjectService {

	@Autowired
	ProjectMapper projectMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return projectMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(ProjectInfo record) {
		// TODO Auto-generated method stub
		return projectMapper.insert(record);
	}

	@Override
	public int insertSelective(ProjectInfo record) {
		// TODO Auto-generated method stub
		return projectMapper.insertSelective(record);
	}

	@Override
	public List<ProjectInfo> selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return projectMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(ProjectInfo record) {
		// TODO Auto-generated method stub
		return projectMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKeyWithBLOBs(ProjectInfo record) {
		// TODO Auto-generated method stub
		return projectMapper.updateByPrimaryKeyWithBLOBs(record);
	}

	@Override
	public int updateByPrimaryKey(ProjectInfo record) {
		// TODO Auto-generated method stub
		return projectMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<ProjectInfo> findAll() {
		// TODO Auto-generated method stub
		return projectMapper.findAll();
	}

	@Override
	public List<ProjectInfo> selectByPrimaryKeyType(Integer id) {
		// TODO Auto-generated method stub
		return projectMapper.selectByPrimaryKeyType(id);
	}

	@Override
	public List<ProjectInfo> select_like(String name) {
		// TODO Auto-generated method stub
		return projectMapper.select_like(name);
	}

}
