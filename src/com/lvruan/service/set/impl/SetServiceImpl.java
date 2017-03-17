package com.lvruan.service.set.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.lvruan.mapper.SetInfoMapper;
import com.lvruan.po.SetInfo;
import com.lvruan.service.set.SetService;

public class SetServiceImpl implements SetService {
	
	@Autowired
	SetInfoMapper setInfoMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return setInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(SetInfo record) {
		// TODO Auto-generated method stub
		return setInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(SetInfo record) {
		// TODO Auto-generated method stub
		return setInfoMapper.insertSelective(record);
	}

	@Override
	public SetInfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return setInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(SetInfo record) {
		// TODO Auto-generated method stub
		return setInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(SetInfo record) {
		// TODO Auto-generated method stub
		return setInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public SetInfo findSet() {
		// TODO Auto-generated method stub
		return setInfoMapper.findSet();
	}

}
