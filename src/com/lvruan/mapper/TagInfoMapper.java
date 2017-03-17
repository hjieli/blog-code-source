package com.lvruan.mapper;

import java.util.List;

import com.lvruan.po.TagInfo;

public interface TagInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(TagInfo record);

    int insertSelective(TagInfo record);

    TagInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(TagInfo record);

    int updateByPrimaryKey(TagInfo record);
    
    /**
     * findAll
     * */
    List<TagInfo> findAll();
    
    List<TagInfo> selectByPrimaryKeyTag(Integer id);
}