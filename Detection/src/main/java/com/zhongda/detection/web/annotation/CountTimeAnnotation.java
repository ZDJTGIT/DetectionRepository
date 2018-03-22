package com.zhongda.detection.web.annotation;


import java.lang.annotation.Documented;
import java.lang.annotation.ElementType;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

/**
 * Title : 执行时间统计注解
 * Description : 定义需要处理执行时间统计的方法
 * @Author dengzm
 * @Date 2018年1月23日 上午9:23:37
 */
@Target(ElementType.METHOD) 
@Retention(RetentionPolicy.RUNTIME) 
@Documented
public @interface CountTimeAnnotation {
	String value() default "";
}
