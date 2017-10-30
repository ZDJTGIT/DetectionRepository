package com.zhongda.detection.core.utils;

import java.text.MessageFormat;
import java.util.Properties;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * Properties工具类
 */
public class PropertiesTool {
	
	public static final Logger logger = LoggerFactory.getLogger(PropertiesTool.class);
	
	private static final Pattern PATTERN = Pattern
			.compile("\\$\\{([^\\}]+)\\}");
	
	/**
	 * 在Properties文件中通过${key}转译为对应key的value值
	 * @param properties 传入的Properties文件
	 * @param key 需要转译为对应value的key
	 * @return key转译后的value
	 */
	public static String get(Properties properties, String key) {
		String value = properties.getProperty(key);
		Matcher matcher = PATTERN.matcher(value);
		StringBuffer buffer = new StringBuffer();
		while (matcher.find()) {
			String matcherKey = matcher.group(1);
			String matchervalue = properties.getProperty(matcherKey);
			if (matchervalue != null) {
				matcher.appendReplacement(buffer, matchervalue);
			}
		}
		matcher.appendTail(buffer);
		return buffer.toString();
	}
	
	/**
	 * 在Properties文件中通过{0}等占位符转译为对应输入参数的值
	 * @param properties 传入的Properties文件
	 * @param templateKey 模板的key(标识对应哪一个模板)
	 * @param params 替换占位符的可变参数列表
	 * @return 模板占位符替换之后的内容
	 */
	public static String get(Properties properties, String templateKey, Object... params) {
		String messageTemplate = properties.getProperty(templateKey);
		String sizeKey = "mailSize_"+templateKey.split("_")[1];
		int size = Integer.valueOf(properties.getProperty(sizeKey));
		if(size != params.length){
			logger.error("调用邮件模板时，传入的参数的个数和邮件模板不一致");
			throw new RuntimeException("调用邮件模板时，传入的参数的个数和邮件模板不一致");
		}
		return MessageFormat.format(messageTemplate, params);
	}
}
