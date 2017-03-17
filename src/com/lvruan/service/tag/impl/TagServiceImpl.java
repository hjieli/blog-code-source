package com.lvruan.service.tag.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lvruan.mapper.TagInfoMapper;
import com.lvruan.po.TagInfo;
import com.lvruan.service.tag.TagService;

public class TagServiceImpl implements TagService{
	@Autowired
	TagInfoMapper tagInfoMapper;
	
	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return tagInfoMapper.deleteByPrimaryKey(id);
	}
	
	@Override
	public int insert(TagInfo record) {
		// TODO Auto-generated method stub
		return tagInfoMapper.insert(record);
	}
	
	@Override
	public int insertSelective(TagInfo record) {
		// TODO Auto-generated method stub
		return tagInfoMapper.insertSelective(record);
	}
	
	@Override
	public TagInfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return tagInfoMapper.selectByPrimaryKey(id);
	}
	
	@Override
	public int updateByPrimaryKeySelective(TagInfo record) {
		// TODO Auto-generated method stub
		return tagInfoMapper.updateByPrimaryKeySelective(record);
	}
	
	@Override
	public int updateByPrimaryKey(TagInfo record) {
		// TODO Auto-generated method stub
		return tagInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<TagInfo> findAll() {
		// TODO Auto-generated method stub
		return tagInfoMapper.findAll();
	}

	@Override
	public List<TagInfo> selectByPrimaryKeyTag(Integer id) {
		// TODO Auto-generated method stub
		return tagInfoMapper.selectByPrimaryKeyTag(id);
	}
}
