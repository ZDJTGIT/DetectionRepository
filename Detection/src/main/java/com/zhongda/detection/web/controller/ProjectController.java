package com.zhongda.detection.web.controller;

import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.dao.ThresholdMapper;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.model.Threshold;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.MessageService;
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
	private MessageService messageService;

	@Autowired
	private RoleService roleService;

	@RequestMapping(value = "/myproject")
	public @ResponseBody Map<String, List<Project>> queryProject(Integer userId) {
		return projectService.selectProjectAndSysDicByUserId(userId);
	}

	/*
	 * @RequestMapping(value = "/queryItem") public @ResponseBody Map<String,
	 * List<SensorInfo>> queryItem( Integer projectId) { return
	 * sensorInfoService.selectsenInfoAndSysdicByProjectId(projectId); }
	 * 
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
	 * 通用跳转逻辑
	 * 
	 * @param model
	 * @param url
	 * @param count
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	public String generalJump(Model model, String url, int count,
			Integer projectId, Integer detectionTypeId) {
		// 如果没有查询到数据则返回404
		if (count == 0) {
			return "nodata";
		} else {
			model.addAttribute("projectId", projectId);
			model.addAttribute("detectionTypeId", detectionTypeId);
			return url;
		}
	}

	/**
	 * 查找用户所属项目
	 */
	@RequestMapping(value = "/showUsersProject", method = RequestMethod.POST)
	@ResponseBody
	public List<Project> showUsersProject(Integer userId) {
		Subject subject = SecurityUtils.getSubject();
		List<Project> projectList = null;
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			 //管理员用户，可查看所有项目信息
			 projectList = projectService.selectAllProjectWithMessageCount();
			 //将数据库查到的项目状态添加到项目
			 for(Project project:projectList){
				 project.setProjectStatusString(sysDictionaryServce.selectProjectStatusByDicId(project.getProjectStatus()));
			 }
		 }else{
			 //非管理员用户，可查看自己的项目信息
			 projectList = projectService.selectProjectByUserIdWithMessageCount(userId);
			 //将数据库查到的项目状态添加到项目
			 for(Project project:projectList){
				 project.setProjectStatusString(sysDictionaryServce.selectProjectStatusByDicId(project.getProjectStatus()));
			 }
		 }
		return projectList;
	}

	/**
	 * 项目名查找项目
	 */
	@RequestMapping(value = "/keywordSearchProject", method = RequestMethod.POST)
	@ResponseBody
	public List<Project> keywordSearchProject(String keyWord, Integer userId) {
		Subject subject = SecurityUtils.getSubject();
		List<Project> projectList = null;
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			projectList = projectService.selectAllProjectByKeyWord_mana(keyWord);
			for(Project project:projectList){
				 project.setProjectStatusString(sysDictionaryServce.selectProjectStatusByDicId(project.getProjectStatus()));
			}
		}else{
			projectList = projectService.selectAllProjectByKeyWord_nomana(keyWord, userId);
			for(Project project:projectList){
				 project.setProjectStatusString(sysDictionaryServce.selectProjectStatusByDicId(project.getProjectStatus()));
			}
		}
		return projectList;
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
	@RequestMapping(value = "/showProjectStatus", method=RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectStatus(Integer userId){
		return sysDictionaryServce.selectSysDictionaryType_Status();
	}
	/**
	 * 查找测点类型
	 */
	@RequestMapping(value = "/showDetectionStatus", method=RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showDetectionStatus(Integer projectTypeId){
		return sysDictionaryServce.selectSysDictionaryByProjectTypeId(projectTypeId);
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
	 * @param userId
	 * @return
	 */
	@RequestMapping(value = "/showProjectStatus_selected", method=RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectStatus_selected(Integer userId){
		return sysDictionaryServce.selectSysDictionaryType_Status(); 
	}
	
	/**
	 * 打开编辑项目时默认选中当前项目信息对应用户和项目类型
	 */
	@RequestMapping(value = "/showSelectUserAndProjectType", method = RequestMethod.POST)
	@ResponseBody
	public Project showSelectUserAndProjectType(Integer projectId, Integer projectTypeId) {// 项目ID、项目类型ID
		SysDictionary sysDictionary = sysDictionaryServce.selectByPrimaryKey(projectTypeId);
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
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			//管理员用户，可添加项目
			projectService.insertSelective(project);
			//项目ID自增长，取出
			project = projectService.selectByProjectName(project.getProjectName());
			//项目状态为int关联字典表，取出
			project.setProjectStatusString(sysDictionaryServce.selectProjectStatusByDicId(project.getProjectStatus()));
			//创建完项目在警戒值表中按项目类型添加记录
				//获取项目类型ID
			    List<SysDictionary> sysDictionaryList = sysDictionaryServce.selectSysDictionaryByProjectTypeId(project.getProjectTypeId());
			    for(SysDictionary sysDictionary:sysDictionaryList){
			    	Threshold threshold = new Threshold();
			    	threshold.setUserId(project.getUserId());
			    	threshold.setProjectId(project.getProjectId());
			    	threshold.setProjectTypeId(project.getProjectTypeId());
			    	threshold.setDetectionTypeId(sysDictionary.getDicId());
			    	thresholdService.insertSelective(threshold);
			    }
		}else{
			//非管理员不能填写项目
			project.setUserId(2);
		}
		return project;
	}

	/**
	 * 新建测点
	 */
	@RequestMapping(value = "/addDescription", method = RequestMethod.POST)
	@ResponseBody
	public DetectionPoint addDescription(@RequestBody DetectionPoint detectionPoint){
		//根据项目名查项目ID加到测点
		detectionPoint.setProjectId((projectService.selectByProjectName(detectionPoint.getProjectName())).getProjectId());
		detectionPointService.insertSelective(detectionPoint);
		//根据项目ID+测点名称查出插入的测点得到测点ID
		detectionPoint = detectionPointService.selectByProjectIDAndDetectionName(detectionPoint.getProjectId(), detectionPoint.getDetectionName());
		//得到测点类型名称（itemName）
		detectionPoint.setItemName(sysDictionaryServce.selectProjectStatusByDicId((detectionPoint.getDetectionTypeId())));
		return detectionPoint;
	}
	
	/**
	 * 新建Threshold
	 */
	@RequestMapping(value = "/updetaThreshold", method = RequestMethod.POST)
	@ResponseBody
	public Threshold updetaThreshold(@RequestBody Threshold threshold){
		//use projectName to select userid,projectid,projecttypeid and insert into threshold
		Project project = projectService.selectByProjectName(threshold.getProjectName());
		threshold.setUserId(project.getUserId());
		threshold.setProjectId(project.getProjectId());
		threshold.setProjectTypeId(project.getProjectTypeId());
		threshold.setThresholdId(thresholdService.selectByProjectIdAndDetectionTypeId(project.getProjectId(), threshold.getDetectionTypeId()).getThresholdId());
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
			//项目状态为int关联字典表，取出
			project.setProjectStatusString(sysDictionaryServce.selectProjectStatusByDicId(project.getProjectStatus()));
			return project;
		}else{
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
			//项目ID删除项目
			projectService.deleteByPrimaryKey(projectId);
			//项目ID删除测点
			detectionPointService.deleteByProjectId(projectId);
			//项目ID关联测点表和传感器表删除传感器
			sensorInfoService.deleteByProjectId(projectId);
			//项目ID删除告警信息
			thresholdService.deleteByProjectId(projectId);
			return 1;
		} else {
			// 非管理员不能删除项目
			return 2;
		}
	}
}
