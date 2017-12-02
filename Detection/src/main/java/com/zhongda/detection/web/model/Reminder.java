package com.zhongda.detection.web.model;

import java.util.Date;

public class Reminder {
    private Integer reminderId;

    private String smuCmsId;

    private String smuCmsChannel;

    private String sensorId;

    private String reminderContext;

    private Date createTime;

    private Date lastUpdateTime;

    private Integer frequency;

    private String status;

    public Integer getReminderId() {
        return reminderId;
    }

    public void setReminderId(Integer reminderId) {
        this.reminderId = reminderId;
    }

    public String getSmuCmsId() {
        return smuCmsId;
    }

    public void setSmuCmsId(String smuCmsId) {
        this.smuCmsId = smuCmsId == null ? null : smuCmsId.trim();
    }

    public String getSmuCmsChannel() {
        return smuCmsChannel;
    }

    public void setSmuCmsChannel(String smuCmsChannel) {
        this.smuCmsChannel = smuCmsChannel == null ? null : smuCmsChannel.trim();
    }

    public String getSensorId() {
        return sensorId;
    }

    public void setSensorId(String sensorId) {
        this.sensorId = sensorId == null ? null : sensorId.trim();
    }

    public String getReminderContext() {
        return reminderContext;
    }

    public void setReminderContext(String reminderContext) {
        this.reminderContext = reminderContext == null ? null : reminderContext.trim();
    }

    public Date getCreateTime() {
        return createTime;
    }

    public void setCreateTime(Date createTime) {
        this.createTime = createTime;
    }

    public Date getLastUpdateTime() {
        return lastUpdateTime;
    }

    public void setLastUpdateTime(Date lastUpdateTime) {
        this.lastUpdateTime = lastUpdateTime;
    }

    public Integer getFrequency() {
        return frequency;
    }

    public void setFrequency(Integer frequency) {
        this.frequency = frequency;
    }

    public String getStatus() {
        return status;
    }

    public void setStatus(String status) {
        this.status = status == null ? null : status.trim();
    }
}