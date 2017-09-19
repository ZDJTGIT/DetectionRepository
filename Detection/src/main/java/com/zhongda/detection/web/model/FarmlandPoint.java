package com.zhongda.detection.web.model;

import java.util.Date;

public class FarmlandPoint {
    private Integer timeId;

    private Integer farmlandPointId;

    private Integer farmlandId;

    private String detectionPosition;

    private Date detectionTime;

    private Float waterDepth;

    private Float earthPh;

    private Float totalCadmium;

    private Float effectiveCadmium;

    public Integer getTimeId() {
        return timeId;
    }

    public void setTimeId(Integer timeId) {
        this.timeId = timeId;
    }

    public Integer getFarmlandPointId() {
        return farmlandPointId;
    }

    public void setFarmlandPointId(Integer farmlandPointId) {
        this.farmlandPointId = farmlandPointId;
    }

    public Integer getFarmlandId() {
        return farmlandId;
    }

    public void setFarmlandId(Integer farmlandId) {
        this.farmlandId = farmlandId;
    }

    public String getDetectionPosition() {
        return detectionPosition;
    }

    public void setDetectionPosition(String detectionPosition) {
        this.detectionPosition = detectionPosition == null ? null : detectionPosition.trim();
    }

    public Date getDetectionTime() {
        return detectionTime;
    }

    public void setDetectionTime(Date detectionTime) {
        this.detectionTime = detectionTime;
    }

    public Float getWaterDepth() {
        return waterDepth;
    }

    public void setWaterDepth(Float waterDepth) {
        this.waterDepth = waterDepth;
    }

    public Float getEarthPh() {
        return earthPh;
    }

    public void setEarthPh(Float earthPh) {
        this.earthPh = earthPh;
    }

    public Float getTotalCadmium() {
        return totalCadmium;
    }

    public void setTotalCadmium(Float totalCadmium) {
        this.totalCadmium = totalCadmium;
    }

    public Float getEffectiveCadmium() {
        return effectiveCadmium;
    }

    public void setEffectiveCadmium(Float effectiveCadmium) {
        this.effectiveCadmium = effectiveCadmium;
    }
}