package com.lvruan.service.link;

import java.util.List;

import com.lvruan.po.LinkInfo;


public interface LinkService {
	boolean deleteByPrimaryKey(Integer id);

	boolean insert(LinkInfo record);

	boolean insertSelective(LinkInfo record);

	LinkInfo selectByPrimaryKey(Integer id);

    boolean updateByPrimaryKeySelective(LinkInfo record);

    boolean updateByPrimaryKey(LinkInfo record);
    
    /**
     * find all
     * */
    List<LinkInfo> findAll();
    
    /**
     * find five object
     * */
    List<LinkInfo> findFiveObject();
    
    /**
     * find Count
     * */
    int findCount();
}
