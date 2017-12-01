package com.zhongda.detection.web.model;

public class Threshold {
	private Integer thresholdId;

	private Integer userId;

	private Integer projectId;

	private Integer projectTypeId;

	private Integer detectionTypeId;

	private Integer thresholdTypeId;

	private Double maxThresholdValue;

	private Double minThresholdValue;

	private Double minDrasticThresholdValue;

	private Double maxDrasticThresholdValue;

	// 用户新建时传项目名查找用户ID项目ID项目类型ID
	private String projectName;

	// 打开threshold表时缓存测点类型名
	private String detectionTypeName;

	// 打开threshold表时缓存阀值类型名
	private String thresholdTypeName;

	private SysDictionary sysDictionary;

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

	public Double getMinDrasticThresholdValue() {
		return minDrasticThresholdValue;
	}

	public void setMinDrasticThresholdValue(Double minDrasticThresholdValue) {
		this.minDrasticThresholdValue = minDrasticThresholdValue;
	}

	public Double getMaxDrasticThresholdValue() {
		return maxDrasticThresholdValue;
	}

	public void setMaxDrasticThresholdValue(Double maxDrasticThresholdValue) {
		this.maxDrasticThresholdValue = maxDrasticThresholdValue;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName == null ? null : projectName.trim();
	}

	public String getDetectionTypeName() {
		return detectionTypeName;
	}

	public void setDetectionTypeName(String detectionTypeName) {
		this.detectionTypeName = detectionTypeName == null ? null
				: detectionTypeName.trim();
	}

	public String getThresholdTypeName() {
		return thresholdTypeName;
	}

	public void setThresholdTypeName(String thresholdTypeName) {
		this.thresholdTypeName = thresholdTypeName == null ? null
				: thresholdTypeName.trim();
	}

	public SysDictionary getSysDictionary() {
		return sysDictionary;
	}

	public void setSysDictionary(SysDictionary sysDictionary) {
		this.sysDictionary = sysDictionary;
	}

	@Override
	public String toString() {
		return "Threshold [thresholdId=" + thresholdId + ", userId=" + userId
				+ ", projectId=" + projectId + ", projectTypeId="
				+ projectTypeId + ", detectionTypeId=" + detectionTypeId
				+ ", thresholdTypeId=" + thresholdTypeId
				+ ", maxThresholdValue=" + maxThresholdValue
				+ ", minThresholdValue=" + minThresholdValue
				+ ", minDrasticThresholdValue=" + minDrasticThresholdValue
				+ ", maxDrasticThresholdValue=" + maxDrasticThresholdValue
				+ ", projectName=" + projectName + ", detectionTypeName="
				+ detectionTypeName + ", thresholdTypeName="
				+ thresholdTypeName + "]";
	}

}