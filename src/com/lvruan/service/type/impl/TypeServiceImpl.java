package com.lvruan.service.type.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lvruan.mapper.TypeInfoMapper;
import com.lvruan.po.TypeInfo;
import com.lvruan.service.type.TypeService;

public class TypeServiceImpl implements TypeService{
	@Autowired
	TypeInfoMapper typeInfoMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return typeInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(TypeInfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(TypeInfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.insertSelective(record);
	}

	@Override
	public TypeInfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return typeInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(TypeInfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(TypeInfo record) {
		// TODO Auto-generated method stub
		return typeInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<TypeInfo> findAll() {
		// TODO Auto-generated method stub
		return typeInfoMapper.findAll();
	}
	
}
