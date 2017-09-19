package com.zhongda.detection.web.dao;

import com.zhongda.detection.web.model.UserProject;

public interface UserProjectMapper {
    int deleteByPrimaryKey(Integer userProjectId);

    int insert(UserProject record);

    int insertSelective(UserProject record);

    UserProject selectByPrimaryKey(Integer userProjectId);

    int updateByPrimaryKeySelective(UserProject record);

    int updateByPrimaryKey(UserProject record);
}