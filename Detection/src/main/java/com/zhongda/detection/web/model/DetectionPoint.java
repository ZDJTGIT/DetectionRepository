package com.zhongda.detection.web.model;

public class DetectionPoint {
    private Integer detectionPointId;

    private Integer projectId;

    private Integer detectionTypeId;

    private String detectionLatitude;

    private String detectionLongitude;

    private String detectionName;

    private String detectionDescription;
    
    //缓存项目名，数据库无该字段
    private String projectName;

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}

	public Integer getDetectionPointId() {
        return detectionPointId;
    }

    public void setDetectionPointId(Integer detectionPointId) {
        this.detectionPointId = detectionPointId;
    }

    public Integer getProjectId() {
        return projectId;
    }

    public void setProjectId(Integer projectId) {
        this.projectId = projectId;
    }

    public Integer getDetectionTypeId() {
        return detectionTypeId;
    }

    public void setDetectionTypeId(Integer detectionTypeId) {
        this.detectionTypeId = detectionTypeId;
    }

    public String getDetectionLatitude() {
        return detectionLatitude;
    }

    public void setDetectionLatitude(String detectionLatitude) {
        this.detectionLatitude = detectionLatitude == null ? null : detectionLatitude.trim();
    }

    public String getDetectionLongitude() {
        return detectionLongitude;
    }

    public void setDetectionLongitude(String detectionLongitude) {
        this.detectionLongitude = detectionLongitude == null ? null : detectionLongitude.trim();
    }

    public String getDetectionName() {
        return detectionName;
    }

    public void setDetectionName(String detectionName) {
        this.detectionName = detectionName == null ? null : detectionName.trim();
    }

    public String getDetectionDescription() {
        return detectionDescription;
    }

    public void setDetectionDescription(String detectionDescription) {
        this.detectionDescription = detectionDescription == null ? null : detectionDescription.trim();
    }
}