package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
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
import com.zhongda.detection.web.dao.ThresholdMapper;
import com.zhongda.detection.web.model.AlarmLinkman;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.AlarmLinkmanService;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.ImageService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.RoleService;
import com.zhongda.detection.web.service.SensorInfoService;
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
	private RoleService roleService;

	@Resource
	private AlarmLinkmanService alarmLinkmanService;

	@Resource
	private ImageService imageService;

	@RequestMapping(value = "/myproject")
	public @ResponseBody Map<String, List<Project>> queryProject(Integer userId) {
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
		System.out.println("itemNameList:" + itemNameList);
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
				.selectThresholdByTwoId(projectId, detectionTypeId);
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
				.selectThresholdByTwoId(projectId, detectionTypeId);
		HashMap<Integer, Threshold> hashMap2 = new HashMap<Integer, Threshold>();
		for (Threshold threshold : thresholdList) {
			hashMap2.put(threshold.getThresholdTypeId(), threshold);
		}
		Map<String, Object> hashMap = new HashMap<String, Object>();
		hashMap.put("laser", laserList);
		hashMap.put("threshold", hashMap2);
		return hashMap;
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
			HttpServletResponse response) {
		int isTrue = alarmLinkmanService.insertAlarmLinkmanList(alarList);
		if (isTrue > 0) {
			return alarList;
		} else {
			return new ArrayList<AlarmLinkman>();
		}

		// response.getWriter().print(1);
	}

	@RequestMapping(value = "/updateAlarmLinmanStatus")
	public void updateAlarmLinmanStatus(Integer status, Integer alarmLinkmanId,
			HttpServletResponse response) throws IOException {
		int isOk = alarmLinkmanService.updateStatusByalarmLinkmanId(status,
				alarmLinkmanId);
		if (isOk > 0) {
			response.getWriter().print(true);
		} else {
			response.getWriter().print(false);
		}
	}

	/*
	 * @RequestMapping(value = "/displacement") public String displacement(Model
	 * model, Integer projectId, Integer detectionTypeId) {
	 * System.out.println(projectId + "_--" + detectionTypeId); int count =
	 * sensorInfoService.selectCountByProjectAndDetectionId( projectId,
	 * detectionTypeId); return generalJump(model, "graph_echarts_displacement",
	 * count, projectId, detectionTypeId); }
	 * 
	 * @RequestMapping(value = "/osmotic") public String osmotic(Model model,
	 * Integer projectId, Integer detectionTypeId) {
	 * System.out.println(projectId + "_--" + detectionTypeId); int count =
	 * sensorInfoService.selectCountByProjectAndDetectionId( projectId, 11);
	 * return generalJump(model, "graph_echarts_osmotic", count, projectId, 11);
	 * }
	 * 
	 * @RequestMapping(value = "/selectdisplament") public @ResponseBody
	 * Map<String, Object> selectdisplament( Integer projectId, Integer
	 * detectionTypeId, String currentTimes) {
	 * System.out.println("currentTimes:" + currentTimes + "--projectId:" +
	 * projectId + "--detectionTypeId:" + detectionTypeId); return
	 * sensorInfoService.selectInfoAndDisplacementData(currentTimes, projectId,
	 * detectionTypeId);
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/rainfall") public String rainfall(Model model,
	 * Integer projectId, Integer detectionTypeId) {
	 * System.out.println(projectId + "_--" + detectionTypeId); int count =
	 * sensorInfoService.selectCountAndRainfall(projectId, detectionTypeId);
	 * System.out.println(count); return generalJump(model,
	 * "graph_echarts_rainfall", count, projectId, detectionTypeId);
	 * 
	 * }
	 * 
	 * @RequestMapping(value = "/selectrainfall") public @ResponseBody
	 * Map<String, Object> selectrainfall(Integer projectId, Integer
	 * detectionTypeId, String detectionTime) {
	 * System.out.println("currentTimes:" + detectionTime + "--projectId:" +
	 * projectId + "--detectionTypeId:" + detectionTypeId); return
	 * sensorInfoService.selectInfoAndSlopeRainfall(detectionTime, projectId,
	 * detectionTypeId); }
	 */

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
	 * 查找数据库用户
	 */
	@RequestMapping(value = "/showUser", method = RequestMethod.POST)
	@ResponseBody
	public List<User> showUser(Integer userId) {
		return userService.selectUserWithoutAdmin();
	}

	/**
	 * 查找数据库项目类型
	 */
	@RequestMapping(value = "/showProjectType", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectType(Integer userId) {
		return sysDictionaryServce.selectSysDictionaryType();
	}

	/**
	 * 查找项目状态
	 */
	@RequestMapping(value = "/showProjectStatus", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectStatus(Integer userId) {
		return sysDictionaryServce.selectSysDictionaryType_Status();
	}

	/**
	 * 查找测点类型
	 */
	@RequestMapping(value = "/showDetectionStatus", method = RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showDetectionStatus(Integer projectTypeId) {
		return sysDictionaryServce
				.selectSysDictionaryByProjectTypeId(projectTypeId);
	}

	/**
	 * 查找数据库用户(编辑项目时)
	 */
	@RequestMapping(value = "/showUserType_selected", method = RequestMethod.POST)
	@ResponseBody
	public List<User> showUserType_selected(Integer userId) {
		return userService.selectUserWithoutAdmin();
	}

	/**
	 * 查找数据库项目类型（编辑项目时）
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
	 */
	@RequestMapping(value = "/addProject", method = RequestMethod.POST)
	@ResponseBody
	public Project addProject(@RequestBody Project project) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可添加项目
			projectService.insertSelective(project);
			// 项目ID自增长，取出
			project = projectService.selectByProjectName(project
					.getProjectName());
			// 项目状态为int关联字典表，取出
			project.setProjectStatusString(sysDictionaryServce
					.selectProjectStatusByDicId(project.getProjectStatus()));
			// 创建完项目在警戒值表中按项目类型添加记录
			// 获取项目类型ID
			List<SysDictionary> sysDictionaryList = sysDictionaryServce
					.selectSysDictionaryByProjectTypeId(project
							.getProjectTypeId());
			for (SysDictionary sysDictionary : sysDictionaryList) {
				Threshold threshold = new Threshold();
				threshold.setUserId(project.getUserId());
				threshold.setProjectId(project.getProjectId());
				threshold.setProjectTypeId(project.getProjectTypeId());
				threshold.setDetectionTypeId(sysDictionary.getDicId());
				thresholdService.insertSelective(threshold);
			}
		} else {
			// 非管理员不能填写项目
			project.setUserId(2);
		}
		return project;
	}

	/**
	 * 新建测点
	 */
	@RequestMapping(value = "/addDescription", method = RequestMethod.POST)
	@ResponseBody
	public DetectionPoint addDescription(
			@RequestBody DetectionPoint detectionPoint) {
		// 根据项目名查项目ID加到测点
		detectionPoint.setProjectId((projectService
				.selectByProjectName(detectionPoint.getProjectName()))
				.getProjectId());
		detectionPointService.insertSelective(detectionPoint);
		// 根据项目ID+测点名称查出插入的测点得到测点ID
		detectionPoint = detectionPointService
				.selectByProjectIDAndDetectionName(
						detectionPoint.getProjectId(),
						detectionPoint.getDetectionName());
		// 得到测点类型名称（itemName）
		detectionPoint.setItemName(sysDictionaryServce
				.selectProjectStatusByDicId((detectionPoint
						.getDetectionTypeId())));
		return detectionPoint;
	}

	/**
	 * 新建Threshold
	 */
	@RequestMapping(value = "/updetaThreshold", method = RequestMethod.POST)
	@ResponseBody
	public Threshold updetaThreshold(@RequestBody Threshold threshold) {
		// use projectName to select userid,projectid,projecttypeid and insert
		// into threshold
		Project project = projectService.selectByProjectName(threshold
				.getProjectName());
		threshold.setUserId(project.getUserId());
		threshold.setProjectId(project.getProjectId());
		threshold.setProjectTypeId(project.getProjectTypeId());
		threshold.setThresholdId(thresholdService
				.selectByProjectIdAndDetectionTypeId(project.getProjectId(),
						threshold.getDetectionTypeId()).getThresholdId());
		thresholdService.updateByPrimaryKeySelective(threshold);
		return threshold;
	}

	/**
	 * 修改项目
	 */
	@RequestMapping(value = "/selectProject", method = RequestMethod.POST)
	@ResponseBody
	public Project selectProject(@RequestBody Project project) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			projectService.updateByPrimaryKeySelective(project);
			// 项目状态为int关联字典表，取出
			project.setProjectStatusString(sysDictionaryServce
					.selectProjectStatusByDicId(project.getProjectStatus()));
			return project;
		} else {
			return null;
		}
	}

	/**
	 * 删除用户项目
	 */
	@RequestMapping(value = "/deleteProject", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteProject(Integer projectId) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可删除项目
			// 项目ID删除项目
			projectService.deleteByPrimaryKey(projectId);
			// 项目ID删除测点
			detectionPointService.deleteByProjectId(projectId);
			// 项目ID关联测点表和传感器表删除传感器
			sensorInfoService.deleteByProjectId(projectId);
			// 项目ID删除告警信息
			thresholdService.deleteByProjectId(projectId);
			return 1;
		} else {
			// 非管理员不能删除项目
			return 2;
		}
	}
}
