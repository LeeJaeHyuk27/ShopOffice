package com.shop.system.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.sup.vo.SupVO;
import com.shop.system.service.ManageService;
import com.shop.system.vo.ManageVO;
import com.shop.table.vo.ManagerInfoVO;

@Controller
public class ManageController {

	@Autowired
	ManageService service;
	
	// 관리자 조회화면
	@RequestMapping("/system/manager")
	public String manager() throws Exception{
		return "/system/manager";
	}
	
	// 관리자 조회
	@RequestMapping("/system/getManagerList")
	@ResponseBody
	public ManageVO getManagerList(@ModelAttribute("ManagerInfoVO") ManagerInfoVO vo)throws Exception{
		
		int totalPage = service.selectTotalManagerCount(vo);
		
		List<ManagerInfoVO> list = service.selectManagerList(vo);
		
		// 2.Client에 넘겨줄 데이터 세팅
		ManageVO managevo = new ManageVO();
		
		managevo.setManagerList(list);
		managevo.setTotal(totalPage); // 총 데이터 수
		managevo.setStartPage(vo.getStartPage());
		managevo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return managevo;
	}
	
	// 모달창 띄우기
	@RequestMapping("/system/getManagerDtl")
	@ResponseBody
	public ManagerInfoVO getManagerDtl(@ModelAttribute("ManagerInfoVO")ManagerInfoVO vo)throws Exception{
		
		vo = service.selectManagerDtl(vo);
		
		return vo;
	}
	
	// 관리자 수정/등록
	@RequestMapping("/system/saveManager")
	@ResponseBody
	public int saveManager(@ModelAttribute("ManagerInfoVO")ManagerInfoVO vo) throws Exception{
		
		int cnt = service.saveManager(vo);
		
		return cnt;
	}
	
}
