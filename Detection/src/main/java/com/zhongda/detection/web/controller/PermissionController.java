package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.Permission;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.service.PermissionService;

/**
 * <p>
 * 权限视图控制器
 * </p>
 * @author zmdeng
 * @date 2017年12月12日
 */
@Controller
@RequestMapping(value = "/permission")
public class PermissionController {

	public static final Logger logger = LoggerFactory.getLogger(PermissionController.class);

	@Resource
	private PermissionService permissionService;

	/**
	 * 进入权限管理页面
	 * @return
	 */
	@RequestMapping("permissionManager")
	public String permissionManager() {
		return "permissionManager";
	}
	
	/**
	 * 获取所有权限
	 * @return
	 */
	@RequestMapping("/permissionList")
	@ResponseBody
	public List<Permission> permissionList() {	
		return permissionService.selectAllPermissions();
	}
	
	/**
	 * 获取所有权限按父子关系归类
	 * @return
	 */
	@RequestMapping("/permissionListOnGrade")
	@ResponseBody
	public Map<String, Object> permissionListOnGrade() {	
		return permissionService.selectAllPermissionsOnGrade();
	}
	
	/**
	 * 获取所有权限按父子关系归类并获取当前角色所拥有的权限
	 * @return
	 */
	@RequestMapping("/permissionListAndOwn")
	@ResponseBody
	public Map<String, Object> permissionListAndOwn(Integer roleId) {	
		return permissionService.selectPermissionListAndOwn(roleId);
	}
	
	/**
	 * 判断权限名称是否存在
	 * @return
	 */
	@RequestMapping("/permissionNameUnique")
	public void permissionNameUnique(String permissionName, HttpServletResponse response) {	
		boolean isPermissionNameExist = permissionService.selectPermissionByPermissionName(permissionName);
		try {
			response.getWriter().print(isPermissionNameExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断权限标识是否存在
	 * @return
	 */
	@RequestMapping("/permissionSignUnique")
	public void permissionSignUnique(String permissionSign, HttpServletResponse response) {	
		boolean isPermissionSignExist = permissionService.selectPermissionByPermissionSign(permissionSign);
		try {
			response.getWriter().print(isPermissionSignExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断权限名称是否存在(修改时验证，需permissionId辅助验证)
	 * @return
	 */
	@RequestMapping("/permissionNameUniqueByPermissionId")
	public void permissionNameUniqueByPermissionId(Integer permissionId, String permissionName, HttpServletResponse response) {	
		boolean isPermissionNameExist = permissionService.selectPermissionByPermissionNameAndPermissionId(permissionId, permissionName);
		try {
			response.getWriter().print(isPermissionNameExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断权限标识是否存在(修改时验证，需permissionId辅助验证)
	 * @return
	 */
	@RequestMapping("/permissionSignUniqueByPermissionId")
	public void permissionSignUniqueByPermissionId(Integer permissionId, String permissionSign, HttpServletResponse response) {	
		boolean isPermissionSignExist = permissionService.selectPermissionByPermissionSignAndPermissionId(permissionId, permissionSign);
		try {
			response.getWriter().print(isPermissionSignExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 新增一个权限
	 * @return
	 */
	@RequestMapping("/addPermission")
	@ResponseBody
	public Result<Permission> addPermission(@RequestBody Permission permission) {	
		return permissionService.insertPermission(permission);
	}
	
	/**
	 * 修改一个权限
	 * @return
	 */
	@RequestMapping("/updatePermission")
	@ResponseBody
	public Result<Permission> updatePermission(@RequestBody Permission permission) {	
		return permissionService.updatePermission(permission);
	}
	
	/**
	 * 删除一个权限如果有子权限同时删除子权限
	 * @return
	 */
	@RequestMapping("/deletePermission")
	@ResponseBody
	public Result<Permission> deletePermission(Integer permissionId) {	
		return permissionService.deletePermission(permissionId);
	}
	
	/**
	 * 查询单个权限的详细信息
	 * @return
	 */
	@RequestMapping("/permissionDetail")
	@ResponseBody
	public Permission permissionDetail(Integer permissionId) {	
		return permissionService.selectPermissionAndRoleByPermissionId(permissionId);
	}
}
