package com.zhongda.detection.core.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;
import java.util.Vector;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.web.multipart.MultipartFile;

import com.jcraft.jsch.ChannelSftp;
import com.jcraft.jsch.JSch;
import com.jcraft.jsch.JSchException;
import com.jcraft.jsch.Session;
import com.jcraft.jsch.SftpException;

public class JschRemote {
	
	public static final Logger logger = LoggerFactory.getLogger(JschRemote.class);
	
	private static JSch jsch;
	private static Session session;

	/**
	 * 连接到指定的IP的服务器
	 * @param user 用户名
	 * @param passwd 密码
	 * @param host 主机IP地址
	 * @param port 端口号
	 */
	public static void connect(String user, String passwd, String host, int port) {
		try {
			jsch = new JSch();// 创建JSch对象
			session = jsch.getSession(user, host, port);// 根据用户名、主机ip、端口号获取一个Session对象			
			session.setPassword(passwd);// 设置密码
			Properties config = new Properties();
			config.put("StrictHostKeyChecking", "no");
			session.setConfig(config);// 为Session对象设置properties
			session.setTimeout(1500);// 设置超时
			session.connect();// 通过Session建立连接
			System.out.println("session is connected:"+session);
		} catch (JSchException e) {
			logger.error("连接远程服务器失败："+e.getMessage());
		}
	}
	
	/**
	 * 连接到默认服务器
	 */
	public static void connect() {
		connect("root", "hnzdjc@123", "123.207.39.209", 22);
	}

	/**
	 *  关闭连接
	 */
	public static void close() {
		if(null != session && session.isConnected()){
			System.out.println("session is closed:"+session);
			session.disconnect();
        }
	}


	/**
	 * 上传文件
	 * @param directory 上传到服务器的目录
	 * @param uploadFile 要上传的文件
	 */
	public static void upload(String baseDirectory, String otherDirectory, MultipartFile uploadFile, String newFileName){
		ChannelSftp channelSftp = null;
		InputStream fs = null;
		try {
			channelSftp = (ChannelSftp) session.openChannel("sftp");
			channelSftp.connect();
			channelSftp.cd(baseDirectory);
			String[] folders = otherDirectory.split("/");
			for (String folder : folders) {
				if (folder.length() > 0 && !folder.contains(".")) {
					try {
						channelSftp.cd(folder);
					} catch (SftpException e) {
						channelSftp.mkdir(folder);
						channelSftp.cd(folder);
					}
				}
			}
			fs = uploadFile.getInputStream();
			channelSftp.put(fs, newFileName);
			logger.info("上传文件:"+otherDirectory+"/"+newFileName+"成功");
		} catch (JSchException e) {
			logger.error("打开sftp通道失败："+e.getMessage());
		} catch (SftpException e) {
			logger.error("使用sftp通道异常："+e.getMessage());	
		} catch (IOException e) {
			logger.error("IO异常："+e.getMessage());
		} finally{
			try {
				if(null != channelSftp && channelSftp.isConnected()){  
					channelSftp.disconnect();  
	            }
				if(null != fs){  
					fs.close();
	            } 
			} catch (IOException e) {
				logger.error("IO异常："+e.getMessage());
			}  
		}
	}

	/**
	 * 下载文件
	 * @param src linux服务器文件地址
	 * @param dst 本地存放地址
	 */
	public void download(String src, String dst){
		ChannelSftp channelSftp = null;
		try {
			channelSftp = (ChannelSftp) session.openChannel("sftp");
			channelSftp.connect();
			channelSftp.get(src, dst);
			logger.info("下载文件:"+src+"成功");
		} catch (JSchException e) {
			logger.error("打开sftp通道失败："+e.getMessage());
		} catch (SftpException e) {
			logger.error("使用sftp通道异常："+e.getMessage());
		} finally{
			if( null != channelSftp && channelSftp.isConnected()){  
				channelSftp.disconnect();  
            }  
		}
	}

	/**
	 * 删除文件
	 * @param directory 要删除文件所在目录
	 * @param deleteFile 要删除的文件
	 */
	public static void delete(String directory, String deleteFile){
		ChannelSftp channelSftp = null;
		try {
			channelSftp = (ChannelSftp) session.openChannel("sftp");
			channelSftp.connect();
			channelSftp.cd(directory);
			channelSftp.rm(deleteFile);
			logger.info("删除文件:"+deleteFile+"成功");
		} catch (JSchException e) {
			logger.error("打开sftp通道失败："+e.getMessage());
		} catch (SftpException e) {
			logger.error("使用sftp通道异常："+e.getMessage());
		} finally{
			if( null != channelSftp && channelSftp.isConnected()){  
				channelSftp.disconnect();  
            }  
		}
	}

	/**
	 * 列出目录下的文件
	 * @param directory 要列出的目录
	 * @return 
	 */
	@SuppressWarnings("rawtypes")
	public Vector listFiles(String directory){
		ChannelSftp channelSftp = null;
		Vector vector = null;
		try {
			channelSftp = (ChannelSftp) session.openChannel("sftp");
			channelSftp.connect();
			vector = channelSftp.ls(directory);
		} catch (JSchException e) {
			logger.error("打开sftp通道失败："+e.getMessage());
		} catch (SftpException e) {
			logger.error("使用sftp通道异常："+e.getMessage());
		} finally{
			if( null != channelSftp && channelSftp.isConnected()){  
				channelSftp.disconnect();  
            }  
		}
		return vector;
	}
}
