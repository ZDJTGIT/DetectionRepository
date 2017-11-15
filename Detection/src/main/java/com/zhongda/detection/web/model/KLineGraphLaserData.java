package com.zhongda.detection.web.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class KLineGraphLaserData {

	private Integer detectionids;

	private Double maxCurrentdata;

	private Double maxTotalLaserChange;

	private Double maxCurrentLaserChange;

	private Double maxSpeedChange;

	private Double minCurrentData;

	private Double minCurrentLaserChange;

	private Double minTotalLaserChangen;

	private Double minSpeedChange;

	private String sensorId;

	private Date currentTimes;

	private Double beginCurrentDatas;

	private Double beginCurrentLaserChange;

	private Double beginSpeedChanges;

	private Double beginTotalLaerChanges;

	private Double endCurrentData;

	private Double endCurentLaerChangens;

	private Double endTotalLaserChangens;

	private Double endSpeedChange;

	public Integer getDetectionids() {
		return detectionids;
	}

	public void setDetectionids(Integer detectionids) {
		this.detectionids = detectionids;
	}

	public Double getMaxCurrentdata() {
		return maxCurrentdata;
	}

	public void setMaxCurrentdata(Double maxCurrentdata) {
		this.maxCurrentdata = maxCurrentdata;
	}

	public Double getMaxTotalLaserChange() {
		return maxTotalLaserChange;
	}

	public void setMaxTotalLaserChange(Double maxTotalLaserChange) {
		this.maxTotalLaserChange = maxTotalLaserChange;
	}

	public Double getMaxCurrentLaserChange() {
		return maxCurrentLaserChange;
	}

	public void setMaxCurrentLaserChange(Double maxCurrentLaserChange) {
		this.maxCurrentLaserChange = maxCurrentLaserChange;
	}

	public Double getMaxSpeedChange() {
		return maxSpeedChange;
	}

	public void setMaxSpeedChange(Double maxSpeedChange) {
		this.maxSpeedChange = maxSpeedChange;
	}

	public Double getMinCurrentData() {
		return minCurrentData;
	}

	public void setMinCurrentData(Double minCurrentData) {
		this.minCurrentData = minCurrentData;
	}

	public Double getMinCurrentLaserChange() {
		return minCurrentLaserChange;
	}

	public void setMinCurrentLaserChange(Double minCurrentLaserChange) {
		this.minCurrentLaserChange = minCurrentLaserChange;
	}

	public Double getMinTotalLaserChangen() {
		return minTotalLaserChangen;
	}

	public void setMinTotalLaserChangen(Double minTotalLaserChangen) {
		this.minTotalLaserChangen = minTotalLaserChangen;
	}

	public Double getMinSpeedChange() {
		return minSpeedChange;
	}

	public void setMinSpeedChange(Double minSpeedChange) {
		this.minSpeedChange = minSpeedChange;
	}

	public String getSensorId() {
		return sensorId;
	}

	public void setSensorId(String sensorId) {
		this.sensorId = sensorId;
	}

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getCurrentTimes() {
		return currentTimes;
	}

	public void setCurrentTimes(Date currentTimes) {
		this.currentTimes = currentTimes;
	}

	public Double getBeginCurrentDatas() {
		return beginCurrentDatas;
	}

	public void setBeginCurrentDatas(Double beginCurrentDatas) {
		this.beginCurrentDatas = beginCurrentDatas;
	}

	public Double getBeginCurrentLaserChange() {
		return beginCurrentLaserChange;
	}

	public void setBeginCurrentLaserChange(Double beginCurrentLaserChange) {
		this.beginCurrentLaserChange = beginCurrentLaserChange;
	}

	public Double getBeginSpeedChanges() {
		return beginSpeedChanges;
	}

	public void setBeginSpeedChanges(Double beginSpeedChanges) {
		this.beginSpeedChanges = beginSpeedChanges;
	}

	public Double getBeginTotalLaerChanges() {
		return beginTotalLaerChanges;
	}

	public void setBeginTotalLaerChanges(Double beginTotalLaerChanges) {
		this.beginTotalLaerChanges = beginTotalLaerChanges;
	}

	public Double getEndCurrentData() {
		return endCurrentData;
	}

	public void setEndCurrentData(Double endCurrentData) {
		this.endCurrentData = endCurrentData;
	}

	public Double getEndCurentLaerChangens() {
		return endCurentLaerChangens;
	}

	public void setEndCurentLaerChangens(Double endCurentLaerChangens) {
		this.endCurentLaerChangens = endCurentLaerChangens;
	}

	public Double getEndTotalLaserChangens() {
		return endTotalLaserChangens;
	}

	public void setEndTotalLaserChangens(Double endTotalLaserChangens) {
		this.endTotalLaserChangens = endTotalLaserChangens;
	}

	public Double getEndSpeedChange() {
		return endSpeedChange;
	}

	public void setEndSpeedChange(Double endSpeedChange) {
		this.endSpeedChange = endSpeedChange;
	}

	@Override
	public String toString() {
		return "KLineGraphLaserData [detectionids=" + detectionids
				+ ", maxCurrentdata=" + maxCurrentdata
				+ ", maxTotalLaserChange=" + maxTotalLaserChange
				+ ", maxCurrentLaserChange=" + maxCurrentLaserChange
				+ ", maxSpeedChange=" + maxSpeedChange + ", minCurrentData="
				+ minCurrentData + ", minCurrentLaserChange="
				+ minCurrentLaserChange + ", minTotalLaserChangen="
				+ minTotalLaserChangen + ", minSpeedChange=" + minSpeedChange
				+ ", sensorId=" + sensorId + ", currentTimes=" + currentTimes
				+ ", beginCurrentDatas=" + beginCurrentDatas
				+ ", beginCurrentLaserChange=" + beginCurrentLaserChange
				+ ", beginSpeedChanges=" + beginSpeedChanges
				+ ", beginTotalLaerChanges=" + beginTotalLaerChanges
				+ ", endCurrentData=" + endCurrentData
				+ ", endCurentLaerChangens=" + endCurentLaerChangens
				+ ", endTotalLaserChangens=" + endTotalLaserChangens
				+ ", endSpeedChange=" + endSpeedChange + "]";
	}

}
