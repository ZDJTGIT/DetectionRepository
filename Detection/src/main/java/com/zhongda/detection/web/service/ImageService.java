package com.zhongda.detection.web.service;

import com.zhongda.detection.web.model.Image;
import com.zhongda.detection.web.model.Result;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public interface ImageService {

	 /**
     * 查项目下所有图片信息
     * @param projectId
     * @return
     */
    List<Image> selectImageByProjectId(Integer projectId);
	
    /**
     * 插入一条图片地址数据
     * @param record
     * @return
     */
    int insertSelective(Image record);

    /**
     * 根据ID修改图片信息
     * @param record
     * @return
     */
    int updateByPrimaryKeySelective(Image record);

	/**
	 * 查找图片根据项目ID和检测指标ID
	 * 
	 * @param projectId
	 * @param detectionTypeId
	 * @return
	 */
	Image selectImageByTwoId(Integer projectId, Integer detectionTypeId);
	
	/**
	 * 删除具体的图片
	 * @param imageUrl 图片在服务器上的路径(需和基本路径一起组装成完整目录)
	 */
	void removeImage(String imageUrl);
	
	/**
	 * 上传图片至服务器
	 * @param file 图片文件
	 * @return 返回上传结果
	 */
	Result uploadImage(MultipartFile file);
	
	/**
	 * 单个图片上传至服务器，同时更新数据库的url路径
	 * @param file 需上传的图片文件
	 * @param imageId 数据库对应的图片id
	 * @return
	 */
	Result uploadSingleImage(MultipartFile file, Integer imageId);
	
	/**
	 * 多个图片上传至服务器，同时更新数据库的url路径
	 * @param file 需上传的图片文件
	 * @param imageId 数据库对应的图片id
	 * @return
	 */
	Result uploadMultipleImage(MultipartFile file, Integer imageId);
	
	/**
	 * 更新物理图的Url路径
	 * @param imageId 对应物理图的Id
	 * @return 
	 */
	Image updatePhysicalUrl(Integer imageId);
	
	/**
	 * 根据项目ID删除服务器上的图片
	 * @param projectId
	 * @return
	 */
	Result delateImageByProjectId(Integer projectId);
	
	/**
	 * 通过项目ID删除项目下所有图片
	 * @param projectId
	 * @return
	 */
	int deleteByProjectId(Integer projectId);
}
