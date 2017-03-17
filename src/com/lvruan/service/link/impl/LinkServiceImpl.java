package com.lvruan.service.link.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lvruan.mapper.LinkInfoMapper;
import com.lvruan.po.LinkInfo;
import com.lvruan.service.link.LinkService;

public class LinkServiceImpl implements LinkService {
	@Autowired
	LinkInfoMapper linkInfoMapper;
	
	@Override
	public boolean deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return linkInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public boolean insert(LinkInfo record) {
		// TODO Auto-generated method stub
		return linkInfoMapper.insert(record);
	}

	@Override
	public boolean insertSelective(LinkInfo record) {
		// TODO Auto-generated method stub
		return linkInfoMapper.insertSelective(record);
	}

	@Override
	public LinkInfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return linkInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public boolean updateByPrimaryKeySelective(LinkInfo record) {
		// TODO Auto-generated method stub
		return linkInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public boolean updateByPrimaryKey(LinkInfo record) {
		// TODO Auto-generated method stub
		return linkInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<LinkInfo> findAll() {
		// TODO Auto-generated method stub
		return linkInfoMapper.findAll();
	}

	@Override
	public List<LinkInfo> findFiveObject() {
		// TODO Auto-generated method stub
		return linkInfoMapper.findFiveObject();
	}

	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		return linkInfoMapper.findCount();
	}

}
