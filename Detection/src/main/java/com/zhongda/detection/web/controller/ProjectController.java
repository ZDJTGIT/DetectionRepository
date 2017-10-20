package com.zhongda.detection.web.controller;


import java.util.Date;
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
import com.zhongda.detection.web.dao.SysDictionaryMapper;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SensorInfo;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.MessageService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.RoleService;
import com.zhongda.detection.web.service.SensorInfoService;
import com.zhongda.detection.web.service.UserService;

@Controller
@RequestMapping(value = "/project")
public class ProjectController {

	@Resource
	private UserService userService;
	
	@Resource
	private SysDictionaryMapper sysDictionaryMapper;
	
	@Autowired
	private ProjectService projectService;
	
	@Autowired
	private MessageService messageService;
	
	@Autowired
	private RoleService roleService;

	@Autowired
	private SensorInfoService sensorInfoService;

	@RequestMapping(value = "/myproject")
	public @ResponseBody Map<String, List<Project>> queryProject(Integer userId) {
		return projectService.selectProjectAndSysDicByUserId(userId);
	}

	@RequestMapping(value = "/queryItem")
	public @ResponseBody Map<String, List<SensorInfo>> queryItem(
			Integer projectId) {
		return sensorInfoService.selectsenInfoAndSysdicByProjectId(projectId);
	}

	@RequestMapping(value = "/displacement")
	public String displacement(Model model, Integer projectId,
			Integer detectionTypeId) {
		System.out.println(projectId + "_--" + detectionTypeId);
		int count = sensorInfoService.selectCountByProjectAndDetectionId(
				projectId, detectionTypeId);
		return generalJump(model, "graph_echarts_displacement", count,
				projectId, detectionTypeId);
	}

	@RequestMapping(value = "/selectdisplament")
	public @ResponseBody Map<String, Object> selectdisplament(
			Integer projectId, Integer detectionTypeId, String currentTimes) {
		System.out.println("currentTimes:" + currentTimes + "--projectId:"
				+ projectId + "--detectionTypeId:" + detectionTypeId);
		return sensorInfoService.selectInfoAndDisplacementData(currentTimes,
				projectId, detectionTypeId);

	}

	@RequestMapping(value = "/rainfall")
	public String rainfall(Model model, Integer projectId,
			Integer detectionTypeId) {
		System.out.println(projectId + "_--" + detectionTypeId);
		int count = sensorInfoService.selectCountAndRainfall(projectId,
				detectionTypeId);
		System.out.println(count);
		return generalJump(model, "graph_echarts_rainfall", count, projectId,
				detectionTypeId);

	}

