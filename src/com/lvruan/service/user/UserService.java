package com.lvruan.service.user;

import com.lvruan.po.UserInfo;

public interface UserService {
    int deleteByPrimaryKey(Integer id);

    int insert(UserInfo record);

    int insertSelective(UserInfo record);

    UserInfo selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(UserInfo record);

    int updateByPrimaryKey(UserInfo record);
    
    /**
     * findByName
     * */
    UserInfo findByName(UserInfo record);
}
