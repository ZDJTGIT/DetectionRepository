package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.subject.Subject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.github.pagehelper.PageInfo;
import com.zhongda.detection.web.model.DetectionPoint;
import com.zhongda.detection.web.model.OperationLog;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.SysDictionary;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.DetectionPointService;
import com.zhongda.detection.web.service.OperationLogService;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.SensorInfoService;
import com.zhongda.detection.web.service.SysDictionaryService;

@Controller
@RequestMapping(value = "/detectionPoint")
public class DetectionPointController {
	
	@Autowired
	private ProjectService projectService;
	
	@Resource
	private DetectionPointService detectionPointService;
	
	@Resource
	private SysDictionaryService sysDictionaryServce;
	
	@Autowired
	private SensorInfoService sensorInfoService;
	
	@Resource
	private OperationLogService operationLogService;
	
	/**
	 * 新建测点
	 * @param detectionPoint
	 * @return
	 */
	@RequestMapping(value = "/addDescription", method = RequestMethod.POST)
	@ResponseBody
	public DetectionPoint addDescription(
			@RequestBody DetectionPoint detectionPoint,HttpServletRequest request) {
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			//插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"测点插入",
					currentUser.getUserName()+"插入测点，在项目："+detectionPoint.getProjectName()+"中，测点名为："+detectionPoint.getDetectionName(),new Date()));
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
		} else {
			return null;
		}
	}
	
	/**
	 * 分页展示项目下所有测点
	 * @param project
	 * @param request
	 * @return
	 */
	@RequestMapping(value = "/showNormalProjectDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, Object> showNormalProjectDetectionPoint(@RequestBody Project project,HttpServletRequest request){
		
		//根据查询条件分页查询测点
		List<DetectionPoint> detectionPointList = detectionPointService.selectDetectionPointWithAlarmCount(project);
		PageInfo<DetectionPoint> DetectionPointPageInfo = new PageInfo<DetectionPoint>(detectionPointList);
		Map<String, Object> detectionPointMap = new HashMap<String, Object>();
		detectionPointMap.put("total", DetectionPointPageInfo.getTotal());
		detectionPointMap.put("detectionPointList", detectionPointList);
		//通过项目ID查询到所有测点
		return detectionPointMap;
	}
	
	/**
	 * 展示项目下所有测点(暂时用不到)
	 * @param projectName
	 * @return
	 */
//	@RequestMapping(value = "/showProjectDetectionPoint", method = RequestMethod.POST)
//	@ResponseBody
//	public List<DetectionPoint> showProjectDetectionPoint(String projectName){
//		//通过projectName查询项目ID，
//		Project project = projectService.selectByProjectName(projectName);
//		List<DetectionPoint> detectionPointList = detectionPointService.selectByProjectId(project.getProjectId());
//		//通过项目ID查询到所有测点
//		return detectionPointList;
//	}
	
	/**
	 * 修改测点
	 * @param detectionPoint
	 * @return
	 */
	@RequestMapping(value = "/updetaDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public DetectionPoint updetaDetectionPoint(@RequestBody DetectionPoint detectionPoint ,HttpServletRequest request){
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
		detectionPoint.setProjectId(projectService.selectByProjectName(detectionPoint.getProjectName()).getProjectId());
		detectionPointService.updateByPrimaryKeySelective(detectionPoint);
		//插入一条操作日志
		User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
		operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"测点修改",
				currentUser.getUserName()+"修改测点，在项目："+detectionPoint.getProjectName()+"下，测点ID为："+detectionPoint.getDetectionPointId(),new Date()));
		return detectionPoint;
		}else{
			return null;
		}
	}
	
	/**
	 * 修改时选中当前测点的测点类型
	 * @param detectionTypeId
	 * @return
	 */
	@RequestMapping(value = "/showSelectDetectionType", method = RequestMethod.POST)
	@ResponseBody
	public SysDictionary showSelectDetectionType(Integer detectionTypeId){
		return sysDictionaryServce.selectByPrimaryKey(detectionTypeId);
	}
	
	/**
	 * 删除选中的测点（包括测点下的所有传感器）
	 * @param detectionPointId
	 * @return
	 */
	@RequestMapping(value = "/deleteDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public Integer deleteDetectionPoint(Integer detectionPointId, HttpServletRequest request){
		Subject subject = SecurityUtils.getSubject();
		if (subject.hasRole(RoleSign.ADMIN)
				|| subject.hasRole(RoleSign.SUPER_ADMIN)) {
			// 管理员用户，可删除测点
			//测点ID删除测点
			detectionPointService.deleteByPrimaryKey(detectionPointId);
			//测点ID删除传感器
			sensorInfoService.deleteByDetectionPointId(detectionPointId);
			//插入一条操作日志
			User currentUser = (User) WebUtils.getSessionAttribute(request,"userInfo");
			operationLogService.insertOperationLog(new OperationLog(currentUser.getUserId(),currentUser.getUserName(),"测点删除",
					currentUser.getUserName()+"删除测点，测点ID为："+detectionPointId,new Date()));
			return 1;
		} else {
			// 非管理员不能删除测点
			return 2;
		}
	}
	
	/**
	 * 查项目下有告警信息的测点个数（未使用）
	 * @param detectionPointId
	 * @return
	 */
	@RequestMapping(value = "/selectAlarmDetectionPointCount", method = RequestMethod.POST)
	@ResponseBody
	public Integer selectAlarmDetectionPointCount(Integer projectId){
		return projectId;
	}
	
	/**
	 * 根据输入测点名查询所有符合模糊查询的测点展示
	 * @param keyWord
	 * @param projectName
	 * @return
	 */
	@RequestMapping(value = "/keywordSearchDetectionPoint", method = RequestMethod.POST)
	@ResponseBody
	public List<DetectionPoint> keywordSearchDetectionPoint(String keyWord,String projectName){
		List<DetectionPoint> detectionPointList = detectionPointService.selectByProjectNameAndKeyWord(projectName, keyWord);
		for(DetectionPoint detectionPoint:detectionPointList){
			detectionPoint.setItemName(sysDictionaryServce.selectProjectStatusByDicId((detectionPoint.getDetectionTypeId())));
		}		
		return detectionPointList;
	}
	
