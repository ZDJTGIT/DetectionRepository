package com.zhongda.detection.web.model;

import java.util.Date;

import com.fasterxml.jackson.annotation.JsonFormat;

public class Project {
	private Integer projectId;

	private Integer userId;

	private String projectName;

	private Integer projectTypeId;

	private String projectAddress;

	private String projectLongitude;

	private String projectLatitude;

	private Date projectBeginTime;

	private Date projectEndTime;

	private Integer projectStatus;

	private String projectDescription;

	// 数据库无
	private SysDictionary sysDictionary;

	// 缓存告警信息的数量
	private Integer messageCount;

	// 缓存字典表查到的状态字符串
	private String projectStatusString;

	public String getProjectStatusString() {
		return projectStatusString;
	}

	public void setProjectStatusString(String projectStatusString) {
		this.projectStatusString = projectStatusString;
	}

	public Integer getMessageCount() {
		return messageCount;
	}

	public void setMessageCount(Integer messageCount) {
		this.messageCount = messageCount;
	}

	public Integer getProjectId() {
		return projectId;
	}

	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}

	public Integer getUserId() {
		return userId;
	}

	public void setUserId(Integer userId) {
		this.userId = userId;
	}

	public String getProjectName() {
		return projectName;
	}

	public void setProjectName(String projectName) {
		this.projectName = projectName == null ? null : projectName.trim();
	}

	public Integer getProjectTypeId() {
		return projectTypeId;
	}

	public void setProjectTypeId(Integer projectTypeId) {
		this.projectTypeId = projectTypeId;
	}

	public String getProjectAddress() {
		return projectAddress;
	}

	public void setProjectAddress(String projectAddress) {
		this.projectAddress = projectAddress == null ? null : projectAddress
				.trim();
	}

	public String getProjectLongitude() {
		return projectLongitude;
	}

	public void setProjectLongitude(String projectLongitude) {
		this.projectLongitude = projectLongitude == null ? null
				: projectLongitude.trim();
	}

	public String getProjectLatitude() {
		return projectLatitude;
	}

	public void setProjectLatitude(String projectLatitude) {
		this.projectLatitude = projectLatitude == null ? null : projectLatitude
				.trim();
	}

	public void setProjectBeginTime(Date projectBeginTime) {
		this.projectBeginTime = projectBeginTime;
	}

	public Integer getProjectStatus() {
		return projectStatus;
	}

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getProjectBeginTime() {
		return projectBeginTime;
	}

	public void setProjectEndTime(Date projectEndTime) {
		this.projectEndTime = projectEndTime;
	}

	@JsonFormat(shape = JsonFormat.Shape.STRING, pattern = "yyyy-MM-dd HH:mm:ss", timezone = "GMT+8")
	public Date getProjectEndTime() {
		return projectEndTime;
	}

	public void setProjectStatus(Integer projectStatus) {
		this.projectStatus = projectStatus;
	}

	public String getProjectDescription() {
		return projectDescription;
	}

	public void setProjectDescription(String projectDescription) {
		this.projectDescription = projectDescription == null ? null
				: projectDescription.trim();
	}

	public SysDictionary getSysDictionary() {
		return sysDictionary;
	}

	public void setSysDictionary(SysDictionary sysDictionary) {
		this.sysDictionary = sysDictionary;
	}

}