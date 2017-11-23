package com.zhongda.detection.web.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class OperationLog {
	private Integer logId;

	private Integer userId;

	private String userName;

	private String operationContext;

	private String operationDescription;

	private Date operationTime;

	// 模糊查询条件，数据库没有
	private String condition;

	public OperationLog() {
	}

	public OperationLog(Integer userId, String userName,
			String operationContext, String operationDescription,
			Date operationTime) {
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
		this.operationContext = operationContext == null ? null
				: operationContext.trim();
	}

	public String getOperationDescription() {
		return operationDescription;
	}

	public void setOperationDescription(String operationDescription) {
		this.operationDescription = operationDescription == null ? null
				: operationDescription.trim();
	}

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getOperationTime() {
		return operationTime;
	}

	public void setOperationTime(Date operationTime) {
		this.operationTime = operationTime;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	@Override
	public String toString() {
		return "OperationLog [logId=" + logId + ", userId=" + userId
				+ ", userName=" + userName + ", operationContext="
				+ operationContext + ", operationDescription="
				+ operationDescription + ", operationTime=" + operationTime
				+ "]";
	}

}