//校验==>

	/**
	 * 验证同一个项目下测点名是否唯一(添加验证)
	 * @param DetectionName_addDetection
	 * @param ProjectName_addDetection
	 * @param response
	 */
	@RequestMapping(value = "/OnlyDetectionPointName", method = RequestMethod.POST)
	public void OnlyDetectionPointName(String DetectionName_addDetection, String ProjectName_addDetection, HttpServletResponse response) {
		Project project = projectService.selectByProjectName(ProjectName_addDetection);
		DetectionPoint detection = detectionPointService.selectByProjectIDAndDetectionName(project.getProjectId(), DetectionName_addDetection);
		try {
			if (detection == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证同一个项目下测点名是否唯一(修改验证)
	 * @param DetectionName_updetaDetection
	 * @param ProjectName_uppdetaDetection
	 * @param response
	 */
	@RequestMapping(value = "/upOnlyDetectionPointName", method = RequestMethod.POST)
	public void upOnlyDetectionPointName(String DetectionName_updetaDetection, String ProjectName_updetaDetection,
			Integer DetectionPointId_updetaDetection, HttpServletResponse response) {
		DetectionPoint detectionLL = detectionPointService.selectDetectionByDetectionPointId(DetectionPointId_updetaDetection);
		if(detectionLL.getDetectionName().equals(DetectionName_updetaDetection)){
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}else{
		Project project = projectService.selectByProjectName(ProjectName_updetaDetection);
		DetectionPoint detection = detectionPointService.selectByProjectIDAndDetectionName(project.getProjectId(), DetectionName_updetaDetection);
		try {
			if (detection == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		}
	}
	
	/**
	 * 根据id查询所有检测类型
	 * 
	 */
	@RequestMapping(value = "/queryDetectionPointName")
	@ResponseBody
	public Map<String,DetectionPoint> queryDetectionPointType( Integer projectId ){
		
		DetectionPoint detectionPoint =null;
		String DetectionPointTypeName = "";
		List<DetectionPoint> detectionPointList = detectionPointService.selectByProjectId(projectId);
		
		Map<String,DetectionPoint> detectionMap = new HashMap<String, DetectionPoint>();
		Iterator< DetectionPoint> it =  detectionPointList.iterator();
		//去重
		while(it.hasNext()){
			 detectionPoint = it.next();
			 DetectionPointTypeName = detectionPoint.getItemName();	 
			 detectionMap.put(DetectionPointTypeName, detectionPoint);
		}
		
		return detectionMap;
	}
	
}
