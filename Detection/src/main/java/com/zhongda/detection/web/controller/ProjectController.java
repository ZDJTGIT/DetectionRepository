package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.pagehelper.PageInfo;
import com.zhongda.detection.core.utils.JXLExcel;
import com.zhongda.detection.web.dao.ThresholdMapper;
import com.zhongda.detection.web.model.AlarmLinkman;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.LaserData;
import com.zhongda.detection.web.model.OperationLog;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.StaticLevelData;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.AlarmLinkmanService;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.ImageService;
import com.zhongda.detection.web.service.LaserDataService;
import com.zhongda.detection.web.service.MessageService;
import com.zhongda.detection.web.service.OperationLogService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.RoleService;
import com.zhongda.detection.web.service.SensorInfoService;
import com.zhongda.detection.web.service.StaticLevelDataService;
import com.zhongda.detection.web.service.SysDictionaryService;
import com.zhongda.detection.web.service.UserService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

	@Resource
	private UserService userService;

	@Resource
	private SysDictionaryService sysDictionaryServce;

	@Resource
	private DetectionPointService detectionPointService;

	@Autowired
	private ThresholdMapper thresholdService;

	@Autowired
	private SensorInfoService sensorInfoService;

	@Autowired
	private ProjectService projectService;

	@Autowired
	private MessageService messageService;

	@Autowired
	private ImageService imageService;

	@Autowired
	private RoleService roleService;

	@Resource
	private OperationLogService operationLogService;

	@Resource
	private AlarmLinkmanService alarmLinkmanService;

	@Resource
	private LaserDataService laserDataService;

	@Resource
	private StaticLevelDataService staticLevelDataService;

	@Resource
	private JXLExcel jxlExcel;

	@RequestMapping(value = "/myproject")
	public @ResponseBody Map<String, List<Project>> queryProject(Integer userId) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			return projectService.selectAllProjects();
		}
		return projectService.selectProjectAndSysDicByUserId(userId);
	}

	/**
	 * 左侧栏具体项目类型
	 * 
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/queryItem")
	public @ResponseBody List<DetectionPoint> queryItem(Integer projectId) {
		List<DetectionPoint> itemNameList = detectionPointService
				.selectItemNameByProjectgId(projectId);
		return itemNameList;
	}

	/**
	 * 激光测距
	 * 
	 * @param model
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value = "/laserRanging")
	public String laserRanging(Model model, Integer projectId,
			Integer detectionTypeId) throws JsonProcessingException {
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String currentTime = simpleDateFormat.format(date);
		List<DetectionPoint> laserList = detectionPointService
				.selectLaserDataByCurrentTimes(projectId, detectionTypeId,
						currentTime);
		List<Threshold> thresholdList = thresholdService
				.selectByProjectIdAndDetectionTypeId(projectId, detectionTypeId);
		HashMap<Integer, Threshold> hashMap2 = new HashMap<Integer, Threshold>();
		for (Threshold threshold : thresholdList) {
			hashMap2.put(threshold.getThresholdTypeId(), threshold);
		}
		Map<String, Object> hashMap = new HashMap<String, Object>();
		Image image = imageService.selectImageByTwoId(projectId,
				detectionTypeId);
		hashMap.put("laser", laserList);
		hashMap.put("threshold", hashMap2);
		ObjectMapper mapper = new ObjectMapper();
		String map = mapper.writeValueAsString(hashMap);
		model.addAttribute("image", image);
		model.addAttribute("map", map);
		model.addAttribute("projectId", projectId);
		model.addAttribute("detectionTypeId", detectionTypeId);
		return "graph_echarts_laserRanging";

	}

	/**
	 * 激光测距
	 * 
	 * @param currentTime
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	@RequestMapping(value = "/selectlaserRanging")
	public @ResponseBody Map<String, Object> selectlaserRanging(
			String currentTime, Integer projectId, Integer detectionTypeId) {
		List<DetectionPoint> laserList = detectionPointService
				.selectLaserDataByCurrentTimes(projectId, detectionTypeId,
						currentTime);
		List<Threshold> thresholdList = thresholdService
				.selectByProjectIdAndDetectionTypeId(projectId, detectionTypeId);
		HashMap<Integer, Threshold> hashMap2 = new HashMap<Integer, Threshold>();
		for (Threshold threshold : thresholdList) {
			hashMap2.put(threshold.getThresholdTypeId(), threshold);
		}
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("laser", laserList);
		hashMap.put("threshold", hashMap2);
		return hashMap;
	}

	// /**
	// * 地铁总表
	// *
	// * @return
	// * @throws JsonProcessingException
	// */
	// @RequestMapping(value = "/subwayRail")
	// public String subwayRail(Integer projectId, Model model)
	// throws JsonProcessingException {
	// System.out.println("projectId:" + projectId);
	// List<DetectionPoint> laserList = detectionPointService
	// .selectLaserDataByCurrentTimes(projectId, 26, "2");
	// // List<DetectionPoint> selectKlineGraphData = detectionPointService
	// // .selectKlineGraphData(projectId, 26);// 每天最大值最小值
	// // HashMap<Integer, DetectionPoint> hashMap = new HashMap<Integer,
	// // DetectionPoint>();
	// // for (DetectionPoint detectionPoint : selectKlineGraphData) {
	// // hashMap.put(detectionPoint.getDetectionPointId(), detectionPoint);
	// // }
	// ObjectMapper mapper = new ObjectMapper();
	// String laser = mapper.writeValueAsString(laserList);
	// // String kline = mapper.writeValueAsString(hashMap);
	// model.addAttribute("laserList", laser);
	// // model.addAttribute("kline", kline);
	// return "graph_echarts_subwayRail";
	// }

	/**
	 * 进入地铁总表数据对比页面
	 * 
	 * @return
	 */
	@RequestMapping(value = "/subwayRail", method = RequestMethod.GET)
	public String subwayRail(Integer projectId, Model model) {
		model.addAttribute("projectId", projectId);
		return "graph_echarts_subwayRail";
	}

	/**
	 * 获取地铁总表数据
	 * 
	 * @return
	 */
	@RequestMapping(value = "/subwayRailComparison", method = RequestMethod.POST)
	@ResponseBody
	public List<DetectionPoint> subwayRailComparison(Integer projectId,
			String begin, String end, String dateRange) {
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat(
				"yyyy-MM-dd HH:mm:ss");
		Calendar lastDate = Calendar.getInstance();
		List<DetectionPoint> laserList = null;
		// System.out.println("begin:" + begin + " end:" + end + " dateRange:"
		// + dateRange.length());
		if (dateRange.length() != 0) {
			end = simpleDateFormat.format(date);
			lastDate.setTime(date);
			if ("最近一周".equals(dateRange)) {
				lastDate.add(Calendar.DATE, -1);
			} else if ("最近一月".equals(dateRange)) {
				lastDate.add(Calendar.MONTH, -1);
			} else if ("最近三个月".equals(dateRange)) {
				lastDate.add(Calendar.MONTH, -3);
			} else if ("最近六个月".equals(dateRange)) {
				lastDate.add(Calendar.MONTH, -6);
			} else if ("最近一年".equals(dateRange)) {
				lastDate.add(Calendar.YEAR, -1);
			} else if ("全部".equals(dateRange)) {
				return detectionPointService.selectLaserDataByCurrentTimes(
						projectId, 26, "2");
			}
			Date m = lastDate.getTime();
			begin = simpleDateFormat.format(m);
		}
		if (begin.length() == 0 && end.length() == 0) {
			end = simpleDateFormat.format(date);
			lastDate.roll(Calendar.DATE, -7);// 日期回滚7天
			begin = simpleDateFormat.format(lastDate.getTime());
		}
		// System.out.println("begin:" + begin + " end:" + end);
		laserList = detectionPointService.selectAllLaserDataByCurrentTimes(
				projectId, 26, begin, end);
		System.out.println(laserList);
		return laserList;
	}

	/**
	 * 沉降
	 * 
	 * @param model
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 * @throws JsonProcessingException
	 */
	@RequestMapping(value = "/staticLevel")
	public String staticLevel(Model model, Integer projectId,
			Integer detectionTypeId) {
		System.out.println(detectionTypeId);
		Date date = new Date();
		SimpleDateFormat simpleDateFormat = new SimpleDateFormat("yyyy-MM-dd");
		String format = simpleDateFormat.format(date);
		Image image = imageService.selectImageByTwoId(projectId,
				detectionTypeId);
		model.addAttribute("image", image);
		model.addAttribute("currentTime", format);
		model.addAttribute("projectId", projectId);
		model.addAttribute("detectionTypeId", detectionTypeId);
		return "graph_echarts_staticLevel";
	}

	@RequestMapping(value = "/staticLevelMonitor")
	public @ResponseBody List<DetectionPoint> staticLevelMonitor(
			Integer projectId, Integer detectionTypeId, String currentTime) {
		List<DetectionPoint> staticList = detectionPointService
				.selectStaticLevelByCurrentTimes(projectId, detectionTypeId,
						currentTime);
		return staticList;
	}

	/**
	 * 查询所有项目
	 * 
	 * @return
	 */
	@RequestMapping(value = "/selectAllProject")
	public @ResponseBody List<Project> queryAllProjec() {
		return projectService.selectAllProject();
	}

	/**
	 * 批量插入告警联系人
	 * 
	 * @param alarList
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/insertAlarmLinkmanList", method = RequestMethod.POST)
	public @ResponseBody List<AlarmLinkman> insertAlarmLinkmanList(
			@RequestBody List<AlarmLinkman> alarList,
			HttpServletResponse response, HttpServletRequest request) {
		int isTrue = alarmLinkmanService.insertAlarmLinkmanList(alarList);
		if (isTrue > 0) {
			StringBuffer idString = new StringBuffer();
			for (AlarmLinkman alarmLinkman : alarList) {
				idString.append(alarmLinkman.getAlarmLinkmanId() + ",");
			}
			User user = (User) WebUtils
					.getSessionAttribute(request, "userInfo");
			operationLogService.insertOperationLog(new OperationLog(user
					.getUserId(), user.getUserName(), "用户插入", user
					.getUserName() + "插入" + isTrue + "条告警联系人，ID是" + idString,
					new Date()));
			return alarList;
		} else {
			return new ArrayList<AlarmLinkman>();
		}
	}

	/**
	 * 修改告警联系人状态
	 * 
	 * @param status
	 * @param alarmLinkmanId
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/updateAlarmLinmanStatus")
	public void updateAlarmLinmanStatus(Integer status, Integer alarmLinkmanId,
			HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		int isOk = alarmLinkmanService.updateStatusByalarmLinkmanId(status,
				alarmLinkmanId);
		if (isOk > 0) {
			String statusString = "启用";
			if (status == 28) {
				statusString = "禁用";
			}
			User user = (User) WebUtils
					.getSessionAttribute(request, "userInfo");
			operationLogService.insertOperationLog(new OperationLog(user
					.getUserId(), user.getUserName(), "用户修改", user
					.getUserName()
					+ "修改告警联系人(alarm_linkman)表，ID："
					+ alarmLinkmanId + "，告警联系人状态修改为:" + statusString,
					new Date()));
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}

	/**
	 * 删除告警联系人
	 * 
	 * @param alarmLinkmanId
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/deletealarm")
	public void deletealarm(Integer alarmLinkmanId,
			HttpServletResponse response, HttpServletRequest request)
			throws IOException {
		System.out.println(alarmLinkmanId);
		int key = alarmLinkmanService.deleteByPrimaryKey(alarmLinkmanId);
		System.out.println(key);
		if (key > 0) {
			User user = (User) WebUtils
					.getSessionAttribute(request, "userInfo");
			operationLogService.insertOperationLog(new OperationLog(user
					.getUserId(), user.getUserName(), "用户删除", user
					.getUserName() + "删除ID:" + alarmLinkmanId + "的告警联系人",
					new Date()));
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}

	/**
	 * 导出表
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @param projectId
	 * @param detectionTypeId
	 * @param detectionName
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/exportExcel")
	public void excel(String sensorId, String currentTime, Integer projectId,
			Integer detectionTypeId, String detectionName,
			HttpServletResponse response) throws IOException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		List<LaserData> list = laserDataService.selectAllDataBySensorIdAndTime(
				sensorId, currentTime);
		Project project = projectService.selectProjectAndSysdicByTwoId(
				projectId, detectionTypeId);
		String datesnew = format.format(list.get(0).getCurrentTimes());
		response.setContentType("application/octet-stream");
		response.setContentType("application/OCTET-STREAM;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ datesnew + ".xls");
		String[] head = { "初次测试值(MM)", "前次测试时间", "前次测试值(MM)", "本次检测时间",
				"本次测试值(MM)", "单次变化量(MM)", "总变化量(MM)", "变化速率(MM/MIN)" };

		jxlExcel.export(response, list, head, project, detectionName);

	}

	/**
	 * 导出表沉降
	 * 
	 * @param sensorId
	 * @param currentTime
	 * @param projectId
	 * @param detectionTypeId
	 * @param detectionName
	 * @param response
	 * @throws IOException
	 */
	@RequestMapping(value = "/excel_statis")
	public void excel_statis(String sensorId, String currentTime,
			Integer projectId, Integer detectionTypeId, String detectionName,
			HttpServletResponse response) throws IOException {
		SimpleDateFormat format = new SimpleDateFormat("yyyy-MM-dd");
		List<StaticLevelData> list = staticLevelDataService
				.selectAllDataBySensorIdAndTime(sensorId, currentTime);
		Project project = projectService.selectProjectAndSysdicByTwoId(
				projectId, detectionTypeId);
		String datesnew = format.format(list.get(0).getCurrentTimes());
		response.setContentType("application/octet-stream");
		response.setContentType("application/OCTET-STREAM;charset=UTF-8");
		response.setHeader("Content-Disposition", "attachment;filename="
				+ datesnew + ".xls");
		String[] head = { "初次测试值(MM)", "前次测试时间", "前次测试值(MM)", "本次检测时间",
				"本次测试值(MM)", "单次变化量(MM)", "总变化量(MM)", "变化速率(MM/MIN)", "温度(℃)" };

		jxlExcel.export_static(response, list, head, project, detectionName);

	}

	/**
	 * 分页查找用户所有项目
	 * 
	 * @param project
	 *            封装查询条件
	 * @param request
	 *            获取当前登录用户信息
	 * @return
	 */
	@RequestMapping(value = "/projectPageList", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> projectPageList(@RequestBody Project project,
			HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (!subject.hasRole(RoleSign.ADMIN)
				&& !subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 非管理员用户，只可查看自己的项目信息，查询条件增加userId
			User user = (User) WebUtils
					.getSessionAttribute(request, "userInfo");
			project.setUserId(user.getUserId());
		}
		List<Project> projectList = projectService
				.selectProjectWithAlarmCount(project);
		PageInfo<Project> projectPageInfo = new PageInfo<Project>(projectList);

		Map<String, Object> projectMap = new HashMap<String, Object>();
		projectMap.put("total", projectPageInfo.getTotal());
		projectMap.put("projectList", projectList);
		return projectMap;
	}

	/**
	 * 自动更新项目状态 每次打开项目界面，获取所有项目的创建时间和结束时间并比对当前时间，修改项目状态
	 */
	@RequestMapping(value = "/updetaProjectStatus", method = RequestMethod.GET)
	public void updetaProjectStatus() {
		List<Project> projectList = projectService.selectAllProject();
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");// 设置日期格式
		String beginTime;
		String emdTime;
		String nowTime = df.format(new Date());// 获取当前系统时间
		for (Project project : projectList) {
			beginTime = df.format(project.getProjectBeginTime());// 获取项目开始时间
			emdTime = df.format(project.getProjectEndTime());// 获取项目结束时间
			long nowTimeMillionSeconds = 0;
			long beginTimeMillionSeconds = 0;
			long endTimeMillionSeconds = 0;
			try {
				nowTimeMillionSeconds = df.parse(nowTime).getTime();// 把当前系统时间转化成毫秒数
				beginTimeMillionSeconds = df.parse(beginTime).getTime();// 把项目开始时间转化成毫秒数
				endTimeMillionSeconds = df.parse(emdTime).getTime();// 把项目结束时间转化成毫秒数
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (nowTimeMillionSeconds < beginTimeMillionSeconds) {
				// 开始时间在当前时间之后-未启动
				project.setProjectStatus(21);
			} else if ((nowTimeMillionSeconds > beginTimeMillionSeconds)
					& (nowTimeMillionSeconds < endTimeMillionSeconds)) {
				// 开始时间在当前时间之前，结束时间在当前时间之后-已启动
				project.setProjectStatus(22);
			} else {
				// 开始时间在当前时间之前，结束时间在当前时间之前-已结束
				project.setProjectStatus(24);
			}
			projectService.updateByPrimaryKeySelective(project);
			System.out.println(project.getProjectName());
		}
	}

	/**
	 * 新建项目时查找数据库用户
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/showUser", method = RequestMethod.POST)
	@ResponseBody
	public List<User> showUser(Integer userId) {
		return userService.selectUserWithoutAdmin();
	}

	/**
	 * 新建项目时加载项目类型信息
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/showProjectType", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectType(Integer userId) {
		return sysDictionaryServce.selectSysDictionaryType();
	}

	/**
	 * 新建项目时加载项目状态
	 * 
	 * @param userId
	 * @return
	 */
	// @RequestMapping(value = "/showProjectStatus", method =
	// RequestMethod.POST)
	// @ResponseBody
	// public List<SysDictionary> showProjectStatus(Integer userId) {
	// return sysDictionaryServce.selectSysDictionaryType_Status();
	// }

	/**
	 * 编辑项目加载用户，默认显示选中用户
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/showUserType_selected", method = RequestMethod.POST)
	@ResponseBody
	public List<User> showUserType_selected(Integer userId) {
		return userService.selectUserWithoutAdmin();
	}

	/**
	 * 查找数据库项目类型（编辑项目时）
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/showProjectType_selected", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectType_selected(Integer userId) {
		return sysDictionaryServce.selectSysDictionaryType();
	}

	/**
	 * 查找数据库项目状态（编辑项目时）
	 * 
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/showProjectStatus_selected", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectStatus_selected(Integer userId) {
		return sysDictionaryServce.selectSysDictionaryType_Status();
	}

	/**
	 * 打开编辑项目时默认选中当前项目信息对应用户和项目类型
	 * 
	 * @param projectId
	 * @param projectTypeId
	 * @return
	 */
	@RequestMapping(value = "/showSelectUserAndProjectType", method = RequestMethod.POST)
	@ResponseBody
	public Project showSelectUserAndProjectType(Integer projectId,
			Integer projectTypeId) {// 项目ID、项目类型ID
		SysDictionary sysDictionary = sysDictionaryServce
				.selectByPrimaryKey(projectTypeId);
		Project project = projectService.selectByPrimaryKey(projectId);
		project.setSysDictionary(sysDictionary);
		return project;
	}

	/**
	 * 新建项目
	 * 
	 * @param project
	 * @return
	 */
	@RequestMapping(value = "/addProject", method = RequestMethod.POST)
	@ResponseBody
	public Project addProject(@RequestBody Project project,
			HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可添加项目
			// 通过开始时间和结束时间获取项目状态(未启动，已启动，已结束)
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");// 设置日期格式
			String nowTime = df.format(new Date());// 获取当前系统时间
			String beginTime = df.format(project.getProjectBeginTime());// 获取项目开始时间
			String emdTime = df.format(project.getProjectEndTime());// 获取项目结束时间
			long nowTimeMillionSeconds = 0;
			long beginTimeMillionSeconds = 0;
			long endTimeMillionSeconds = 0;
			try {
				nowTimeMillionSeconds = df.parse(nowTime).getTime();// 把当前系统时间转化成毫秒数
				beginTimeMillionSeconds = df.parse(beginTime).getTime();// 把项目开始时间转化成毫秒数
				endTimeMillionSeconds = df.parse(emdTime).getTime();// 把项目结束时间转化成毫秒数
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (nowTimeMillionSeconds < beginTimeMillionSeconds) {
				// 开始时间在当前时间之后-未启动
				project.setProjectStatus(21);
			} else if ((nowTimeMillionSeconds > beginTimeMillionSeconds)
					& (nowTimeMillionSeconds < endTimeMillionSeconds)) {
				// 开始时间在当前时间之前，结束时间在当前时间之后-已启动
				project.setProjectStatus(22);
			} else {
				// 开始时间在当前时间之前，结束时间在当前时间之前-已结束
				project.setProjectStatus(24);
			}
			projectService.insertSelective(project);
			// 项目ID自增长，取出
			project = projectService.selectByProjectName(project
					.getProjectName());
			// 项目状态为int关联字典表，取出
			project.setProjectStatusString(sysDictionaryServce
					.selectProjectStatusByDicId(project.getProjectStatus()));
			// 创建完项目在图片表中按项目类型添加记录
			// 获取项目类型ID
			List<SysDictionary> sysDictionaryList = sysDictionaryServce
					.selectSysDictionaryByProjectTypeId(project
							.getProjectTypeId());
			for (SysDictionary sysDictionary : sysDictionaryList) {
				Image image = new Image();
				image.setUserId(project.getUserId());
				image.setProjectId(project.getProjectId());
				image.setProjectTypeId(project.getProjectTypeId());
				image.setDetectionTypeId(sysDictionary.getDicId());
				imageService.insertSelective(image);
			}
		} else {
			// 非管理员不能添加项目
			project.setUserId(2);
		}
		// 插入一条操作日志
		User currentUser = (User) WebUtils.getSessionAttribute(request,
				"userInfo");
		operationLogService.insertOperationLog(new OperationLog(currentUser
				.getUserId(), currentUser.getUserName(), "项目插入", currentUser
				.getUserName() + "插入项目，项目名为：" + project.getProjectName(),
				new Date()));
		return project;
	}

	/**
	 * 修改项目
	 * 
	 * @param project
	 * @return
	 */
	@RequestMapping(value = "/selectProject", method = RequestMethod.POST)
	@ResponseBody
	public Project selectProject(@RequestBody Project project,
			HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 通过开始时间和结束时间获取项目状态(未启动，已启动，已结束)
			SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");// 设置日期格式
			String nowTime = df.format(new Date());// 获取当前系统时间
			String beginTime = df.format(project.getProjectBeginTime());// 获取项目开始时间
			String emdTime = df.format(project.getProjectEndTime());// 获取项目结束时间
			long nowTimeMillionSeconds = 0;
			long beginTimeMillionSeconds = 0;
			long endTimeMillionSeconds = 0;
			try {
				nowTimeMillionSeconds = df.parse(nowTime).getTime();// 把当前系统时间转化成毫秒数
				beginTimeMillionSeconds = df.parse(beginTime).getTime();// 把项目开始时间转化成毫秒数
				endTimeMillionSeconds = df.parse(emdTime).getTime();// 把项目结束时间转化成毫秒数
			} catch (ParseException e) {
				e.printStackTrace();
			}
			if (nowTimeMillionSeconds < beginTimeMillionSeconds) {
				// 开始时间在当前时间之后-未启动
				project.setProjectStatus(21);
			} else if ((nowTimeMillionSeconds > beginTimeMillionSeconds)
					& (nowTimeMillionSeconds < endTimeMillionSeconds)) {
				// 开始时间在当前时间之前，结束时间在当前时间之后-已启动
				project.setProjectStatus(22);
			} else {
				// 开始时间在当前时间之前，结束时间在当前时间之前-已结束
				project.setProjectStatus(24);
			}
			projectService.updateByPrimaryKeySelective(project);
			// 项目状态为int关联字典表，取出
			project.setProjectStatusString(sysDictionaryServce
					.selectProjectStatusByDicId(project.getProjectStatus()));
			// 插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(), currentUser.getUserName(), "项目修改",
					currentUser.getUserName() + "修改项目，项目名为："+ project.getProjectName(), new Date()));
			return project;
		} else {
			return null;
		}
	}

	/**
	 * 删除用户项目
	 * 
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/deleteProject", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteProject(Integer projectId, HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可删除项目
			// 项目ID删除项目
			projectService.deleteByPrimaryKey(projectId);
			// 项目ID删除采集器---
			// 项目ID删除测点
			detectionPointService.deleteByProjectId(projectId);
			// 项目ID关联测点表和传感器表删除传感器
			sensorInfoService.deleteByProjectId(projectId);
			// 项目ID删除阀值
			thresholdService.deleteByProjectId(projectId);
			// 项目ID删除图片(先删除服务器上图片，再删除数据库记录)
			imageService.delateImageByProjectId(projectId);
			imageService.deleteByProjectId(projectId);
			// 插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,
					"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser
					.getUserId(), currentUser.getUserName(), "项目删除",
					currentUser.getUserName() + "删除项目，项目ID为：" + projectId,
					new Date()));
			return 1;
		} else {
			// 非管理员不能删除项目
			return 2;
		}
	}

	/**
	 * 传projectId获取用户信息
	 * 
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/obtainProject", method = RequestMethod.POST)
	@ResponseBody
	public Project obtainProject(Integer projectId) {
		return projectService.selectByPrimaryKey(projectId);
	}

	/**
	 * 获取测点数量，传感器数量，阀值数量，图片数量，告警信息数量，采集器数量）。
	 * 
	 * @param projectId
	 * @return
	 */
	@RequestMapping(value = "/obtainCount", method = RequestMethod.POST)
	@ResponseBody
	public Project obtainCount(Integer projectId) {
		Project project = new Project();
		project.setAlarmCount(projectService.selectAlarmCount(projectId).getAlarmCount());
		project.setDetectionPointCount(projectService.selectDetectionCount(projectId).getDetectionPointCount());//所有测点
		project.setSensorInfoCount(projectService.selectSensorInfoCount(projectId).getSensorInfoCount());//所有传感器
		project.setThresholdCount(projectService.selectThresholdCount(projectId).getThresholdCount());//所有阀值
		project.setImageCount(projectService.selectImageCount(projectId).getImageCount());//所有图片
		project.setTerminalsCount(projectService.selectTerminalsCount(projectId).getTerminalsCount());//所有采集器
		project.setAlarmDetectionCount(projectService.selectAlarmDetectionPointCount(projectId).getAlarmDetectionCount());//异常测点
		project.setAlarmSensorInfoCount(projectService.selectAlarmSensorInfoCount(projectId).getAlarmSensorInfoCount());//异常传感器
		project.setAlarmAlarmCount(projectService.selectAlarmAlarmCount(projectId).getAlarmAlarmCount());//异常告警信息
		project.setAlarmTerminalsCount(projectService.selectAlarmTerminalsCount(projectId).getAlarmTerminalsCount());//异常采集器
		return project;
	}

	// 校验==>

	/**
	 * 验证项目名是否唯一(添加验证)
	 */
	@RequestMapping(value = "/OnlyProjectName", method = RequestMethod.POST)
	public void OnlyProjectName(String projectName_addProject,
			HttpServletResponse response) {
		Project project = projectService
				.selectByProjectName(projectName_addProject);
		try {
			if (project == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证项目名是否唯一(修改验证)
	 */
	@RequestMapping(value = "/upOnlyProjectName", method = RequestMethod.POST)
	public void upOnlyProjectName(String projectName_updetaProject,
			Integer projectId_updetaProject, HttpServletResponse response) {
		Project project = projectService
				.selectByProjectName(projectName_updetaProject);

		try {
			if (project == null
					|| projectName_updetaProject.equals((projectService
							.selectByPrimaryKey(projectId_updetaProject))
							.getProjectName())) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证结束时间是否在开始时间之前(添加验证)
	 * 
	 * @param projectName_addProject
	 * @param response
	 */
	@RequestMapping(value = "/CorrectEndTime", method = RequestMethod.POST)
	public void CorrectEndTime(String projectBeginTime_addProject,
			String projectEndTime_addProject, HttpServletResponse response) {
		Date dateBegin = null;
		Date dateend = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			dateBegin = sdf.parse(projectBeginTime_addProject);
			dateend = sdf.parse(projectEndTime_addProject);
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");// 设置日期格式
		String beginTime = df.format(dateBegin);// 获取项目开始时间
		String emdTime = df.format(dateend);// 获取项目结束时间
		long beginTimeMillionSeconds = 0;
		long endTimeMillionSeconds = 0;
		try {
			beginTimeMillionSeconds = df.parse(beginTime).getTime();// 把项目开始时间转化成毫秒数
			endTimeMillionSeconds = df.parse(emdTime).getTime();// 把项目结束时间转化成毫秒数
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			if (endTimeMillionSeconds > beginTimeMillionSeconds) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证结束时间是否在开始时间之前(修改验证)
	 * 
	 * @param projectName_addProject
	 * @param response
	 */
	@RequestMapping(value = "/upCorrectEndTime", method = RequestMethod.POST)
	public void upCorrectEndTime(String projectBeginTime_updetaProject,
			String projectEndTime_updetaProject, HttpServletResponse response) {
		Date dateBegin = null;
		Date dateend = null;
		try {
			SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
			dateBegin = sdf.parse(projectBeginTime_updetaProject);
			dateend = sdf.parse(projectEndTime_updetaProject);
		} catch (ParseException e) {
			System.out.println(e.getMessage());
		}
		SimpleDateFormat df = new SimpleDateFormat("yyyyMMddhhmmss");// 设置日期格式
		String beginTime = df.format(dateBegin);// 获取项目开始时间
		String emdTime = df.format(dateend);// 获取项目结束时间
		long beginTimeMillionSeconds = 0;
		long endTimeMillionSeconds = 0;
		try {
			beginTimeMillionSeconds = df.parse(beginTime).getTime();// 把项目开始时间转化成毫秒数
			endTimeMillionSeconds = df.parse(emdTime).getTime();// 把项目结束时间转化成毫秒数
		} catch (ParseException e) {
			e.printStackTrace();
		}
		try {
			if (endTimeMillionSeconds > beginTimeMillionSeconds) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
}
