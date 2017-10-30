package com.zhongda.detection.core.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Date;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

/**
 * 邮件发送器
 * @author zmdeng
 */
public class SimpleMailSender {

	public static final Logger logger = LoggerFactory.getLogger(SimpleMailSender.class);
	/**
	 * 注册模板标识: _register
	 * 注册模板主题 : 注册验证
	 * 注册模板内容 : ${toUserName}:你好! <a href="http://www.baidu.com?email=${toEmailAddress}">注册链接</a>
	 */
	public static final String REGISTER="_register";
	/**
	 * 改密模板标识: _changesPwd
	 * 改密模板主题 : 改密验证
	 * 改密模板内容 : ${toUserName},你好！请点击右边超链接改密<a href="http://localhost/Detection/rest/user/cp?zemin=${toEmailAddress}">改密链接</a>,次链接半小时后失效,谢谢！
	 */
	public static final String CHANGES_PWD="_changesPwd";
	/**
	 * 数据类告警
	 * 告警模板标识: _alarmDataMessage
	 * 告警模板主题 : 告警消息
	 * 告警模板内容 : 尊敬的{0}用户：<br>您好！您的{1}项目，编号为：{2}的传感器监测到{3}超过阈值，当前值{4}，阈值范围{5}~{6}。<br>详情请点击<a href="http://localhost/Detection">中大检测在线检测服务平台</a>查看，谢谢！
	 * {0}账户名  {1}项目名 {2}传感器编号 {3}监测的类型 {4}监测到的超过阈值的当前值 {5}最小阈值 {6}最大阈值
	 */
	public static final String ALARM_DATA_MESSAGE="_alarmDataMessage";
	/**
	 * 设备类告警
	 * 告警模板标识: _alarmDeviceMessage
	 * 告警模板主题 : 告警消息
	 * 告警模板内容 : 尊敬的{0}用户：<br>您好！您的{1}项目，编号为：{2}的传感器出现故障，请及时处理。<br>详情请点击<a href="http://localhost/Detection">中大检测在线检测服务平台</a>查看，谢谢！
	 * {0}账户名  {1}项目名 {2}传感器编号
	 */
	public static final String ALARM_DEVICE_MESSAGE="_alarmDeviceMessage";

    //邮箱的配置文件
    private Properties properties ;
    
    //邮箱的配置文件路径
    private String mailConfigPath="/mail.properties";

    //邮件服务器登录验证
    private MailAuthenticator authenticator;

    //邮箱session
    private Session session;

    /**
     * 初始化邮件发送器
     * 获取发送邮件的props文件，以及加载邮箱的配置文件
     */
    public SimpleMailSender() {
    	
    	logger.info("开始加载properties文件内容.......");
        properties = new Properties();
        InputStream inputStream = PropertiesTool.class.getResourceAsStream(mailConfigPath);
        try {
        	properties.load(inputStream);
        } catch (IOException e) {
			logger.error("无法加载"+mailConfigPath+"目录下的properties文件");
		}finally {
            try {
                if(null != inputStream) {
                	inputStream.close();
                }
            } catch (IOException e) {
                logger.error(mailConfigPath+"文件流关闭出现异常");
            }
        }
        logger.info("加载properties文件内容完成...........");
    	
    	//发送邮件的props文件
        Properties props = System.getProperties();
        //初始化发送邮件的props文件
    	init(props);
    }

    /**
     * 初始化
     * @param props 发送邮件的props文件
     */
	private void init(Properties props) {
    	String smtpHostName = properties.getProperty("smtpHostName");
    	if(null == smtpHostName || smtpHostName.equals("")){
    		smtpHostName = "smtp." + properties.getProperty("username").split("@")[1];
    	}
    	// 初始化props
    	props.put("mail.smtp.auth", "true"); // 使用验证
    	props.put("mail.smtp.host", smtpHostName);
    	props.put("mail.smtp.starttls.enable", "true");// 使用 STARTTLS安全连接
    	props.put("mail.transport.protocol", "smtp");
    	//props.put("mail.smtp.ssl.enable", "true");
    	// props.put("mail.smtp.port", "465"); //google使用465或587端口
    	// props.put("mail.debug", "true");

    	// 验证邮箱地址和密码
		this.authenticator = new MailAuthenticator(properties.getProperty("username"), properties.getProperty("password"));
    	// 创建session
    	this.session = Session.getInstance(props, this.authenticator);
    }

