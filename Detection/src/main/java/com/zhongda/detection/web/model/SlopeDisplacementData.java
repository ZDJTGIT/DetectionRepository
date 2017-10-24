package com.zhongda.detection.web.model;

import java.util.Date;

public class SlopeDisplacementData {
    private Integer slopeDisplacementId;

    private Integer sensorId;

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

    private Integer smuStatus;

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

    public String getSensorStatus() {
        return sensorStatus;
    }

    public void setSensorStatus(String sensorStatus) {
        this.sensorStatus = sensorStatus == null ? null : sensorStatus.trim();
    }

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

    public Date getCurrentTimes() {
        return currentTimes;
    }

    public void setCurrentTimes(Date currentTimes) {
        this.currentTimes = currentTimes;
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
        this.detectionHoleName = detectionHoleName == null ? null : detectionHoleName.trim();
    }

    public String getDetectionStandard() {
        return detectionStandard;
    }

    public void setDetectionStandard(String detectionStandard) {
        this.detectionStandard = detectionStandard == null ? null : detectionStandard.trim();
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

    public Integer getSmuStatus() {
        return smuStatus;
    }

    public void setSmuStatus(Integer smuStatus) {
        this.smuStatus = smuStatus;
    }
}