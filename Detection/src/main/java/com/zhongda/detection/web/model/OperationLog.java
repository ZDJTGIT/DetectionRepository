package com.zhongda.detection.web.model;

import java.util.Date;

public class OperationLog {
    private Integer logId;

    private Integer userId;

    private String userName;

    private String operationContext;

    private String operationDescription;

    private Date operationTime;
    
    public OperationLog(){}
    
    public OperationLog(Integer userId, String userName, String operationContext,
			String operationDescription, Date operationTime) {
		this.userId = userId;
		this.userName = userName;
		this.operationContext = operationContext;
		this.operationDescription = operationDescription;
		this.operationTime = operationTime;
	}

	public Integer getLogId() {
        return logId;
    }

    public void setLogId(Integer logId) {
        this.logId = logId;
    }

    public Integer getUserId() {
        return userId;
    }

    public void setUserId(Integer userId) {
        this.userId = userId;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName == null ? null : userName.trim();
    }

    public String getOperationContext() {
        return operationContext;
    }

    public void setOperationContext(String operationContext) {
        this.operationContext = operationContext == null ? null : operationContext.trim();
    }

    public String getOperationDescription() {
        return operationDescription;
    }

    public void setOperationDescription(String operationDescription) {
        this.operationDescription = operationDescription == null ? null : operationDescription.trim();
    }

    public Date getOperationTime() {
        return operationTime;
    }

    public void setOperationTime(Date operationTime) {
        this.operationTime = operationTime;
    }
}