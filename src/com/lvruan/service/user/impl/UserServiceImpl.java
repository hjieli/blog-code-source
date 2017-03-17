package com.lvruan.service.user.impl;

import org.springframework.beans.factory.annotation.Autowired;

import com.lvruan.mapper.UserInfoMapper;
import com.lvruan.po.UserInfo;
import com.lvruan.service.user.UserService;

public class UserServiceImpl implements UserService{
	@Autowired
	UserInfoMapper userInfoMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.insertSelective(record);
	}

	@Override
	public UserInfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return userInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public UserInfo findByName(UserInfo record) {
		// TODO Auto-generated method stub
		return userInfoMapper.findByName(record);
	}

}
