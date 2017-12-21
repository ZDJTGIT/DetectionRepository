package com.zhongda.detection.web.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.zhongda.detection.web.dao.RolePermissionMapper;
import com.zhongda.detection.web.model.Result;
import com.zhongda.detection.web.model.RolePermission;
import com.zhongda.detection.web.service.RolePermissionService;

/**
 * 告警Service实现类
 */
@Service
public class RolePermissionServiceImpl implements RolePermissionService{
	
	@Resource
	private RolePermissionMapper rolePermissionMapper;

	@Override
	public Result<RolePermission> insertMoreRolePermission(List<RolePermission> rolePermissionList) {
		Result<RolePermission> result = new Result<RolePermission>();
		if(null != rolePermissionList && rolePermissionList.size() > 0){
			//删除当前角色下的所有关联权限
			rolePermissionMapper.deleteRolePermissionByRoleId(rolePermissionList.get(0).getRoleId());
			//如果有需要添加的新的关联权限
			if(null != rolePermissionList.get(0).getPermissionId()){
				//添加关联权限到当前角色下
				int index = rolePermissionMapper.insertMoreRolePermission(rolePermissionList);
				if(index > 0){
					result.setCode(Result.SUCCESS);
					result.setMsg("分配权限成功");
				}else{
					result.setCode(Result.FAILURE);
					result.setMsg("分配权限失败");
				}	
			}else{
				result.setCode(Result.SUCCESS);
				result.setMsg("分配权限成功");	
			}
		}else{
			result.setCode(Result.FAILURE);
			result.setMsg("分配权限功能异常");
		}
		return result;
	}
}
