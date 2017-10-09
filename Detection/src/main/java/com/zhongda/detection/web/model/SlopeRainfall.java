package com.zhongda.detection.web.model;

import java.util.Date;

public class SlopeRainfall {
    private Integer rainfallId;

    private Integer detectionId;

    private Integer sensorId;

    private Float detectionData;

    private Date detectionTime;

    private String sensorStatus;

    public Integer getRainfallId() {
        return rainfallId;
    }

    public void setRainfallId(Integer rainfallId) {
        this.rainfallId = rainfallId;
    }

    public Integer getDetectionId() {
        return detectionId;
    }

    public void setDetectionId(Integer detectionId) {
        this.detectionId = detectionId;
    }

    public Integer getSensorId() {
        return sensorId;
    }

    public void setSensorId(Integer sensorId) {
        this.sensorId = sensorId;
    }

    public Float getDetectionData() {
        return detectionData;
    }

    public void setDetectionData(Float detectionData) {
        this.detectionData = detectionData;
    }

    public Date getDetectionTime() {
        return detectionTime;
    }

    public void setDetectionTime(Date detectionTime) {
        this.detectionTime = detectionTime;
    }

    public String getSensorStatus() {
        return sensorStatus;
    }

    public void setSensorStatus(String sensorStatus) {
        this.sensorStatus = sensorStatus == null ? null : sensorStatus.trim();
    }
}