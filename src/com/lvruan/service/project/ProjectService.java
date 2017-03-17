package com.lvruan.service.project;

import java.util.List;

import com.lvruan.po.ProjectInfo;

public interface ProjectService {
    int deleteByPrimaryKey(Integer id);

    int insert(ProjectInfo record);

    int insertSelective(ProjectInfo record);

    List<ProjectInfo> selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProjectInfo record);

    int updateByPrimaryKeyWithBLOBs(ProjectInfo record);

    int updateByPrimaryKey(ProjectInfo record);
    
    /**
     * find All
     */
    List<ProjectInfo> findAll();
    List<ProjectInfo> selectByPrimaryKeyType(Integer id);
    List<ProjectInfo> select_like(String name);   //模糊查询
}