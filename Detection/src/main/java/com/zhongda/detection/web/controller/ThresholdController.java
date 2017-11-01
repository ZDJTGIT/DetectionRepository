package com.zhongda.detection.web.controller;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.zhongda.detection.web.dao.ThresholdMapper;
import com.zhongda.detection.web.model.Threshold;

@RestController
@RequestMapping(value = "/threshold")
public class ThresholdController {

	@Autowired
	private ThresholdMapper thresholdService;

	/**
	 * 上传图片
	 */
	@RequestMapping(value = "/uploadImg", method = RequestMethod.POST)
	public String uploadImg(
			@RequestParam(value = "file", required = false) MultipartFile file,
			HttpServletRequest request) {

		System.out.println("开始");
		String path = request.getSession().getServletContext()
				.getRealPath("assets/upload");
		System.out.println(path);
		String fileName = file.getOriginalFilename();
		// System.out.println(fileName);
		// String[] fileNameArray = fileName.split(".");
		// System.out.println(fileNameArray.length);
		// fileName = new
		// Date().getTime()+fileNameArray[fileNameArray.length-1];
		System.out.println(fileName);
		File targetFile = new File(path, fileName);
		if (!targetFile.exists()) {
			targetFile.mkdirs();
		}
		// 保存
		try {
			file.transferTo(targetFile);
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "{\"code\":\"0\",\"path\":\"assets/upload/" + fileName + "\"}";
	}

	/**
	 * 新建测点
	 */
	@RequestMapping(value = "/showProjectThreshold", method = RequestMethod.POST)
	@ResponseBody
	public List<Threshold> showProjectThreshold(Integer projectId) {
		// 根据项目名查所有Threshold记录
		// List<Threshold> s = thresholdService.selectByProjectId(projectId);
		// for(Threshold threshold:s){
		// System.out.println("7979779797979797979979"+threshold.getDetectionTypeName());
		// }
		return thresholdService.selectByProjectId(projectId);
	}

}