    /**
     * 发送邮件
     * @param recipient 收件人邮箱地址
     * @param subject 邮件主题
     * @param content 邮件内容
     */
    public void send(String recipient, String subject, Object content){
    	// 创建mime类型邮件
    	MimeMessage message = new MimeMessage(session);
    	try {
    		// 设置发信人
			message.setFrom(new InternetAddress(authenticator.getUsername()));
			// 设置收件人
	    	message.setRecipient(RecipientType.TO, new InternetAddress(recipient));
	    	// 设置主题
	    	message.setSubject(subject);
	    	// 设置邮件内容
	    	//String str = content.toString();
	    	//String newStr[] = str.split("\"");
	    	message.setContent(content.toString(), "text/html;charset=utf-8");
	    	// 设置发送时间
	    	message.setSentDate(new Date());
	    	// 发送
	    	Transport.send(message);
		} catch (AddressException e) {
			logger.error("发送方或接收方的邮箱地址错误："+e.getMessage());
		} catch (MessagingException e) {
			logger.error("发送的消息异常："+e.getMessage());
		}

    }

    /**
     * 群发邮件
     * @param recipients 收件人们
     * @param subject 主题
     * @param content 内容
     */
    public void send(List<String> recipients, String subject, Object content){
    	// 创建mime类型邮件
    	MimeMessage message = new MimeMessage(session);
    	try {
    		// 设置发信人
			message.setFrom(new InternetAddress(authenticator.getUsername()));
			// 设置收件人们
	    	int num = recipients.size();
	    	InternetAddress[] addresses = new InternetAddress[num];
	    	for (int i = 0; i < num; i++) {
	    		addresses[i] = new InternetAddress(recipients.get(i));
	    	}
	    	message.setRecipients(RecipientType.TO, addresses);
	    	// 设置主题
	    	message.setSubject(subject);
	    	// 设置邮件内容
	    	message.setContent(content.toString(), "text/html;charset=utf-8");
	    	// 设置发送时间
	    	message.setSentDate(new Date());
	    	// 发送
	    	Transport.send(message);
    	} catch (AddressException e) {
			logger.error("发送方或接收方的邮箱地址错误："+e.getMessage());
		} catch (MessagingException e) {
			logger.error("发送的消息异常："+e.getMessage());
		}
    }

    /**
     * 发送邮件
     * @param recipient 收件人邮箱地址
     * @param template 邮件配置文件中的模板
     */
    public void send(String recipient , String template){
    	send(recipient, PropertiesTool.get(properties, "mailSubject"+template) , PropertiesTool.get(properties, "mailContent"+template));
    }

    /**
     * 群发邮件
     * @param recipients 收件人们的邮箱地址
     * @param template 邮件配置文件中的模板
     */
    public void send(List<String> recipients , String template){
    	send(recipients, PropertiesTool.get(properties, "mailSubject"+template) , PropertiesTool.get(properties, "mailContent"+template));
    }
    
    /**
     * 发送邮件
     * @param recipient 收件人邮箱地址
     * @param template 邮件配置文件中的模板标识
     * @param params 对应模板占位符的参数集合
     */
    public void send(String recipient , String template, List<String> params){
    	send(recipient, PropertiesTool.get(properties, "mailSubject"+template) , PropertiesTool.get(properties, "mailContent"+template, params.toArray()));
    }

    /**
     * 群发邮件
     * @param recipients 收件人们的邮箱地址
     * @param template 邮件配置文件中的模板标识
     * @param params 对应模板占位符的参数集合
     */
    public void send(List<String> recipients , String template, List<String> params){
    	send(recipients, PropertiesTool.get(properties, "mailSubject"+template) , PropertiesTool.get(properties, "mailContent"+template, params.toArray()));
    }

    //邮箱密码验证类
    class MailAuthenticator extends Authenticator {

    	//用户名（登录邮箱）
        private String username;

        //密码
        private String password;

        public MailAuthenticator() {

        }
        /**
         * 初始化邮箱和密码
         * @param username 邮箱
         * @param password 密码
         */
        public MailAuthenticator(String username, String password) {
        	this.username = username;
        	this.password = password;
        }

        @Override
        protected PasswordAuthentication getPasswordAuthentication() {
        	return new PasswordAuthentication(this.username, this.password);
        }

        public String getPassword() {
        	return this.password;
        }

        public String getUsername() {
        	return this.username;
        }

        public void setPassword(String password) {
        	this.password = password;
        }

        public void setUsername(String username) {
        	this.username = username;
        }
    }
}
