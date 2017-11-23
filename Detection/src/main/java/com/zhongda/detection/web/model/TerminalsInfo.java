package com.zhongda.detection.web.model;

public class TerminalsInfo {
    private Integer terminalsInfoId;

    private String smuId;

    private Integer projectId;

    public Integer getTerminalsInfoId() {
        return terminalsInfoId;
    }

    public void setTerminalsInfoId(Integer terminalsInfoId) {
        this.terminalsInfoId = terminalsInfoId;
    }

    public String getSmuId() {
        return smuId;
    }

    public void setSmuId(String smuId) {
        this.smuId = smuId == null ? null : smuId.trim();
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }
}