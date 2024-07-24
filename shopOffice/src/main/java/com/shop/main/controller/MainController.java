package com.shop.main.controller;


import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.main.service.MainService;
import com.shop.table.vo.MainVO;

@Controller
public class MainController {
	
	@Autowired
	MainService service;
	
	@RequestMapping("/main")
	public String main() throws Exception{
		return "/main";
	}
	// 대쉬보드 정보 불러오기
	@RequestMapping("/main/dashboardInfo")
	@ResponseBody
	public MainVO dashboardInfo(@ModelAttribute("MainVO") MainVO vo) throws Exception  {
		
		vo = service.dashboardInfo(vo);
		
		return vo;
	}
	// 대쉬보드 매출 차트 불러오기
	@RequestMapping("/main/salesChart")
	@ResponseBody
	public List<MainVO> salesChart(@ModelAttribute("MainVO")MainVO vo)throws Exception{
		
		List<MainVO> list = service.salesChart(vo);
		
		return list;
	}
	// 대쉬보드 주문 차트 불러오기
	@RequestMapping("/main/orderChart")
	@ResponseBody
	public List<MainVO> orderChart(@ModelAttribute("MainVO")MainVO vo)throws Exception{
		
		List<MainVO> list = service.orderChart(vo);
		
		return list;
	}
}
