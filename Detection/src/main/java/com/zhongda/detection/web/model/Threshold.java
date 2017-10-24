package com.zhongda.detection.web.model;

public class Threshold {
    private Integer thresholdId;

    private Integer userId;

    private Integer projectId;

    private Integer projectTypeId;

    private Integer detectionTypeId;

    private Float minThresholdValue;

    private Float maxThresholdValue;

    private String heatImageUrl;

    private String physicalImageUrl;

    public Integer getThresholdId() {
        return thresholdId;
    }

    public void setThresholdId(Integer thresholdId) {
        this.thresholdId = thresholdId;
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

    public Integer getProjectTypeId() {
        return projectTypeId;
    }

    public void setProjectTypeId(Integer projectTypeId) {
        this.projectTypeId = projectTypeId;
    }

    public Integer getDetectionTypeId() {
        return detectionTypeId;
    }

    public void setDetectionTypeId(Integer detectionTypeId) {
        this.detectionTypeId = detectionTypeId;
    }

    public Float getMinThresholdValue() {
        return minThresholdValue;
    }

    public void setMinThresholdValue(Float minThresholdValue) {
        this.minThresholdValue = minThresholdValue;
    }

    public Float getMaxThresholdValue() {
        return maxThresholdValue;
    }

    public void setMaxThresholdValue(Float maxThresholdValue) {
        this.maxThresholdValue = maxThresholdValue;
    }

    public String getHeatImageUrl() {
        return heatImageUrl;
    }

    public void setHeatImageUrl(String heatImageUrl) {
        this.heatImageUrl = heatImageUrl == null ? null : heatImageUrl.trim();
    }

    public String getPhysicalImageUrl() {
        return physicalImageUrl;
    }

    public void setPhysicalImageUrl(String physicalImageUrl) {
        this.physicalImageUrl = physicalImageUrl == null ? null : physicalImageUrl.trim();
    }
}