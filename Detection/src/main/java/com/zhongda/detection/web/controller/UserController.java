package com.zhongda.detection.web.controller;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;
import io.swagger.annotations.ApiParam;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.apache.shiro.SecurityUtils;
import org.apache.shiro.authc.AuthenticationException;
import org.apache.shiro.authc.DisabledAccountException;
import org.apache.shiro.authc.IncorrectCredentialsException;
import org.apache.shiro.authc.LockedAccountException;
import org.apache.shiro.authc.UnknownAccountException;
import org.apache.shiro.authc.UsernamePasswordToken;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.apache.shiro.authz.annotation.RequiresRoles;
import org.apache.shiro.cache.Cache;
import org.apache.shiro.cache.CacheManager;
import org.apache.shiro.codec.Base64;
import org.apache.shiro.crypto.hash.Md5Hash;
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.messaging.simp.SimpMessagingTemplate;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.zhongda.detection.core.utils.GetVerificationCode;
import com.zhongda.detection.core.utils.SimpleMailSender;
import com.zhongda.detection.web.model.Project;
import com.zhongda.detection.web.model.Role;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.PermissionSign;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.ProjectService;
import com.zhongda.detection.web.service.RoleService;
import com.zhongda.detection.web.service.UserService;
import com.zhongda.detection.web.task.PushMessage;

/**
 * 用户控制器
 **/
