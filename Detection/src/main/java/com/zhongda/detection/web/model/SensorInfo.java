package com.zhongda.detection.web.model;

public class SensorInfo {
    private Integer sensorInfoId;

    private String smuId;

    private String smuCmsChannel;

    private Integer detectionPointId;

    private String sensorId;

    private String sensorType;

    private String sensorModel;

    private Float sensorDepth;
    
    //缓存测点名称，数据库无
    private String detectionName;
     
    public String getDetectionName() {
		return detectionName;
	}

	public void setDetectionName(String detectionName) {
		this.detectionName = detectionName == null ? null : detectionName.trim();
	}
    
    public Integer getSensorInfoId() {
        return sensorInfoId;
    }

    public void setSensorInfoId(Integer sensorInfoId) {
        this.sensorInfoId = sensorInfoId;
    }

    public String getSmuId() {
        return smuId;
    }

    public void setSmuId(String smuId) {
        this.smuId = smuId == null ? null : smuId.trim();
    }

    public String getSmuCmsChannel() {
        return smuCmsChannel;
    }

    public void setSmuCmsChannel(String smuCmsChannel) {
        this.smuCmsChannel = smuCmsChannel == null ? null : smuCmsChannel.trim();
    }

    public Integer getDetectionPointId() {
        return detectionPointId;
    }

    public void setDetectionPointId(Integer detectionPointId) {
        this.detectionPointId = detectionPointId;
    }

    public String getSensorId() {
        return sensorId;
    }

    public void setSensorId(String sensorId) {
        this.sensorId = sensorId == null ? null : sensorId.trim();
    }

    public String getSensorType() {
        return sensorType;
    }

    public void setSensorType(String sensorType) {
        this.sensorType = sensorType == null ? null : sensorType.trim();
    }

    public String getSensorModel() {
        return sensorModel;
    }

    public void setSensorModel(String sensorModel) {
        this.sensorModel = sensorModel == null ? null : sensorModel.trim();
    }

    public Float getSensorDepth() {
        return sensorDepth;
    }

    public void setSensorDepth(Float sensorDepth) {
        this.sensorDepth = sensorDepth;
    }

	@Override
	public String toString() {
		return "SensorInfo [sensorInfoId=" + sensorInfoId + ", smuId=" + smuId
				+ ", smuCmsChannel=" + smuCmsChannel + ", detectionPointId="
				+ detectionPointId + ", sensorId=" + sensorId + ", sensorType="
				+ sensorType + ", sensorModel=" + sensorModel
				+ ", sensorDepth=" + sensorDepth + ", detectionName="
				+ detectionName + "]";
	}
    
}