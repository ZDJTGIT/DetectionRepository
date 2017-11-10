package com.zhongda.detection.web.model;

public class Threshold {
    private Integer thresholdId;

    private Integer userId;

    private Integer projectId;

    private Integer projectTypeId;

    private Integer detectionTypeId;

    private Integer thresholdTypeId;

    private Double minThresholdValue;

    private Double maxThresholdValue;
  
    //用户新建时传项目名查找用户ID项目ID项目类型ID
    private String projectName;
    
    //打开threshold表时缓存测点类型名
    private String detectionTypeName;
    
    //打开threshold表时缓存阀值类型名
    private String thresHoldTypeName;


	public String getThresHoldTypeName() {
		return thresHoldTypeName;
	}

	public void setThresHoldTypeName(String thresHoldTypeName) {
		this.thresHoldTypeName = thresHoldTypeName;
	}

	public String getDetectionTypeName() {
		return detectionTypeName;
	}

	public void setDetectionTypeName(String detectionTypeName) {
		this.detectionTypeName = detectionTypeName;
	}

    public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

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

    public Integer getThresholdTypeId() {
        return thresholdTypeId;
    }

    public void setThresholdTypeId(Integer thresholdTypeId) {
        this.thresholdTypeId = thresholdTypeId;
    }

    public Double getMinThresholdValue() {
        return minThresholdValue;
    }

    public void setMinThresholdValue(Double minThresholdValue) {
        this.minThresholdValue = minThresholdValue;
    }

    public Double getMaxThresholdValue() {
        return maxThresholdValue;
    }

    public void setMaxThresholdValue(Double maxThresholdValue) {
        this.maxThresholdValue = maxThresholdValue;
    }
}