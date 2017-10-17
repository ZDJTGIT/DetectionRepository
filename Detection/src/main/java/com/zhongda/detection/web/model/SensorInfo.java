package com.zhongda.detection.web.model;

import java.util.List;

public class SensorInfo {
	private Integer sensorId;

	private Integer projectId;

	private Integer detectionId;

	private String sensorLongitude;

	private String sensorLatitude;

	private String sensorNum;

	private String sensorType;

	private String sensorModel;

	private Integer detectionTypeId;

	private SysDictionary sysDictionary;

	private List<SlopeDisplacementData> slopeDisplacementDataList;

	private Float sensorDepth;

	private List<SlopeRainfall> slopeRainfallList;

	public Integer getSensorId() {
		return sensorId;
	}

	public void setSensorId(Integer sensorId) {
		this.sensorId = sensorId;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getDetectionId() {
		return detectionId;
	}

	public void setDetectionId(Integer detectionId) {
		this.detectionId = detectionId;
	}

	public String getSensorLongitude() {
		return sensorLongitude;
	}

	public void setSensorLongitude(String sensorLongitude) {
		this.sensorLongitude = sensorLongitude == null ? null : sensorLongitude
				.trim();
	}

	public String getSensorLatitude() {
		return sensorLatitude;
	}

	public void setSensorLatitude(String sensorLatitude) {
		this.sensorLatitude = sensorLatitude == null ? null : sensorLatitude
				.trim();
	}

	public String getSensorNum() {
		return sensorNum;
	}

	public void setSensorNum(String sensorNum) {
		this.sensorNum = sensorNum == null ? null : sensorNum.trim();
	}

	public String getSensorType() {
		return sensorType;
	}

	public void setSensorType(String sensorType) {
		this.sensorType = sensorType == null ? null : sensorType.trim();
	}

	public String getSensorModel() {
		return sensorModel;
	}

	public void setSensorModel(String sensorModel) {
		this.sensorModel = sensorModel == null ? null : sensorModel.trim();
	}

	public Integer getDetectionTypeId() {
		return detectionTypeId;
	}

	public void setDetectionTypeId(Integer detectionTypeId) {
		this.detectionTypeId = detectionTypeId;
	}

	public SysDictionary getSysDictionary() {
		return sysDictionary;
	}

	public void setSysDictionary(SysDictionary sysDictionary) {
		this.sysDictionary = sysDictionary;
	}

	public List<SlopeDisplacementData> getSlopeDisplacementDataList() {
		return slopeDisplacementDataList;
	}

	public void setSlopeDisplacementDataList(
			List<SlopeDisplacementData> slopeDisplacementDataList) {
		this.slopeDisplacementDataList = slopeDisplacementDataList;
	}

	public Float getSensorDepth() {
		return sensorDepth;
	}

	public void setSensorDepth(Float sensorDepth) {
		this.sensorDepth = sensorDepth;
	}

	public List<SlopeRainfall> getSlopeRainfallList() {
		return slopeRainfallList;
	}

	public void setSlopeRainfallList(List<SlopeRainfall> slopeRainfallList) {
		this.slopeRainfallList = slopeRainfallList;
	}

	@Override
	public String toString() {
		return "SensorInfo [sensorId=" + sensorId
				+ ", slopeDisplacementDataList=" + slopeDisplacementDataList
				+ ", sensorDepth=" + sensorDepth + "]";
	}

}