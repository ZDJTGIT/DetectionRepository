package com.zhongda.detection.web.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class FarmlandPH {
    private Integer phId;

    private Integer detectionId;

    private Integer sensorId;

    private Float detectionData;

    private Date detectionTime;

    private String sensorStatus;

    public Integer getPhId() {
        return phId;
    }

    public void setPhId(Integer phId) {
        this.phId = phId;
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

    @JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
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