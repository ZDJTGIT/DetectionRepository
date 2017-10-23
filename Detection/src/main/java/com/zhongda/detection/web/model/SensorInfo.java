package com.zhongda.detection.web.model;

public class SensorInfo {
    private Integer sensorInfoId;

    private Integer detectionPointId;

    private String sensorId;

    private String sensorType;

    private String sensorModel;

    private Float sensorDepth;

    public Integer getSensorInfoId() {
        return sensorInfoId;
    }

    public void setSensorInfoId(Integer sensorInfoId) {
        this.sensorInfoId = sensorInfoId;
    }

    public Integer getDetectionPointId() {
        return detectionPointId;
    }

    public void setDetectionPointId(Integer detectionPointId) {
        this.detectionPointId = detectionPointId;
    }

    public String getSensorId() {
        return sensorId;
    }

    public void setSensorId(String sensorId) {
        this.sensorId = sensorId == null ? null : sensorId.trim();
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

    public Float getSensorDepth() {
        return sensorDepth;
    }

    public void setSensorDepth(Float sensorDepth) {
        this.sensorDepth = sensorDepth;
    }
}