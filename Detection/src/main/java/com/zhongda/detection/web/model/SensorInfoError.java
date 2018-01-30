package com.zhongda.detection.web.model;

public class SensorInfoError  extends SensorInfo{
  private String errorMessage;

public SensorInfoError(String errorMessage) {
	
	this.errorMessage = errorMessage;
}

public String getErrorMessage() {
	return errorMessage;
}

public void setErrorMessage(String errorMessage) {
	this.errorMessage = errorMessage;
}
  
}
