package com.lvruan.service.article.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;

import com.lvruan.mapper.ArticleInfoMapper;
import com.lvruan.po.ArticleInfo;
import com.lvruan.service.article.ArticleService;

public class ArticleServiceImpl implements ArticleService{
	@Autowired
	ArticleInfoMapper articleInfoMapper;

	@Override
	public int deleteByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return articleInfoMapper.deleteByPrimaryKey(id);
	}

	@Override
	public int insert(ArticleInfo record) {
		// TODO Auto-generated method stub
		return articleInfoMapper.insert(record);
	}

	@Override
	public int insertSelective(ArticleInfo record) {
		// TODO Auto-generated method stub
		return articleInfoMapper.insertSelective(record);
	}

	@Override
	public ArticleInfo selectByPrimaryKey(Integer id) {
		// TODO Auto-generated method stub
		return articleInfoMapper.selectByPrimaryKey(id);
	}

	@Override
	public int updateByPrimaryKeySelective(ArticleInfo record) {
		// TODO Auto-generated method stub
		return articleInfoMapper.updateByPrimaryKeySelective(record);
	}

	@Override
	public int updateByPrimaryKey(ArticleInfo record) {
		// TODO Auto-generated method stub
		return articleInfoMapper.updateByPrimaryKey(record);
	}

	@Override
	public List<ArticleInfo> findAll() {
		// TODO Auto-generated method stub
		return articleInfoMapper.findAll();
	}

	@Override
	public List<ArticleInfo> findFiveObject() {
		// TODO Auto-generated method stub
		return articleInfoMapper.findFiveObject();
	}

	@Override
	public int findCount() {
		// TODO Auto-generated method stub
		return articleInfoMapper.findCount();
	}

	@Override
	public List<ArticleInfo> selectByPrimaryKey1(Integer id) {
		// TODO Auto-generated method stub
		return articleInfoMapper.selectByPrimaryKey1(id);
	}

	@Override
	public List<ArticleInfo> find_like(String name) {
		// TODO Auto-generated method stub
		return articleInfoMapper.find_like(name);
	}
	
}
