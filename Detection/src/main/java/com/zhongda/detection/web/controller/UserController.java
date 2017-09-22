package com.zhongda.detection.web.controller;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
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
import org.apache.shiro.session.mgt.eis.SessionDAO;
import org.apache.shiro.subject.Subject;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.propertyeditors.CustomDateEditor;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.ServletRequestDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.util.WebUtils;

import com.zhongda.detection.core.utils.SimpleMailSender;
import com.zhongda.detection.web.model.User;
import com.zhongda.detection.web.security.PermissionSign;
import com.zhongda.detection.web.security.RoleSign;
import com.zhongda.detection.web.service.UserService;
import com.zhongda.detection.web.service.impl.UserServiceImpl;

/**
 * 用户控制器
 **/
@Controller
@RequestMapping(value = "/user")
public class UserController {

	@Resource
	private UserService userService;

	@Resource(name = "sessionDAO")
	private SessionDAO sessionDAO;

	@Resource(name = "shiroEhcacheManager")
	private CacheManager cacheManager;
	private Cache<String, String> changePasswordCache;

	public static final Logger logger = LoggerFactory.getLogger(UserController.class);

	// private Cache<String,String> vcodeCache;

	/**
	 * 用户登录
	 *
	 * @param user
	 * @param result
	 * @return
	 */
	@RequestMapping(value = "/login", method = RequestMethod.POST)
	public String login(@Valid User user, BindingResult result, Model model,
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

			/*
			 * //获取上一个登录用户的session Collection<Session> sessions =
			 * sessionDAO.getActiveSessions(); for(Session session:sessions){
			 * Object userObj =
			 * session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY
			 * ); if(null == userObj){ continue; }
			 * if(userObj.toString().equals(user.getUsername()) &&
			 * !session.getId().equals(subject.getSession().getId())){ Session
			 * sameSession = session;
			 * messageingTemplate.convertAndSendToUser("1", "/testUser",
			 * "你的账户已在其他地方登录，如不是本人操作，请尽快修改密码！"); //如果当前用户上一个session有效 ,踢出上一个登录用户
			 * sameSession.stop(); } }
			 */
			// 验证成功在Session中保存用户信息
			final User authUserInfo = userService.selectByUsername(user
					.getUserName());
			WebUtils.setSessionAttribute(request, "userInfo", authUserInfo);

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
	public String userList(Model model) {
		List<User> userList = userService.selectList();
		model.addAttribute("userList", userList);
		logger.info("进入userList");
		logger.info("userList的大小"+userList.size());
		return "table_basic";
	}

	/**
	 * 根据用户名查找用户
	 */
	@RequestMapping(value = "/findUser")
	public String findUser(User user, Model model) {
		List<User> userList = userService.selectAllByUsername(user.getUserName());
		if (null == userList || userList.size() == 0) {
			model.addAttribute("error", "没有匹配的用户名 ！");
		} else {
			model.addAttribute("userList", userList);
		}
		return "user/userList";
	}

	/*
	 * String Date 转化
	 */
	@InitBinder
	public void initBinder(ServletRequestDataBinder bin){
	         SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	         CustomDateEditor cust = new CustomDateEditor(sdf, true);
	         bin.registerCustomEditor(Date.class,cust);
	}
	
	/**
	 * 输入用户信息添加用户
	 */

	@RequestMapping(value = "/addUser", method=RequestMethod.POST)
	@ResponseBody
	public User addUser(@RequestBody User user){
		Date date = new Date();
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
		String string = sdf.format(date); 
		user.setPassword("123456");
		user.setStatus("正常");
		user.setCreateTime(date);
		System.out.println("+-+-+-+-+-+-+-"+user.getCreateTime()+"--------------"+string);
		//将user存入数据库
	    userService.insertUser(user);
	    user.setUserId(userService.selectByUsername(user.getUserName()).getUserId());
		return user;
	}

	/**
	 * 根据当前选中的用户名删除用户
	 */

	@RequestMapping(value = "/delete", method=RequestMethod.POST)
	@ResponseBody
	public Map<String, User> delete(String name){

		Map<String, User> modelMap = new HashMap<String,User>();
		UserServiceImpl usiml = new UserServiceImpl();
		if(usiml.deleteUser(name)){
			User user = userService.selectByUsername(name);
			modelMap.put("adept", user);
			System.out.println(modelMap);
			return modelMap;
		}else{
			return null;
		}
	}

	/**
	 * 修改用户信息
	 */
	@RequestMapping(value = "/modify", method=RequestMethod.POST)
	@ResponseBody
	public User modify(@RequestBody User user){
		//传入user修改用户信息
		user.setUserId(50);
		user.setPassword("223456");
		user.setLinkman("杰皆");
		user.setStatus("ture");
		//根据选中的用户修改用户信息
		//userService.updateByPrimaryKeySelective(user);
		return user;
	}
	
	/*
	 * 用户修改用户信息
	 */
	@RequestMapping(value = "/updataUser", method=RequestMethod.POST)
	@ResponseBody
	public User updataUser(@RequestBody User user, HttpServletRequest request){
		userService.updateByPrimaryKeySelective(user);
		WebUtils.setSessionAttribute(request, "userInfo", user);
		return user;
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
	 * Object userObj =
0	 * session.getAttribute(DefaultSubjectContext.PRINCIPALS_SESSION_KEY);
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
