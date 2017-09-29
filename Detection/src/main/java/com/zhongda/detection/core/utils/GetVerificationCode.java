package com.zhongda.detection.core.utils;

/**
 * 获取随机验证码工具类
 */

public class GetVerificationCode {

	public static String getRandom() {
		
		String num = "";
		for (int i = 0 ; i < 6 ; i ++) {
		num = num + String.valueOf((int) Math.floor(Math.random() * 9 + 1));
		}
		return num;
		}
	
}
