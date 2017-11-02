package com.zhongda.detection.web.model;

public class Image {
    private Integer imageId;

    private Integer userId;

    private Integer projectId;

    private Integer projectTypeId;

    private Integer detectionTypeId;

    private String heatImageUrl;

    private String physicalImageUrl;
    
    //测点类型名称，缓存数据库数据
    private String detectionTypeName;

    public String getDetectionTypeName() {
		return detectionTypeName;
	}

	public void setDetectionTypeName(String detectionTypeName) {
		this.detectionTypeName = detectionTypeName;
	}

	public Integer getImageId() {
        return imageId;
    }

    public void setImageId(Integer imageId) {
        this.imageId = imageId;
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