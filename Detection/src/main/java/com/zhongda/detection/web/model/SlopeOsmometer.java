package com.zhongda.detection.web.model;

import java.util.Date;

public class SlopeOsmometer {
    private Integer osmometerId;

    private Integer detectionId;

    private Integer sensorId;

    private Float detectionData;

    private Date detectionTime;

    private String sensorStatus;

    public Integer getOsmometerId() {
        return osmometerId;
    }

    public void setOsmometerId(Integer osmometerId) {
        this.osmometerId = osmometerId;
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