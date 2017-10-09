package com.zhongda.detection.web.model;

import java.util.Date;

public class SlopeOsmometerData {
    private Integer slopeOsmometerId;

    private Integer sensorId;

    private Integer detectionId;

    private String sensorStatus;

    private Date firstTime;

    private Float firstData;

    private Date previousTime;

    private Float previousData;

    private Date currentTime;

    private Float currentData;

    private Float currentOsmometer;

    private Float totalOsmometer;

    private Float speedChange;

    private String detectionHoleName;

    private String detectionStandard;

    private Integer detectionNums;

    private Float detectionSpace;

    private String tester;

    public Integer getSlopeOsmometerId() {
        return slopeOsmometerId;
    }

    public void setSlopeOsmometerId(Integer slopeOsmometerId) {
        this.slopeOsmometerId = slopeOsmometerId;
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

    public Date getCurrentTime() {
        return currentTime;
    }

    public void setCurrentTime(Date currentTime) {
        this.currentTime = currentTime;
    }

    public Float getCurrentData() {
        return currentData;
    }

    public void setCurrentData(Float currentData) {
        this.currentData = currentData;
    }

    public Float getCurrentOsmometer() {
        return currentOsmometer;
    }

    public void setCurrentOsmometer(Float currentOsmometer) {
        this.currentOsmometer = currentOsmometer;
    }

    public Float getTotalOsmometer() {
        return totalOsmometer;
    }

    public void setTotalOsmometer(Float totalOsmometer) {
        this.totalOsmometer = totalOsmometer;
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

    public String getTester() {
        return tester;
    }

    public void setTester(String tester) {
        this.tester = tester == null ? null : tester.trim();
    }
}