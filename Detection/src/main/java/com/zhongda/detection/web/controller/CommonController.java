package com.zhongda.detection.web.controller;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.zhongda.detection.core.utils.vcode.Captcha;
import com.zhongda.detection.core.utils.vcode.GifCaptcha;

/**
 * 公共视图控制器
 **/
@Controller
public class CommonController {

	public static final Logger logger = LoggerFactory.getLogger(CommonController.class);

	@Resource(name="shiroEhcacheManager")
    private CacheManager cacheManager;
    private Cache<String,String> vcodeCache;

    /**
     * 首页
     */
    @RequestMapping("index")
    public String index(HttpServletRequest request) {
        return "index";
    }

    /**
     * 获取验证码（Gif版本）
     */
    @RequestMapping(value="/getGifCode",method=RequestMethod.GET)
    public void getGifCode(HttpServletRequest request,HttpServletResponse response){
    	try {
    		response.setHeader("Pragma", "No-cache");
            response.setHeader("Cache-Control", "no-cache");
            response.setDateHeader("Expires", 0);
            response.setContentType("image/gif");
            //gif格式动画验证码   宽，高，位数
            Captcha captcha = new GifCaptcha(120,34,4);
            //输出
            captcha.out(response.getOutputStream());
            //存入cache
            vcodeCache = cacheManager.getCache("vcodeCache");
            String vcode_flag = request.getParameter("nocache");
            vcodeCache.put(vcode_flag, captcha.text().toLowerCase());
    	} catch (Exception e) {
    		logger.error( "获取验证码异常："+e.getMessage());
    	}
    }

}