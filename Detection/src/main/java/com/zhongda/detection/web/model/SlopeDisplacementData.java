package com.zhongda.detection.web.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class SlopeDisplacementData {
	private Integer slopeDisplacementId;

	private Integer sensorId;

	private Integer detectionId;

	private String sensorStatus;

	private Date firstTime;

	private Float firstData;

	private Date previousTime;

	private Float previousData;

	private Date currentTimes;

	private Float currentData;

	private Float currentDisplacement;

	private Float totalDisplacement;

	private Float speedChange;

	private String detectionHoleName;

	private String detectionStandard;

	private Integer detectionNums;

	private Float detectionSpace;

	private String tester;

	public Integer getSlopeDisplacementId() {
		return slopeDisplacementId;
	}

	public void setSlopeDisplacementId(Integer slopeDisplacementId) {
		this.slopeDisplacementId = slopeDisplacementId;
	}

	public Integer getSensorId() {
		return sensorId;
	}

	public void setSensorId(Integer sensorId) {
		this.sensorId = sensorId;
	}

	public Integer getDetectionId() {
		return detectionId;
	}

	public void setDetectionId(Integer detectionId) {
		this.detectionId = detectionId;
	}

	public String getSensorStatus() {
		return sensorStatus;
	}

	public void setSensorStatus(String sensorStatus) {
		this.sensorStatus = sensorStatus == null ? null : sensorStatus.trim();
	}

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getFirstTime() {
		return firstTime;
	}

	public void setFirstTime(Date firstTime) {
		this.firstTime = firstTime;
	}

	public Float getFirstData() {
		return firstData;
	}

	public void setFirstData(Float firstData) {
		this.firstData = firstData;
	}

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getPreviousTime() {
		return previousTime;
	}

	public void setPreviousTime(Date previousTime) {
		this.previousTime = previousTime;
	}

	public Float getPreviousData() {
		return previousData;
	}

	public void setPreviousData(Float previousData) {
		this.previousData = previousData;
	}

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getCurrentTimes() {
		return currentTimes;
	}

	public void setCurrentTimes(Date currentTime) {
		this.currentTimes = currentTime;
	}

	public Float getCurrentData() {
		return currentData;
	}

	public void setCurrentData(Float currentData) {
		this.currentData = currentData;
	}

	public Float getCurrentDisplacement() {
		return currentDisplacement;
	}

	public void setCurrentDisplacement(Float currentDisplacement) {
		this.currentDisplacement = currentDisplacement;
	}

	public Float getTotalDisplacement() {
		return totalDisplacement;
	}

	public void setTotalDisplacement(Float totalDisplacement) {
		this.totalDisplacement = totalDisplacement;
	}

	public Float getSpeedChange() {
		return speedChange;
	}

	public void setSpeedChange(Float speedChange) {
		this.speedChange = speedChange;
	}

	public String getDetectionHoleName() {
		return detectionHoleName;
	}

	public void setDetectionHoleName(String detectionHoleName) {
		this.detectionHoleName = detectionHoleName == null ? null
				: detectionHoleName.trim();
	}

	public String getDetectionStandard() {
		return detectionStandard;
	}

	public void setDetectionStandard(String detectionStandard) {
		this.detectionStandard = detectionStandard == null ? null
				: detectionStandard.trim();
	}

	public Integer getDetectionNums() {
		return detectionNums;
	}

	public void setDetectionNums(Integer detectionNums) {
		this.detectionNums = detectionNums;
	}

	public Float getDetectionSpace() {
		return detectionSpace;
	}

	public void setDetectionSpace(Float detectionSpace) {
		this.detectionSpace = detectionSpace;
	}

	public String getTester() {
		return tester;
	}

	public void setTester(String tester) {
		this.tester = tester == null ? null : tester.trim();
	}

	@Override
	public String toString() {
		return "SlopeDisplacementData [slopeDisplacementId="
				+ slopeDisplacementId + ", sensorId=" + sensorId
				+ ", detectionId=" + detectionId + ", currentTimes="
				+ currentTimes + ", tester=" + tester + "]";
	}

}