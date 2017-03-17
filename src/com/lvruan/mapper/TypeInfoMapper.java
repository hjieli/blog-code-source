package com.lvruan.mapper;

import java.util.List;

import com.lvruan.po.TypeInfo;

public interface TypeInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TypeInfo record);

    int insertSelective(TypeInfo record);

    TypeInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TypeInfo record);

    int updateByPrimaryKey(TypeInfo record);
    
    List<TypeInfo> findAll();
}