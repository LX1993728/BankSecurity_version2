package com.anorng.bank.controller.ajax;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import com.anorng.bank.core.config.Global;
import com.anorng.bank.core.utils.FileUploadUtils;

import java.io.*;
import java.util.ArrayList;
import java.util.List;

/**
 * 文件上传
 */

@Controller
@RequestMapping("/image")
public class FileUploadController {

	private static final Logger log = LoggerFactory.getLogger(FileUploadController.class);

	private String uploadAndGetPath(MultipartFile file) {
		// 得到文件真实名称
		String filename = file.getOriginalFilename();

		// 得到随机名称
		String uuidname = FileUploadUtils.getUUIDFileName(filename);

		// 得到随机目录
		String randomDirectory = FileUploadUtils.getRandomDirectory(filename);

		// 注意：随机目录可能不存在,需要创建
		File rd = new File(Global.imageDirectory, randomDirectory);
		if (!rd.exists()) {
			rd.mkdirs();
		}

		try {
			file.transferTo(new File(rd, uuidname));
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
		return new File(rd, uuidname).getPath().substring(Global.imageDirectory.length() - 1);
	}

	@RequestMapping(value = "/toUpload")
	public String toUploadPage(Model model) {
		return "test";
	}

	// 多文件上传 此方法仅用于测试
	@RequestMapping(value = "/multiUpload", method = { RequestMethod.POST })
	@ResponseBody
	public Object upload(HttpServletRequest request) throws Exception {
		List<MultipartFile> files = ((MultipartHttpServletRequest) request).getFiles("f");
		MultipartFile file = null;
		List<String> paths = new ArrayList<>();
		for (int i = 0; i < files.size(); ++i) {
			file = files.get(i);
			if (!file.isEmpty()) {
				String filename = file.getOriginalFilename();
				log.info("=======originName:{}=============", filename);
				paths.add(uploadAndGetPath(file));
			} else {
				return "You failed to upload " + i + " because the file was empty.";
			}
		}
		return paths;
	}

	// 单文件上传 真正使用
	@RequestMapping(value = "/singleUpload", method = { RequestMethod.POST })
	@ResponseBody
	public Object singleUpload(HttpServletRequest request, HttpServletResponse response) throws Exception {
		MultipartFile file = ((MultipartHttpServletRequest) request).getFile("f");
		String path = null;
		if (!file.isEmpty()) {
			String filename = file.getOriginalFilename();
			log.info("=======originName:{}=============", filename);
			path = uploadAndGetPath(file);
			if (path == null) {
				response.setStatus(500);
			}
		} else {
			response.setStatus(400); // 没有上传图片
		}
		return path;
	}

}
