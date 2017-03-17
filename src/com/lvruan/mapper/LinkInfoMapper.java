package com.lvruan.mapper;

import java.util.List;

import com.lvruan.po.LinkInfo;

public interface LinkInfoMapper {
	boolean deleteByPrimaryKey(Integer id);
	//插入数据
	boolean insert(LinkInfo record);
	boolean insertSelective(LinkInfo record);
	
	//根据主键查询多条信息内容
	LinkInfo selectByPrimaryKey(Integer id);
	//通过选择的主键更新单条数据内容
	boolean updateByPrimaryKeySelective(LinkInfo record);
	boolean updateByPrimaryKey(LinkInfo record);
	/**
	 * find all
	 */
	List<LinkInfo> findAll();
	List<LinkInfo> findFiveObject();
	/**
	 * find count
	 */
	int findCount();
}
