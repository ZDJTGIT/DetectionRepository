package com.zhongda.detection.web.model;

import java.util.List;

public class DetectionPoint {
	private Integer detectionPointId;

	private Integer projectId;

	private Integer detectionTypeId;

	private String detectionLatitude;

	private String detectionLongitude;

	private String detectionName;

	private String detectionDescription;

	// 缓存项目名，数据库无该字段
	private String projectName;

	// 字典表数据，数据库无该字段
	private String itemName;
	private String itemValue;

	// 激光测距List
	private List<LaserData> laserDataList;
	// k线图List
	private List<KLineGraphLaserData> kGraphLaserDataList;

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
		this.detectionLatitude = detectionLatitude == null ? null
				: detectionLatitude.trim();
	}

	public String getDetectionLongitude() {
		return detectionLongitude;
	}

	public void setDetectionLongitude(String detectionLongitude) {
		this.detectionLongitude = detectionLongitude == null ? null
				: detectionLongitude.trim();
	}

	public String getDetectionName() {
		return detectionName;
	}

	public void setDetectionName(String detectionName) {
		this.detectionName = detectionName == null ? null : detectionName
				.trim();
	}

	public String getDetectionDescription() {
		return detectionDescription;
	}

	public void setDetectionDescription(String detectionDescription) {
		this.detectionDescription = detectionDescription == null ? null
				: detectionDescription.trim();
	}

	public String getItemName() {
		return itemName;
	}

	public void setItemName(String itemName) {
		this.itemName = itemName;
	}

	public String getItemValue() {
		return itemValue;
	}

	public void setItemValue(String itemValue) {
		this.itemValue = itemValue;
	}

	public List<LaserData> getLaserDataList() {
		return laserDataList;
	}

	public void setLaserDataList(List<LaserData> laserDataList) {
		this.laserDataList = laserDataList;
	}

	public List<KLineGraphLaserData> getkGraphLaserDataList() {
		return kGraphLaserDataList;
	}

	public void setkGraphLaserDataList(
			List<KLineGraphLaserData> kGraphLaserDataList) {
		this.kGraphLaserDataList = kGraphLaserDataList;
	}

	@Override
	public String toString() {
		return "DetectionPoint [detectionPointId=" + detectionPointId
				+ ", detectionName=" + detectionName + ", kGraphLaserDataList="
				+ kGraphLaserDataList + "]";
	}

}