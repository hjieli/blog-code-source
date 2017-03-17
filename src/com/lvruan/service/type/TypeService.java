package com.lvruan.service.type;

import java.util.List;

import com.lvruan.po.TypeInfo;

public interface TypeService {
	int deleteByPrimaryKey(Integer id);

    int insert(TypeInfo record);

    int insertSelective(TypeInfo record);

    TypeInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TypeInfo record);

    int updateByPrimaryKey(TypeInfo record);
    
    List<TypeInfo> findAll();
}
