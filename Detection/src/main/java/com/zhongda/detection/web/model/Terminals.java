package com.zhongda.detection.web.model;

import java.util.Date;

public class Terminals {
    private Integer id;

    private Date createTime;

    private Date updateTime;

    private String smuId;

    private Integer smuRssi;

    private Integer smuStatus;

    private String smuVoltage;

    private Integer timesInterval;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getUpdateTime() {
        return updateTime;
    }

    public void setUpdateTime(Date updateTime) {
        this.updateTime = updateTime;
    }

    public String getSmuId() {
        return smuId;
    }

    public void setSmuId(String smuId) {
        this.smuId = smuId == null ? null : smuId.trim();
    }

    public Integer getSmuRssi() {
        return smuRssi;
    }

    public void setSmuRssi(Integer smuRssi) {
        this.smuRssi = smuRssi;
    }

    public Integer getSmuStatus() {
        return smuStatus;
    }

    public void setSmuStatus(Integer smuStatus) {
        this.smuStatus = smuStatus;
    }

    public String getSmuVoltage() {
        return smuVoltage;
    }

    public void setSmuVoltage(String smuVoltage) {
        this.smuVoltage = smuVoltage == null ? null : smuVoltage.trim();
    }

    public Integer getTimesInterval() {
        return timesInterval;
    }

    public void setTimesInterval(Integer timesInterval) {
        this.timesInterval = timesInterval;
    }
}