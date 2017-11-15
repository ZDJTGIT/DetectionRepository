package com.zhongda.detection.core.utils.sms;

public class SmsContentTemplate {
	
	/**
	 * 验证码模板Id : 49685  
	 * 模板内容 : 你的验证码是{1}，{2}分钟内有效。如非本人操作，请忽略本短信。
	 */
	public static final int VerifyCode = 49685;
	/**
	 * 数据类告警模板Id : 57427  
	 * 模板内容 : 尊敬的(账号：{1})客户：您的项目于{2}监测到{3}的超过阈值，项目名称：{4}，采集终端：{5}，传感器编号： {6}，当前值{7}，正常范围{8}~{9}。详情请登陆中大检测在线监测服务平台查看。谢谢 ！
	 */
	public static final int ALARM_DATA_MESSAGE = 57427;
	/**
	 * 设备类告警模板Id : 57429  
	 * 模板内容 : 尊敬的(账号：{1})客户：您好！您的项目于{2}监测到{3}设备类告警信息。项目名称：{4}，采集器终端： {5}， 传感器编号：{6}，{7}，详情请点击中大检测在线检测服务平台查看，谢谢！
	 */
	public static final int ALARM_DEVICE_MESSAGE = 57429;
}
