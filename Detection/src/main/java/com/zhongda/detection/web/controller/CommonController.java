package com.zhongda.detection.web.controller;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.zhongda.detection.core.utils.vcode.Captcha;
import com.zhongda.detection.core.utils.vcode.GifCaptcha;
import com.zhongda.detection.web.model.Alarm;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.service.AlarmService;
import com.zhongda.detection.web.service.MessageService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.UserService;

/**
 * <p>
 * 公共视图控制器
 * </p>
 * 
 * @author zmdeng
 * @date 2017年9月28日
 */
@Controller
public class CommonController {

	public static final Logger logger = LoggerFactory
			.getLogger(CommonController.class);

	@Resource
	private MessageService messageService;
	
	@Resource
	private AlarmService alarmService;

	@Resource
	private ProjectService projectService;

	@Resource(name = "shiroEhcacheManager")
	private CacheManager cacheManager;
	private Cache<String, String> vcodeCache;

	@Resource
	private UserService userService;

	/**
	 * 首页
	 */
	@RequestMapping("index")
	public String index(HttpServletRequest request, Model model) {
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		List<Alarm> alarmList = alarmService.selectPageAlarmByUserIdAndNotConfirm(user.getUserId(), 1, 2);
		PageInfo<Alarm> alarmPageInfo=new PageInfo<Alarm>(alarmList);
		model.addAttribute("alarmList", alarmList);
		model.addAttribute("alarmTotal", alarmPageInfo.getTotal());
		return "index";
	}

	@RequestMapping("home")
	public String home(HttpServletRequest request, Model model)
			throws JsonProcessingException {
		User user = (User) request.getSession().getAttribute("userInfo");
		ObjectMapper mapper = new ObjectMapper();
		int userId = user.getUserId();
		List<Project> projects = null;
		int roleId = userService.selectUserRoleByUserId(userId);
		if (roleId == 2 || roleId == 1) {
			projects = projectService.selectAllProjectWithMessageCount();
		} else {
			projects = projectService
					.selectProjectByUserIdWithMessageCount(user.getUserId());
		}
		String projectList = null;
		projectList = mapper.writeValueAsString(projects);
		System.out.println(projectList);
		model.addAttribute("projectList", projects);
		model.addAttribute("projectLists", projectList);
		return "home";
	}

	@RequestMapping("project/{projectTypeId}")
	@ResponseBody
	public List<Project> projectType(HttpServletRequest request,
			@PathVariable("projectTypeId") Integer projectTypeId) {
		User user = (User) WebUtils.getSessionAttribute(request, "userInfo");
		List<Project> projectList = projectService
				.selectProjectsByUserIdAndProjectType(user.getUserId(),
						projectTypeId);
		return projectList;
	}

	/*
	 * @RequestMapping("sensor/{projectId}")
	 * 
	 * @ResponseBody public List<SensorInfo> sensorType(
	 * 
	 * @PathVariable("projectId") Integer projectId) { List<SensorInfo>
	 * sensorList = sensorInfoService .selectSensorTypeByProjectId(projectId);
	 * return sensorList; }
	 */

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
	public String form_avatar(HttpServletRequest request) {
		return "user";
	}

	@RequestMapping("form_avatar")
	public String user(HttpServletRequest request) {
		return "form_avatar";
	}

	@RequestMapping("detectionPoint/{project}")
	public String detectionPoint(Model model, @PathVariable("project") String project) {
		String[] strings = project.split(":");
		model.addAttribute("projectTypeId", strings[0]);
		model.addAttribute("projectName", strings[1]);
		return "detectionPoint";
	}
	
	
	@RequestMapping("project_detail")
	public String project_detail(HttpServletRequest request) {
		return "project_detail";
	}
	
	@RequestMapping("thresHold/{project}")
	public String thresHold(Model model, @PathVariable("project") String project) {
		String[] strings = project.split(":");
		model.addAttribute("projectId", strings[0]);
		model.addAttribute("projectName", strings[1]);
		return "thresHold";
	}

	@RequestMapping("sensor_info/{detectionPoint}")
	public String sensor_info(Model model, @PathVariable("detectionPoint") String detectionPoint) {
		String[] strings = detectionPoint.split(":");
		model.addAttribute("detectionPointId", strings[0]);
		model.addAttribute("detectionName", strings[1]);
		return "sensor_info";
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

	@RequestMapping("graph_echarts_displacement")
	public String graph_echarts_deep(HttpServletRequest request) {
		return "graph_echarts_displacement";
	}

	@RequestMapping("graph_echarts_osmotic")
	public String graph_echarts_osmotic(HttpServletRequest request) {
		return "graph_echarts_osmotic";
	}

	@RequestMapping("graph_echarts_rainfall")
	public String graph_echarts_rainwater(HttpServletRequest request) {
		return "graph_echarts_rainfall";
	}

	/**
	 * 获取验证码（Gif版本）
	 */
	@RequestMapping(value = "/getGifCode", method = RequestMethod.GET)
	public void getGifCode(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			response.setHeader("Pragma", "No-cache");
			response.setHeader("Cache-Control", "no-cache");
			response.setDateHeader("Expires", 0);
			response.setContentType("image/gif");
			// gif格式动画验证码 宽，高，位数
			Captcha captcha = new GifCaptcha(120, 34, 4);
			// 输出
			captcha.out(response.getOutputStream());
			// 存入cache
			vcodeCache = cacheManager.getCache("vcodeCache");
			String vcode_flag = request.getParameter("nocache");
			vcodeCache.put(vcode_flag, captcha.text().toLowerCase());
		} catch (Exception e) {
			logger.error("获取验证码异常：" + e.getMessage());
		}
	}

}