@Api(value = "Api控制器")
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private UserService userService;

	@Resource
	private RoleService roleService;

	@Resource
	private ProjectService projectService;

	@Resource
	private SimpMessagingTemplate messageTemplate;

	@Resource(name = "sessionDAO")
	private SessionDAO sessionDAO;

	@Resource(name = "shiroEhcacheManager")
	private CacheManager cacheManager;
	private Cache<String, String> changePasswordCache;

	public static final Logger logger = LoggerFactory
			.getLogger(UserController.class);

	// private Cache<String,String> vcodeCache;

	/**
	 * 用户登录
	 * @param user
	 * @param result
	 * @return
	 */
	@ApiOperation(value = "登陆", httpMethod = "POST", response = String.class, notes = "根据用户名和密码登陆程序")
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@ApiParam(required = true, name = "user", value = "用户") @Valid User user, BindingResult result, Model model,
			HttpServletRequest request) {
		// //验证码校验
		// String vcode = request.getParameter("vcode");
		// String vcode_flag = request.getParameter("vcode_flag");
		// vcodeCache = cacheManager.getCache("vcodeCache");
		// if(!vcode.toLowerCase().equals(vcodeCache.get(vcode_flag))){
		// model.addAttribute("error", "验证码错误或验证码已失效 ！");
		// return "login";
		// }
		String error = null;
		try {
			Subject subject = SecurityUtils.getSubject();
			// 已登陆则 跳到首页
			if (subject.isAuthenticated()) {
				return "redirect:/";
			}
			if (result.hasErrors()) {
				model.addAttribute("error", "用户参数错误！");
				return "login";
			}

			// 设置rememberMe
			UsernamePasswordToken shiroToken = new UsernamePasswordToken(
					user.getUserName(), user.getPassword());

			// 身份验证
			subject.login(shiroToken);

			System.out.println("currentUser:"+subject.getSession().getId());
			//获取所有在线的用户session

//			Collection<Session> sessions = sessionDAO.getActiveSessions();
//			System.out.println("sessions的大小"+sessions.size());
//			for(Session session:sessions){
//				Object userObj = session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
//				System.out.println("session:"+session.getId());
//				if(null == userObj){
//					session.stop();
//				}else if(userObj.toString().equals(user.getUserName()) && !session.getId().equals(subject.getSession().getId())){
//					//如果当前用户上一个session有效 ,踢出上一个登录用户
//					System.out.println(user.getUserName()+":"+session.getId());
//					Message message = new Message();
//					message.setMessageContext("你的账户已在其他地方登录，如不是本人操作，请尽快修改密码！");
//					messageTemplate.convertAndSendToUser(user.getUserName(), "/message", message);
//					session.stop();
//				}
//			}

			// 验证成功在Session中保存用户信息
			final User authUserInfo = userService.selectByUsername(user
					.getUserName());
			WebUtils.setSessionAttribute(request, "userInfo", authUserInfo);

			PushMessage.userSet.add(authUserInfo.getUserName());

		} catch (LockedAccountException e) {
			error = "登录失败3次，账户已被锁定 ，请3分钟后再试！";
		} catch (DisabledAccountException e) {
			error = "该账户已被禁用 ，请联系管理员！";
		} catch (UnknownAccountException e) {
			error = "该账户不存在 ！";
		} catch (IncorrectCredentialsException e) {
			error = "用户名或密码错误 ！";
		} catch (AuthenticationException e) {
			error = "其他错误：" + e.getMessage() + "！";
		}
		if (null != error) {
			model.addAttribute("error", error);
			return "login";
		} else {
			return "redirect:/";
		}
	}

	/**
	 * 用户登出
	 *
	 * @param session
	 * @return
	 */
	@RequestMapping(value = "/logout", method = RequestMethod.GET)
	public String logout(HttpSession session) {
		session.removeAttribute("userInfo");
		// 登出操作
		Subject subject = SecurityUtils.getSubject();
		subject.logout();
		return "login";
	}

	/**
	 * 基于角色 标识的权限控制案例
	 */
	@RequestMapping(value = "/admin")
	@ResponseBody
	@RequiresRoles(value = RoleSign.ADMIN)
	public String admin() {
		return "拥有admin角色,能访问";
	}

	/**
	 * 基于权限标识的权限控制案例
	 */
	@RequestMapping(value = "/create")
	@ResponseBody
	@RequiresPermissions(value = PermissionSign.USER_CREATE)
	public String create() {
		return "拥有user:create权限,能访问";
	}

	/**
	 * 验证账号唯一
	 */
	@RequestMapping(value = "/checkUsername", method = RequestMethod.POST)
	@ResponseBody
	public List<Integer> checkUsername(String username) {
		List<Integer> ma = new ArrayList<Integer>();
		boolean isTrue = userService.checkusername(username);
		if (isTrue)
			ma.add(1);
		else
			ma.add(2);

		return ma;
	}

	/**
	 * 验证邮箱唯一
	 */
	@RequestMapping(value = "/checkEmail", method = RequestMethod.POST)
	@ResponseBody
	public List<Integer> checkEmail(String email) {
		// String a[] =username.split("=");
		List<Integer> emai = new ArrayList<Integer>();
		boolean isTrue = userService.checkEmail(email);
		if (isTrue)
			emai.add(1);
		else
			emai.add(2);

		return emai;
	}

	/**
	 * 根据邮箱修改密码
	 */
	@RequestMapping(value = "/forgetPassword", method = RequestMethod.POST)
	public String forgetPassword(@Valid User user, BindingResult result,
			Model model, HttpServletRequest reques) {
		System.out.println("邮箱传过来了：" + user.getEmail());
		// 这里返回的id可能有bug
		// Long id = userService.selectByEmail(user.getEmail());
		SimpleMailSender sms = new SimpleMailSender();
		sms.send(user.getEmail(), SimpleMailSender.CHANGES_PWD);
		changePasswordCache = cacheManager.getCache("changePasswordCache");
		changePasswordCache.put(user.getEmail(), "email");
		// sms.properties.setProperty("toEmailAddress", user.getEmail());
		// sms.send(user.getEmail(),SimpleMailSender.CHANGES_PWD);
		return "login";
	}

	/**
	 * 跳到changPassword页面
	 */
	@RequestMapping(value = "/cp", method = RequestMethod.GET)
	public String cp(@Valid User user, BindingResult result, Model model,
			HttpServletRequest request) {
		String email = request.getParameter("zemin");
		/*
		 * System.out.println("配置获取的id传过来了："+id); user.setId(id);;
		 */
		if (null == email || email.trim().equals("")) {
			model.addAttribute("error", "此链接参数已被破坏，请重新输入");
		}
		user.setEmail(Base64.decodeToString(email));
		return "changePassword";
	}

	/**
	 * 修改密码
	 */
	@RequestMapping(value = "/changPassword", method = RequestMethod.POST)
	public String changPassword(@Valid User user, BindingResult result,
			Model model, HttpServletRequest reques) {
		String email = changePasswordCache.get(user.getEmail());
		if (null != email && email.equals("email")) {
			userService.changePassword(user);
			return "login";
		} else {
			model.addAttribute("error", "此链接已失效，请重新申请改密！");
			return "changePassword";
		}
	}

	/**
	 * 显示所有用户
	 */
	@RequestMapping(value = "/userList")
	public String userList(HttpServletRequest request, Model model) {
		User currentUser = (User) WebUtils.getSessionAttribute(request, "userInfo");
		List<User> userList = userService.selectList(currentUser.getUserId());
		model.addAttribute("userList", userList);
		logger.info("进入userList");
		logger.info("userList的大小" + userList.size());
		return "table_basic";
	}

	/**
	 * 根据用户名查找用户
	 */
	@RequestMapping(value = "/findUser")
	public String findUser(User user, Model model) {
		List<User> userList = userService.selectAllByUsername(user
				.getUserName());
		if (null == userList || userList.size() == 0) {
			model.addAttribute("error", "没有匹配的用户名 ！");
		} else {
			model.addAttribute("userList", userList);
		}
		return "user/userList";
	}

	/**
	 * 输入用户信息添加用户
	 */
	@RequestMapping(value = "/addUser", method = RequestMethod.POST)
	@ResponseBody
	public User addUser(@RequestBody User user) {
		Date date = new Date();
		user.setPassword("123456");
		user.setStatus("正常");
		user.setCreateTime(date);
		// 将user存入数据库
		userService.insertUser(user);
		user.setUserId(userService.selectByUsername(user.getUserName()).getUserId());
		userService.insertUser_Role(user.getUserId(), user.getRoleId());
		return user;
	}

	/**
	 * 根据当前选中的用户名删除用户
	 */
	@RequestMapping(value = "/delete", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> delete(@RequestBody User user) {
		Map<String, String> model = new HashMap<String, String>();
		int roleid=0;
		List<Role> roleInfos = roleService.selectRolesByUserId(userService.selectByUsername(user.getUserName()).getUserId());
		roleid = roleInfos.get(0).getRoleId();
		if(roleid==1){
			//超级管理员，不可删除
			model.put("isDelete", "2");
			return model;
		}else if(roleid==2){
			//超级管理员才可以删除管理员
			if(roleService.selectRolesByUserId(user.getUserId()).get(0).getRoleId()==2){
				model.put("isDelete", "3");
				return model;
			}else{
				userService.deleteUser_role(userService.selectByUsername(user.getUserName()).getUserId());
				userService.deleteUser(user.getUserName());
				model.put("isDelete", "1");
				return model;
			}
		}else{
			//普通用户，直接删除
			userService.deleteUser_role(userService.selectByUsername(user.getUserName()).getUserId());
			userService.deleteUser(user.getUserName());
			model.put("isDelete", "1");
			return model;
		}
	}

	/**
	 * 查找展示添加用户时的用户权限
	 */
	@RequestMapping(value = "/showUserRole", method = RequestMethod.POST)
	@ResponseBody
	public List<Role> showUserRole(Integer userId) {
		List<Role> roleInfos = roleService.selectLessRolesByUserId(userId);
		return roleInfos;
	}

	//showSelectUserRole
	/**
	 * 查找展示添加用户时的用户权限
	 */
	@RequestMapping(value = "/showSelectUserRole", method = RequestMethod.POST)
	@ResponseBody
	public Map<String, String> showSelectUserRole(Integer userId,String userName) {//当前登陆账号ID,要修改的用户的用户名
		Subject subject = SecurityUtils.getSubject();
		Map<String, String> model = new HashMap<String, String>();
		List<Role> selectedrole = roleService.selectRolesByUserId((userService.selectByUsername(userName)).getUserId());
		Integer roleId = selectedrole.get(0).getRoleId();
		if(subject.hasRole(RoleSign.SUPER_ADMIN)){
		//用户权限为超级管理员
			switch (roleId)
			{
			case 2:
				model.put("roleid", "0");
			  break;
			case 3:
				model.put("roleid", "1");
			  break;
			case 4:
				model.put("roleid", "2");
			  break;
			case 5:
				model.put("roleid", "3");
			  break;
			case 6:
				model.put("roleid", "4");
			  break;
			case 7:
				model.put("roleid", "5");
		      break;
			case 8:
				model.put("roleid", "6");
			  break;
			case 9:
				model.put("roleid", "7");
			  break;
			}
			return model;
		}else{
		//用户权限为管理员
			switch (roleId)
			{
			case 3:
				model.put("roleid", "0");
			  break;
			case 4:
				model.put("roleid", "1");
			  break;
			case 5:
				model.put("roleid", "2");
			  break;
			case 6:
				model.put("roleid", "3");
			  break;
			case 7:
				model.put("roleid", "4");
		      break;
			case 8:
				model.put("roleid", "5");
			  break;
			case 9:
				model.put("roleid", "6");
			  break;
			}
			return model;
		}
	}

	/**
	 * 修改用户信息
	 */
	@RequestMapping(value = "/modify", method = RequestMethod.POST)
	@ResponseBody
	public User modify(@RequestBody User user, HttpServletRequest request) {
		userService.updateByPrimaryKeySelective(user);
		if(((User)WebUtils.getSessionAttribute(request, "userInfo")).getUserName().equals(user.getUserName())){
			WebUtils.setSessionAttribute(request, "userInfo", user);
		}
		userService.updateUsersRole(user);
		return user;
	}

	/**
	 * 验证用户名是否唯一(添加验证)
	 */
	@RequestMapping(value = "/OnlyUserName", method = RequestMethod.POST)
	public void OnlyUserName(String userName, HttpServletResponse response) {
		User user = userService.selectByUsername(userName);
		try {
			if (user == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证手机号码是否唯一(添加验证)
	 */
	@RequestMapping(value = "/OnlyPhone", method = RequestMethod.POST)
	public void Onlyphone(String phone, HttpServletResponse response) {
		User user = userService.selectByPhone(phone);
		try {
			if (user == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证电子邮件是否唯一(添加验证)
	 */
	@RequestMapping(value = "/OnlyEmail", method = RequestMethod.POST)
	public void Onlyemail(String email, HttpServletResponse response) {
		User user = userService.selectByEmail(email);
		try {
			if (user == null) {
				response.getWriter().print(true);
			} else {
				response.getWriter().print(false);
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 验证用户名是否唯一(修改验证)
	 */
	@RequestMapping(value = "/mdOnlyUserName", method = RequestMethod.POST)
	public void mdOnlyUserName(String userName, Integer userId,
			HttpServletResponse response) {
		if (userName.equals(userService.selectByPrimaryKey(userId)
				.getUserName())) {
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			User user = userService.selectByUsername(userName);
			try {
				if (user == null) {
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
	 * 验证手机号码是否唯一(修改验证)
	 */
	@RequestMapping(value = "/mdOnlyPhone", method = RequestMethod.POST)
	public void mdOnlyPhone(String mdphone, Integer userId,
			HttpServletResponse response) {
		if (mdphone.equals(userService.selectByPrimaryKey(userId)
				.getPhone())) {
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			User user = userService.selectByPhone(mdphone);
			try {
				if (user == null) {
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
	 * 验证电子邮箱是否唯一(修改验证)
	 */
	@RequestMapping(value = "/mdOnlyEmail", method = RequestMethod.POST)
	public void mdOnlyEmail(String mdemail, Integer userId,
			HttpServletResponse response) {
		if (mdemail.equals(userService.selectByPrimaryKey(userId)
				.getEmail())) {
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			User user = userService.selectByEmail(mdemail);
			try {
				if (user == null) {
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
	 * 验证原密码输入
	 */
	@RequestMapping(value = "/OnlyPassword", method = RequestMethod.POST)
	public void OnlyPassword(String password, Integer userId,
			HttpServletResponse response) {
		String sqlpassword = userService.selectByPrimaryKey(userId)
				.getPassword();
		String username = userService.selectByPrimaryKey(userId).getUserName();
		String cryptedPwd = new Md5Hash(password, username, 1024).toString();
		if (cryptedPwd.equals(sqlpassword)) {
			try {
				response.getWriter().print(true);
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			try {
				response.getWriter().print(false);
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
	}

	/**
	 * 用户修改用户信息
	 */
	@RequestMapping(value = "/updataUser", method = RequestMethod.POST)
	@ResponseBody
	public User updataUser(@RequestBody User user, HttpServletRequest request) {
		String name = userService.selectByPrimaryKey(user.getUserId()).getUserName();
		SimpleMailSender Sender = new SimpleMailSender();
		String congtent = name
				+ ": 你好，您正在进行修改个人信息操作，请确认是你本人操作！    ---中大检测数据监测平台";
		Sender.send(userService.selectByPrimaryKey(user.getUserId()).getEmail(), "修改个人信息提醒", congtent);
		if(!userService.selectByPrimaryKey(user.getUserId()).getPassword().equals(user.getPassword())){
			if(user.getPassword()==""|user.getPassword()==null){
				user.setPassword(userService.selectByPrimaryKey(user.getUserId()).getPassword());
			}else{
				String cryptedPwd = new Md5Hash(user.getPassword(), name, 1024).toString();
				user.setPassword(cryptedPwd);
			}
		}
		userService.updateByPrimaryKeySelective(user);
		WebUtils.setSessionAttribute(request, "userInfo", user);
		return user;
	}

	/**
	 * 查找用户权限
	 */
	@RequestMapping(value = "/selectUserRole", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> selectUserRole(Integer userId){
		Map<String, String> model = new HashMap<String, String>();
		List<Role> roleInfos = roleService.selectRolesByUserId(userId);
		 for (Role role : roleInfos) {
			 model.put("role", role.getRoleName());
		 }
		 return model;
	}

	/**
	 * 查找用户所属项目
	 */
	@RequestMapping(value = "/selectUserproject", method=RequestMethod.POST)
	@ResponseBody
	public List<Project> selectUserproject(Integer userId){
		 List<Project> projectList = projectService.selectProjectAndSysDicByUserIds(userId);
		 return projectList;
	}

	/**
	 * 关键词查找用户（用户名，电话，邮箱，公司，联系人，用户表按时间排序）
	 */
	@RequestMapping(value = "/keywordSearch", method=RequestMethod.POST)
	@ResponseBody
	public List<User> keywordSearch(String keyword,Integer userId){
		List<User> userss =  userService.selectUserByKeyword(keyword,userId);
		return userss;
	}


	/**
	 * 找回密码retpassword
	 */
	@RequestMapping(value = "/retunpassword", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> retpassword(String contect){
		Map<String, String> model = new HashMap<String, String>();
		//判定传来的phone的格式，为phone或email
		//邮箱格式验证
		String expr = "^([a-zA-Z0-9_\\-\\.]+)@((\\[[0-9]{1,3}\\.[0-9]{1,3}\\.[0-9]{1,3}\\.)|(([a-zA-Z0-9\\-]+\\.)+))([a-zA-Z]{2,4}|[0-9]{1,3})$";
		//手机号码格式验证
		Pattern pattern = Pattern.compile("^(13[0-9]|15[0-9]|153|15[6-9]|180|18[23]|18[5-9])\\d{8}$");
		//获取六位数随机验证码
		String code = GetVerificationCode.getRandom();
		Matcher matcher = pattern.matcher(contect);
		 if (matcher.matches()) {
			if(userService.selectByPhone(contect)!=null){
				//手机号码格式验证通过，发送手机验证码
				System.out.println("手机号码验证通过！"+code);
				model.put("code", code);
				return model;
			}else{
			model.put("code", null);
			return model;
			}
	     }else{
	        //手机号码格式验证失败，进行邮箱验证
	        System.out.println("手机号码验证失败，正在进行邮箱验证...");
	        if (contect.matches(expr)) {
	        	if(userService.selectByEmail(contect)!=null){
	        		//邮箱格式验证通过，发送邮箱验证码
	        		SimpleMailSender Sender = new SimpleMailSender();
	        		String congtent = userService.selectByEmail(contect).getUserName()
	        					    +": 您好，您的验证码是:"+code+"5分钟内有效。如非本人操作，请忽略本短信。---中大检测数据监测平台";
	        		Sender.send(contect, "找回密码", congtent);
		        	System.out.println("邮箱验证通过！"+code);
		        	model.put("code", code);
					return model;
	        	}else{
	        	model.put("code", null);
	            return model;
	        	}
	        }else{
	            //邮箱格式验证失败
	            System.out.println("邮箱验证失败");
	            model.put("code", null);
				return model;
	        }
	    }
	}

	/**
	 * 用户输入验证码是否正确
	 */
	@RequestMapping(value = "/verIsQqual" ,method=RequestMethod.POST)
	@ResponseBody
	public Map<String, String> verIsQqual(String inputVerification,String temporaryVerification){
		Map<String, String> model = new HashMap<String, String>();
		if(inputVerification.equals(temporaryVerification)){
			model.put("bool", "1");
			return model;
		}else{
			model.put("bool", "0");
			return model;
		}
	}

	/**
	 * 用户通过验证找回密码-修改密码
	 */
	@RequestMapping(value = "/selfChangPassword" ,method=RequestMethod.POST)
	public void changPassword(String newpassword, String contect){
		//手机号码格式验证
		Pattern pattern = Pattern.compile("^(13[0-9]|15[0-9]|153|15[6-9]|180|18[23]|18[5-9])\\d{8}$");
		Matcher matcher = pattern.matcher(contect);
		User user;
		if (matcher.matches()) {
			//手机号找回密码
			user = userService.selectByPhone(contect);
		}else{
			//邮箱找回密码
			user = userService.selectByEmail(contect);
		}
			String name = user.getUserName();
			String cryptedPwd = new Md5Hash(newpassword, name, 1024).toString();
			user.setPassword(cryptedPwd);
			userService.updateByPrimaryKeySelective(user);
			System.out.println("修改成功");
	}

	/**
	 * 跳转到找回密码页面
	 */
	@RequestMapping(value = "/retpassword")
	public String turnpassword(){
		return "retpassword";
	}

	/**
	 * 根据用户名禁用用户
	 */
	/*
	 * @RequestMapping(value = "/updateUserState") public String
	 * updateUserState(String username, String state, Model model){ boolean flag
	 * = userService.updateUserState(username, state); if(!flag){
	 * model.addAttribute("error", "启用或禁用失败 ！"); } return userList(model); }
	 */

	/**
	 * 根据用户名踢出用户
	 */
	/*
	 * @RequestMapping(value = "/forceUserLogout") public String
	 * forceUserLogout(String username, Model model){ Collection<Session>
	 * sessions = sessionDAO.getActiveSessions(); for(Session session:sessions){
	 * Object userObj = 0 *
	 * session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
	 * if(null == userObj){ continue; } if(userObj.toString().equals(username)){
	 * session.stop();; break; } } return activeUserList(model); }
	 */

	/**
	 * 显示所有在线用户
	 */
	/*
	 * @RequestMapping(value = "/activeUserList") public String
	 * activeUserList(Model model){ Collection<Session> sessions =
	 * sessionDAO.getActiveSessions(); List<User> activeUserList = new
	 * ArrayList<User>(); for(Session session:sessions){ Object userObj =
	 * session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
	 * if(null == userObj){ continue; } String username = userObj.toString();
	 * User user = userService.selectByUsername(username);
	 * user.setIp(session.getHost());
	 * user.setLastAccessTime(session.getLastAccessTime());
	 * user.setSessionId(session.getId()); activeUserList.add(user); }
	 * model.addAttribute("activeUserList", activeUserList); return
	 * "user/activeUserList"; }
	 */
}
