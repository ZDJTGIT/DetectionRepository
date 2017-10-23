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

	private String projectStatus;

	private String projectDescription;

	private SysDictionary sysDictionary;

	// 缓存告警信息的数量
	private Integer messageCount;

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

	public String getProjectStatus() {
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

	public void setProjectStatus(String projectStatus) {
		this.projectStatus = projectStatus == null ? null : projectStatus
				.trim();
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