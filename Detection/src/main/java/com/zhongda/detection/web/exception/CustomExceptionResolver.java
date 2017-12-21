package com.zhongda.detection.web.exception;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.AuthorizationException;
import org.apache.shiro.authz.UnauthorizedException;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Component;
import org.springframework.web.servlet.HandlerExceptionResolver;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.zhongda.detection.web.model.Result;

/**
 * 自定义异常处理器
 * 
 * @author zmdeng
 * @date 2017年12月20日
 */
@Component(value = "customExceptionResolver")
public class CustomExceptionResolver implements HandlerExceptionResolver {
	
	public static final Logger logger = LoggerFactory.getLogger(CustomExceptionResolver.class);
	
	@Override
	public ModelAndView resolveException(HttpServletRequest request,
			HttpServletResponse response, Object handler, Exception ex) {
		logger.error("【抛出异常】--异常路径为：" + request.getServletPath() + "\n【异常信息】--" +  ex.getMessage());
		if (isAjaxRequest(request)) {
            // 输出JSON
			Result<String> result = judgeExceptionType(ex);
            writeJson(result, response);
            return null;
        } else {
        	// 向前台返回错误信息
    		ModelAndView modelAndView = new ModelAndView();
    		modelAndView.setViewName("404");
            return modelAndView;
        }
	}
	
	/**
	 * 判断异常类型
	 * @param ex
	 * @return
	 */
	private Result<String> judgeExceptionType(Exception ex) {
		Result<String> result = new Result<String>();
		// 如果抛出的是系统自定义的异常则直接转换
		if (ex instanceof UnauthorizedException || ex instanceof AuthorizationException) {
            result.setCode(Result.FAILURE);
            result.setMsg("没有该权限，如有需要，请联系管理员");
		} else {
			result.setCode(Result.FAILURE);
            result.setMsg("未知错误");
		}
		return result;
	}

	/**
	 * 判断是不是ajax请求
	 * @param request
	 * @return
	 */
	private boolean isAjaxRequest(HttpServletRequest request) {
		String requestedWith = request.getHeader("x-requested-with");
		if (requestedWith != null
				&& requestedWith.equalsIgnoreCase("XMLHttpRequest")) {
			return true;
		} else {
			return false;
		}
	}
	
	/**
	 * 输出json格式的错误信息
	 * @param result 异常信息
	 * @param response 
	 */
    private void writeJson(Result<String> result, HttpServletResponse response) {
        PrintWriter out = null;
        try {
            response.setCharacterEncoding("UTF-8");
            response.setContentType("application/json; charset=utf-8");
            out = response.getWriter();
            ObjectMapper mapper = new ObjectMapper();
            out.write(mapper.writeValueAsString(result));
            out.flush();
        } catch (IOException e) {
            e.printStackTrace();
        } finally {
            if (out != null) {
                out.close();
            }
        }
    }

}
