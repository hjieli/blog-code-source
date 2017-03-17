package com.lvruan.mapper;

import java.util.List;

import com.lvruan.po.ArticleInfo;

public interface ArticleInfoMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ArticleInfo record);

    int insertSelective(ArticleInfo record);

    List<ArticleInfo> selectByPrimaryKey1(Integer id);
    
    ArticleInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ArticleInfo record);

    int updateByPrimaryKey(ArticleInfo record);
    
    /**
     * find all
     * */
    List<ArticleInfo> findAll();
    
    /**
     * find five object
     * */
    List<ArticleInfo> findFiveObject();
    
    /**
     * find Count
     * */
    int findCount();
    
    /**
     * find like
     */
    List<ArticleInfo> find_like(String name); 
}