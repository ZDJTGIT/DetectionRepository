package com.zhongda.detection.web.dao;

import java.util.List;

import com.zhongda.detection.web.model.UserProject;

public interface UserProjectMapper {
    int deleteByPrimaryKey(Integer userProjectId);

    int insert(UserProject record);

    int insertSelective(UserProject record);

    UserProject selectByPrimaryKey(Integer userProjectId);

    int updateByPrimaryKeySelective(UserProject record);

    int updateByPrimaryKey(UserProject record);

    /**
     * 查出当前用户下所有的项目类型
     * @param userId
     * @return
     */
	List<UserProject> selectAllProjectTypeByUserId(Integer userId);
}