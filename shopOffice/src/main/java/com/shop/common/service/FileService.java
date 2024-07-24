package com.shop.common.service;


import org.springframework.stereotype.Service;

import com.shop.table.vo.FileVO;
import com.shop.util.Constant;
import com.shop.util.FileUploadUtil;

@Service
public class FileService {

	
	public FileVO createFile(FileVO vo) throws Exception {

		String fileCd="", fileExt="";
		
		if (!vo.getFile().getOriginalFilename().isEmpty()) {
			
			fileCd = FileUploadUtil.getUuid();
			fileExt = vo.getFile().getOriginalFilename().substring(vo.getFile().getOriginalFilename().lastIndexOf("."),vo.getFile().getOriginalFilename().length());
			
			vo.setFileCd(fileCd);
			vo.setFileNm(fileCd+fileExt);
			vo.setFilePath(Constant.FILE_PATH+"/"+vo.getFileNm());
			vo.setOrgFileNm(vo.getFile().getOriginalFilename());
			
			//File upload
			FileUploadUtil.uploadFormFile(vo);
			
		}
		
		return vo;
	}
	/*
	public FileVO createFileList(FileVO vo) throws Exception {

		String fileCd="", fileExt="";
		
		if (!vo.getFilelist().getOriginalFilename().isEmpty()) {
			
			fileCd = FileUploadUtil.getUuid();
			fileExt = vo.getFile().getOriginalFilename().substring(vo.getFile().getOriginalFilename().lastIndexOf("."),vo.getFile().getOriginalFilename().length());
			
			vo.setFileCd(fileCd);
			vo.setFileNm(fileCd+fileExt);
			vo.setFilePath(Constant.FILE_PATH+"/"+vo.getFileNm());
			vo.setOrgFileNm(vo.getFile().getOriginalFilename());
			
			//File upload
			FileUploadUtil.uploadFormFile(vo);
			
		}
		
		return vo;
	}
	*/
}
