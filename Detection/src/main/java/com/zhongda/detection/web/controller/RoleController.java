package com.zhongda.detection.web.controller;

import java.io.IOException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.model.Role;
import com.zhongda.detection.web.model.RolePermission;
import com.zhongda.detection.web.service.RolePermissionService;
import com.zhongda.detection.web.service.RoleService;

/**
 * <p>
 * 角色视图控制器
 * </p>
 * @author zmdeng
 * @date 2017年12月9日
 */
@Controller
@RequestMapping(value = "/role")
public class RoleController {

	public static final Logger logger = LoggerFactory.getLogger(RoleController.class);

	@Resource
	private RoleService roleService;
	
	@Resource
	private RolePermissionService rolePermissionService;
	
	/**
	 * 进入角色管理页面
	 * @return
	 */
	@RequestMapping("roleManager")
	public String roleManager() {
		return "roleManager";
	}
	
	/**
	 * 获取所有角色
	 * @return
	 */
	@RequestMapping("/roleList")
	@ResponseBody
	@RequiresPermissions("role:query:*")
	public List<Role> roleList() {	
		List<Role> roleList = roleService.selectAllRoles();
		return roleList;
	}
	
	/**
	 * 判断角色名称是否存在
	 * @return
	 */
	@RequestMapping("/roleNameUnique")
	public void roleNameUnique(String roleName, HttpServletResponse response) {	
		boolean isRoleNameExist = roleService.selectRoleByRoleName(roleName);
		try {
			response.getWriter().print(isRoleNameExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断角色标识是否存在
	 * @return
	 */
	@RequestMapping("/roleSignUnique")
	public void roleSignUnique(String roleSign, HttpServletResponse response) {	
		boolean isRoleSignExist = roleService.selectRoleByRoleSign(roleSign);
		try {
			response.getWriter().print(isRoleSignExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断角色名称是否存在(修改时验证，需roleId辅助验证)
	 * @return
	 */
	@RequestMapping("/roleNameUniqueByRoleId")
	public void roleNameUniqueByRoleId(Integer roleId, String roleName, HttpServletResponse response) {	
		boolean isRoleNameExist = roleService.selectRoleByRoleNameAndRoleId(roleId, roleName);
		try {
			response.getWriter().print(isRoleNameExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 判断角色标识是否存在(修改时验证，需roleId辅助验证)
	 * @return
	 */
	@RequestMapping("/roleSignUniqueByRoleId")
	public void roleSignUniqueByRoleId(Integer roleId, String roleSign, HttpServletResponse response) {	
		boolean isRoleSignExist = roleService.selectRoleByRoleSignAndRoleId(roleId, roleSign);
		try {
			response.getWriter().print(isRoleSignExist);
		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
	/**
	 * 新增一个角色
	 * @return
	 */
	@RequestMapping("/addRole")
	@ResponseBody
	@RequiresPermissions("role:create:*")
	public Result<Role> addRole(@RequestBody Role role) {	
		return roleService.insertRole(role);
	}
	
	/**
	 * 修改一个角色
	 * @return
	 */
	@RequestMapping("/updateRole")
	@ResponseBody
	@RequiresPermissions("role:update:*")
	public Result<Role> updateRole(@RequestBody Role role, HttpServletRequest request,
			HttpServletResponse response) {	
		return roleService.updateRole(role);
	}
	
	/**
	 * 删除一个角色
	 * @return
	 */
	@RequestMapping("/deleteRole")
	@ResponseBody
	@RequiresPermissions("role:delete:*")
	public Result<Role> deleteRole(Integer roleId) {	
		return roleService.deleteRole(roleId);
	}
	
	/**
	 * 给角色分配权限
	 * @return
	 */
	@RequestMapping("/grantPrivileges")
	@ResponseBody
	public Result<RolePermission> grantPrivileges(@RequestBody List<RolePermission> rolePermissionList) {	
		return rolePermissionService.insertMoreRolePermission(rolePermissionList);
	}
	
	/**
	 * 给角色分配权限
	 * @return
	 */
	@RequestMapping("/clearRoleCache")
	public void clearRoleCache() {	
		roleService.clearRoleCache();
	}
	
}
