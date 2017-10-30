package com.zhongda.detection.core.utils.sms;

public class SmsContentTemplate {
	
	/**
	 * 验证码模板Id : 49685  
	 * 模板内容 : 你的验证码是{1}，{2}分钟内有效。如非本人操作，请忽略本短信。
	 */
	public static final int VerifyCode = 49685;
	/**
	 * 验证码模板Id : 51869  
	 * 模板内容 : 尊敬的(账号：{1})客户：您的{2}项目，编号为：{3}的传感器监测到{4}超过阈值，当前值{5}，阈值范围{6}~{7}。详情请登陆中大检测在线监测服务平台查看。谢谢！
	 */
	public static final int ALARM_DATA_MESSAGE = 51869;
}
