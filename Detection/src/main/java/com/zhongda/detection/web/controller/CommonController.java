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

    @RequestMapping("home")
    public String home(HttpServletRequest request) {
        return "home";
    }

    @RequestMapping("index_v2")
    public String index_v2(HttpServletRequest request) {
        return "index_v2";
    }

    @RequestMapping("calendar")
    public String calendar(HttpServletRequest request) {
        return "calendar";
    }

    @RequestMapping("chat_view")
    public String chat_view(HttpServletRequest request) {
        return "chat_view";
    }

    @RequestMapping("css_animation")
    public String css_animation(HttpServletRequest request) {
        return "css_animation";
    }

    @RequestMapping("graph_echarts_farmland")
    public String graph_echarts_farmland(HttpServletRequest request) {
        return "graph_echarts_farmland";
    }

    @RequestMapping("graph_echarts_bridge")
    public String graph_echarts_bridge(HttpServletRequest request) {
        return "graph_echarts_bridge";
    }
    @RequestMapping("graph_echarts_tunnel")
    public String graph_echarts_tunnel(HttpServletRequest request) {
        return "graph_echarts_tunnel";
    }
   
    @RequestMapping("graph_echarts_slope")
    public String graph_echarts_slope(HttpServletRequest request) {
        return "graph_echarts_slope";
    }
    @RequestMapping("icons")
    public String icons(HttpServletRequest request) {
        return "icons";
    }

    @RequestMapping("invoice_print")
    public String invoice_print(HttpServletRequest request) {
        return "invoice_print";
    }

    @RequestMapping("invoice")
    public String invoice(HttpServletRequest request) {
        return "invoice";
    }

    @RequestMapping("javascript")
    public String javascript(HttpServletRequest request) {
        return "javascript";
    }

    @RequestMapping("login_v2")
    public String login_v2(HttpServletRequest request) {
        return "login_v2";
    }

    @RequestMapping("pin_board")
    public String pin_board(HttpServletRequest request) {
        return "pin_board";
    }

    @RequestMapping("user")
    public String user(HttpServletRequest request) {
    	
        return "user";
    }

    @RequestMapping("project_detail")
    public String project_detail(HttpServletRequest request) {
        return "project_detail";
    }

    @RequestMapping("projects")
    public String projects(HttpServletRequest request) {
        return "projects";
    }

    @RequestMapping("register")
    public String register(HttpServletRequest request) {
        return "register";
    }

    @RequestMapping("table_bootstrap")
    public String table_bootstrap(HttpServletRequest request) {
        return "table_bootstrap";
    }

    @RequestMapping("table_data_tables")
    public String table_data_tables(HttpServletRequest request) {
        return "table_data_tables";
    }

    @RequestMapping("table_foo_table")
    public String table_foo_table(HttpServletRequest request) {
        return "table_foo_table";
    }

    @RequestMapping("table_jqgrid")
    public String table_jqgrid(HttpServletRequest request) {
        return "table_jqgrid";
    }

    @RequestMapping("webim")
    public String webim(HttpServletRequest request) {
        return "webim";
    }

    @RequestMapping("form_builder")
    public String form_builder(HttpServletRequest request) {
        return "form_builder";
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