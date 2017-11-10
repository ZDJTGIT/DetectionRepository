package com.zhongda.detection.web.model;

/**
 *  请求统一返回结果
 * @author zmdeng
 */
public class Result {
	
	public static final Integer SUCCESS = 0;//请求成功
	public static final Integer FAILURE = 1;//请求失败
	
	//状态码 
	private Integer code;
	//错误提示信息
	private String msg;
	//返回数据
	private Object data;
	
	public Integer getCode() {
		return code;
	}
	public void setCode(Integer code) {
		this.code = code;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
	public Object getData() {
		return data;
	}
	public void setData(Object data) {
		this.data = data;
	}
	
}
