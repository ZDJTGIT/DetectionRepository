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

    @RequestMapping("index_v1")
    public String index_v1(HttpServletRequest request) {
        return "index_v1";
    }

    @RequestMapping("index_v2")
    public String index_v2(HttpServletRequest request) {
        return "index_v2";
    }

    @RequestMapping("index_v3")
    public String index_v3(HttpServletRequest request) {
        return "index_v3";
    }

    @RequestMapping("index_v4")
    public String index_v4(HttpServletRequest request) {
        return "index_v4";
    }

    @RequestMapping("index_v5")
    public String index_v5(HttpServletRequest request) {
        return "index_v5";
    }

    @RequestMapping("agile_board")
    public String agile_board(HttpServletRequest request) {
        return "agile_board";
    }

    @RequestMapping("article")
    public String article(HttpServletRequest request) {
        return "article";
    }

    @RequestMapping("badges_labels")
    public String badges_labels(HttpServletRequest request) {
        return "badges_labels";
    }

    @RequestMapping("basic_gallery")
    public String basic_gallery(HttpServletRequest request) {
        return "basic_gallery";
    }

    @RequestMapping("blog")
    public String blog(HttpServletRequest request) {
        return "blog";
    }

    @RequestMapping("blueimp")
    public String blueimp(HttpServletRequest request) {
        return "blueimp";
    }

    @RequestMapping("buttons")
    public String buttons(HttpServletRequest request) {
        return "buttons";
    }

    @RequestMapping("calendar")
    public String calendar(HttpServletRequest request) {
        return "calendar";
    }

    @RequestMapping("carousel")
    public String carousel(HttpServletRequest request) {
        return "carousel";
    }

    @RequestMapping("chat_view")
    public String chat_view(HttpServletRequest request) {
        return "chat_view";
    }

    @RequestMapping("clients")
    public String clients(HttpServletRequest request) {
        return "clients";
    }

    @RequestMapping("code_editor")
    public String code_editor(HttpServletRequest request) {
        return "code_editor";
    }

    @RequestMapping("contacts")
    public String contacts(HttpServletRequest request) {
        return "contacts";
    }

    @RequestMapping("css_animation")
    public String css_animation(HttpServletRequest request) {
        return "css_animation";
    }

    @RequestMapping("diff")
    public String diff(HttpServletRequest request) {
        return "diff";
    }

    @RequestMapping("draggable_panels")
    public String draggable_panels(HttpServletRequest request) {
        return "draggable_panels";
    }

    @RequestMapping("empty_page")
    public String empty_page(HttpServletRequest request) {
        return "empty_page";
    }

    @RequestMapping("faq")
    public String faq(HttpServletRequest request) {
        return "faq";
    }

    @RequestMapping("file_manager")
    public String file_manager(HttpServletRequest request) {
        return "file_manager";
    }

    @RequestMapping("fontawesome")
    public String fontawesome(HttpServletRequest request) {
        return "fontawesome";
    }

    @RequestMapping("form_advanced")
    public String form_advanced(HttpServletRequest request) {
        return "form_advanced";
    }

    @RequestMapping("form_avatar")
    public String form_avatar(HttpServletRequest request) {
        return "form_avatar";
    }

    @RequestMapping("form_basic")
    public String form_basic(HttpServletRequest request) {
        return "form_basic";
    }

    @RequestMapping("form_builder")
    public String form_builder(HttpServletRequest request) {
        return "form_builder";
    }

    @RequestMapping("form_editors")
    public String form_editors(HttpServletRequest request) {
        return "form_editors";
    }

    @RequestMapping("form_file_upload")
    public String form_file_upload(HttpServletRequest request) {
        return "form_file_upload";
    }

    @RequestMapping("form_markdown")
    public String form_markdown(HttpServletRequest request) {
        return "form_markdown";
    }

    @RequestMapping("form_simditor")
    public String form_simditor(HttpServletRequest request) {
        return "form_simditor";
    }

    @RequestMapping("form_validate")
    public String form_validate(HttpServletRequest request) {
        return "form_validate";
    }

    @RequestMapping("form_webuploader")
    public String form_webuploader(HttpServletRequest request) {
        return "form_webuploader";
    }

    @RequestMapping("form_wizard")
    public String form_wizard(HttpServletRequest request) {
        return "form_wizard";
    }

    @RequestMapping("form_main")
    public String form_main(HttpServletRequest request) {
        return "form_main";
    }

    @RequestMapping("form_post")
    public String form_post(HttpServletRequest request) {
        return "form_post";
    }

    @RequestMapping("form_get")
    public String form_get(HttpServletRequest request) {
        return "form_get";
    }

    @RequestMapping("glyphicons")
    public String glyphicons(HttpServletRequest request) {
        return "glyphicons";
    }

    @RequestMapping("graph_echarts")
    public String graph_echarts(HttpServletRequest request) {
        return "graph_echarts";
    }

    @RequestMapping("graph_flot")
    public String graph_flot(HttpServletRequest request) {
        return "graph_flot";
    }

    @RequestMapping("graph_metrics")
    public String graph_metrics(HttpServletRequest request) {
        return "graph_metrics";
    }

    @RequestMapping("graph_morris")
    public String graph_morris(HttpServletRequest request) {
        return "graph_morris";
    }

    @RequestMapping("graph_peity")
    public String graph_peity(HttpServletRequest request) {
        return "graph_peity";
    }

    @RequestMapping("graph_rickshaw")
    public String graph_rickshaw(HttpServletRequest request) {
        return "graph_rickshaw";
    }

    @RequestMapping("graph_sparkline")
    public String graph_sparkline(HttpServletRequest request) {
        return "graph_sparkline";
    }

    @RequestMapping("grid_options")
    public String grid_options(HttpServletRequest request) {
        return "grid_options";
    }

    @RequestMapping("iconfont")
    public String iconfont(HttpServletRequest request) {
        return "iconfont";
    }

    @RequestMapping("icons")
    public String icons(HttpServletRequest request) {
        return "icons";
    }

    @RequestMapping("index-2")
    public String index_2(HttpServletRequest request) {
        return "index-2";
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

    @RequestMapping("jstree")
    public String jstree(HttpServletRequest request) {
        return "jstree";
    }

    @RequestMapping("layer")
    public String layer(HttpServletRequest request) {
        return "layer";
    }

    @RequestMapping("layerdate")
    public String layerdate(HttpServletRequest request) {
        return "layerdate";
    }

    @RequestMapping("layouts")
    public String layouts(HttpServletRequest request) {
        return "layouts";
    }

    @RequestMapping("lockscreen")
    public String lockscreen(HttpServletRequest request) {
        return "lockscreen";
    }

    @RequestMapping("login_v2")
    public String login_v2(HttpServletRequest request) {
        return "login_v2";
    }

    @RequestMapping("mail_compose")
    public String mail_compose(HttpServletRequest request) {
        return "mail_compose";
    }

    @RequestMapping("mail_detail")
    public String mail_detail(HttpServletRequest request) {
        return "mail_detail";
    }

    @RequestMapping("mailbox")
    public String mailbox(HttpServletRequest request) {
        return "mailbox";
    }

    @RequestMapping("modal_window")
    public String modal_window(HttpServletRequest request) {
        return "modal_window";
    }

    @RequestMapping("nestable_list")
    public String nestable_list(HttpServletRequest request) {
        return "nestable_list";
    }

    @RequestMapping("notifications")
    public String notifications(HttpServletRequest request) {
        return "notifications";
    }

    @RequestMapping("pin_board")
    public String pin_board(HttpServletRequest request) {
        return "pin_board";
    }

    @RequestMapping("plyr")
    public String plyr(HttpServletRequest request) {
        return "plyr";
    }

    @RequestMapping("profile")
    public String profile(HttpServletRequest request) {
        return "profile";
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

    @RequestMapping("search_results")
    public String search_results(HttpServletRequest request) {
        return "search_results";
    }

    @RequestMapping("social_feed")
    public String social_feed(HttpServletRequest request) {
        return "social_feed";
    }

    @RequestMapping("spinners")
    public String spinners(HttpServletRequest request) {
        return "spinners";
    }

    @RequestMapping("suggest")
    public String suggest(HttpServletRequest request) {
        return "suggest";
    }

    @RequestMapping("sweetalert")
    public String sweetalert(HttpServletRequest request) {
        return "sweetalert";
    }

    @RequestMapping("table_basic")
    public String table_basic(HttpServletRequest request) {
        return "table_basic";
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

    @RequestMapping("tabs_panels")
    public String tabs_panels(HttpServletRequest request) {
        return "tabs_panels";
    }

    @RequestMapping("teams_board")
    public String teams_board(HttpServletRequest request) {
        return "teams_board";
    }

    @RequestMapping("timeline_v2")
    public String timeline_v2(HttpServletRequest request) {
        return "timeline_v2";
    }

    @RequestMapping("timeline")
    public String timeline(HttpServletRequest request) {
        return "timeline";
    }

    @RequestMapping("toastr_notifications")
    public String toastr_notifications(HttpServletRequest request) {
        return "toastr_notifications";
    }

    @RequestMapping("tree_view_v2")
    public String tree_view_v2(HttpServletRequest request) {
        return "tree_view_v2";
    }

    @RequestMapping("tree_view")
    public String tree_view(HttpServletRequest request) {
        return "tree_view";
    }

    @RequestMapping("typography")
    public String typography(HttpServletRequest request) {
        return "typography";
    }

    @RequestMapping("validation")
    public String validation(HttpServletRequest request) {
        return "validation";
    }

    @RequestMapping("webim")
    public String webim(HttpServletRequest request) {
        return "webim";
    }

    @RequestMapping("widgets")
    public String widgets(HttpServletRequest request) {
        return "widgets";
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