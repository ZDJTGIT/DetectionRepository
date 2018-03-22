package com.zhongda.detection.web.aspect;

import java.lang.reflect.Method;
import java.util.Date;

import org.apache.log4j.Logger;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.stereotype.Component;

/**
 * 
 * Title : 执行时间统计管理 Description : 处理执行时间统计操作
 * 
 * @Author dengzm
 * @Date 2018年1月23日 上午9:22:46
 */
@Aspect
@Component("countTimeAspect")
public class CountTimeAspect {

	private static final Logger logger = Logger
			.getLogger(CountTimeAspect.class);

	@Around("@annotation(com.zhongda.detection.web.annotation.CountTimeAnnotation)")
	public Object execute(ProceedingJoinPoint pjp) throws Throwable {
		Object result = null;
		// 从切点上获取目标方法
		MethodSignature methodSignature = (MethodSignature) pjp.getSignature();
		Method method = methodSignature.getMethod();

		// 请求的方法名
		String className = pjp.getTarget().getClass().getName();
		String methodName = method.getName();

		long startTime = new Date().getTime();
		// 调用目标方法
		result = pjp.proceed();
		long endTime = new Date().getTime();

		logger.warn("----" + className + "." + methodName + "方法执行时间："
				+ ((endTime - startTime) / 1000) + "秒----"
				+ (endTime - startTime)
				+ "毫秒------------------------------------------");
		return result;
	}
}