	@RequestMapping(value = "/selectrainfall")
	public @ResponseBody Map<String, Object> selectrainfall(Integer projectId,
			Integer detectionTypeId, String detectionTime) {
		System.out.println("currentTimes:" + detectionTime + "--projectId:"
				+ projectId + "--detectionTypeId:" + detectionTypeId);
		return sensorInfoService.selectInfoAndSlopeRainfall(detectionTime,
				projectId, detectionTypeId);
	}

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
	@RequestMapping(value = "/showUsersProject", method=RequestMethod.POST)
	@ResponseBody
	public List<Project> showUsersProject(Integer userId){
		Subject subject = SecurityUtils.getSubject();
		List<Project> projectList = null;
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			 //管理员用户，可查看所有项目信息
			 projectList = projectService.selectAllProjectWithMessageCount();
		 }else{
			 //非管理员用户，可查看自己的项目信息
			 projectList = projectService.selectProjectByUserIdWithMessageCount(userId);
		 }
		return projectList;
	}
	
	/**
	 * 项目名查找项目
	 */
	@RequestMapping(value = "/keywordSearchProject", method=RequestMethod.POST)
	@ResponseBody
	public List<Project> keywordSearchProject(String keyWord,Integer userId){
		Subject subject = SecurityUtils.getSubject();
		List<Project> projectList = null;
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			projectList = projectService.selectAllProjectByKeyWord_mana(keyWord);
		}else{
			projectList = projectService.selectAllProjectByKeyWord_nomana(keyWord, userId);
		}
		return projectList; 
	}
	
	/**
	 * 查找数据库用户
	 */
	@RequestMapping(value = "/showUser", method=RequestMethod.POST)
	@ResponseBody
	public List<User> showUser(Integer userId){
		return  userService.selectUserWithoutAdmin(); 
	}
	
	/**
	 * 查找数据库项目类型
	 */
	@RequestMapping(value = "/showProjectType", method=RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectType(Integer userId){
		return sysDictionaryMapper.selectSysDictionaryType(); 
	}
	
	/**
	 * 查找数据库用户(编辑项目时)
	 */
	@RequestMapping(value = "/showUserType_selected", method=RequestMethod.POST)
	@ResponseBody
	public List<User> showUserType_selected(Integer userId){
		return  userService.selectUserWithoutAdmin(); 
	}
	
	/**
	 * 查找数据库项目类型（编辑项目时）
	 */
	@RequestMapping(value = "/showProjectType_selected", method=RequestMethod.POST)
	@ResponseBody
	public List<SysDictionary> showProjectType_selected(Integer userId){
		return sysDictionaryMapper.selectSysDictionaryType(); 
	}
	
	//showSelectUserAndProjectType
	/**
	 * 打开编辑项目时默认选中当前项目信息对应用户和项目类型
	 */
	@RequestMapping(value = "/showSelectUserAndProjectType", method=RequestMethod.POST)
	@ResponseBody
	public Project showSelectUserAndProjectType(Integer projectId ,Integer projectTypeId){//项目类型ID
		SysDictionary sysDictionary =sysDictionaryMapper.selectByPrimaryKey(projectTypeId);
		Project project = projectService.selectByPrimaryKey(projectId);
		project.setSysDictionary(sysDictionary);
		return project;
	}
	
	/**
	 * 新建项目
	 */
	@RequestMapping(value = "/addProject", method = RequestMethod.POST)
	@ResponseBody
	public Project addProject(@RequestBody Project project){
		Subject subject = SecurityUtils.getSubject();
		Date date = new Date();
		project.setProjectStatus("正常");
		project.setProjectTime(date);
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			 //管理员用户，可添加项目
			projectService.insertSelective(project);
			project.setProjectId((projectService.selectByProjectName(project.getProjectName()).getProjectId()));
			System.out.println("----------"+project.getProjectDescription());
		}else{
			//非管理员不能填写项目
			project.setUserId(2);
		}
		return project;
	}
	
	/**
	 * 修改项目
	 */
	@RequestMapping(value = "/selectProject", method = RequestMethod.POST)
	@ResponseBody
	public Project selectProject(Project project){
		Subject subject = SecurityUtils.getSubject();
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			//管理员用户，可添加项目
			System.out.println("------++++----1"+project.getProjectName());
			System.out.println("------++++----2"+project.getUserId());
			System.out.println("------++++----3"+projectService.selectProjectByProjectNameAndUserId(project.getProjectName(), project.getUserId()));
			System.out.println("------++++-ddddd---"+projectService.selectProjectByProjectNameAndUserId(project.getProjectName(), project.getUserId()).getProjectId());
			project.setProjectId((projectService.selectProjectByProjectNameAndUserId(project.getProjectName(), project.getUserId())).getProjectId());
			projectService.updateByPrimaryKeySelective(project);
			
		}
		return project;
	}

	/**
	 * 删除用户项目
	 */
	@RequestMapping(value = "/deleteProject", method=RequestMethod.POST)
	@ResponseBody
	public Integer deleteProject(Integer projectId){
		Subject subject = SecurityUtils.getSubject();
		if(subject.hasRole(RoleSign.ADMIN) || subject.hasRole(RoleSign.SUPER_ADMIN)){
			 //管理员用户，可删除项目
			projectService.deleteByPrimaryKey(projectId);
			System.out.println("aaaaaaaaaaaa"+projectId);
			return 1;
		}else{
			//非管理员不能删除项目
			return 2;
		}
	}
}
