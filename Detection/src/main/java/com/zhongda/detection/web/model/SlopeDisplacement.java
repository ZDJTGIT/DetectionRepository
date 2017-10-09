package com.zhongda.detection.web.model;

import java.util.Date;

public class SlopeDisplacement {
    private Integer displacementId;

    private Integer detectionId;

    private Integer sensorId;

    private Float detectionData;

    private Date detectionTime;

    private String sensorStatus;

    public Integer getDisplacementId() {
        return displacementId;
    }

    public void setDisplacementId(Integer displacementId) {
        this.displacementId = displacementId;
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