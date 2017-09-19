package com.zhongda.detection.web.model;

public class UserProject {
    private Integer userProjectId;

    private String projectType;

    private Integer userId;

    private Integer projcetId;

    public Integer getUserProjectId() {
        return userProjectId;
    }

    public void setUserProjectId(Integer userProjectId) {
        this.userProjectId = userProjectId;
    }

    public String getProjectType() {
        return projectType;
    }

    public void setProjectType(String projectType) {
        this.projectType = projectType == null ? null : projectType.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProjcetId() {
        return projcetId;
    }

    public void setProjcetId(Integer projcetId) {
        this.projcetId = projcetId;
    }
}