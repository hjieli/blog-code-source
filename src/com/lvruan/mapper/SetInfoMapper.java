package com.lvruan.mapper;

import com.lvruan.po.SetInfo;

public interface SetInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(SetInfo record);

    int insertSelective(SetInfo record);

    SetInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(SetInfo record);

    int updateByPrimaryKey(SetInfo record);
    
    /**
     * ×Ô¶¨Òå
     * */
    SetInfo findSet();
}