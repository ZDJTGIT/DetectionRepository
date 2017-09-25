package com.zhongda.detection.web.model;

public class UserProject {
    private Integer userProjectId;

    private String projectTypeCode;

    private Integer userId;

    private Integer projectId;

    private String projectTypeValue;

    public Integer getUserProjectId() {
        return userProjectId;
    }

    public void setUserProjectId(Integer userProjectId) {
        this.userProjectId = userProjectId;
    }

    public String getProjectTypeCode() {
        return projectTypeCode;
    }

    public void setProjectTypeCode(String projectTypeCode) {
        this.projectTypeCode = projectTypeCode == null ? null : projectTypeCode.trim();
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public String getProjectTypeValue() {
        return projectTypeValue;
    }

    public void setProjectTypeValue(String projectTypeValue) {
        this.projectTypeValue = projectTypeValue == null ? null : projectTypeValue.trim();
    }
}