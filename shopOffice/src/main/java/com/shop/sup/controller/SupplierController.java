package com.shop.sup.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.sup.service.SupplierService;
import com.shop.sup.vo.SupOVO;
import com.shop.sup.vo.SupVO;
import com.shop.table.vo.SupInfoVO;
import com.shop.table.vo.SupOrderVO;

@Controller
public class SupplierController {

	@Autowired
	SupplierService service;
	
	// 거래처 조회화면
	@RequestMapping("/supplier/supplier")
	public String supplier() throws Exception{
		return "/supplier/supplier";
	}
	
	// 거래처명 콤보박스
	@RequestMapping("/sup/getSupNameList")
	@ResponseBody
	public ArrayList<SupInfoVO> getSupplierList(@ModelAttribute SupInfoVO vo) throws Exception {
		
		ArrayList<SupInfoVO> list = service.selectSupNameList(vo);
		
		return list;
	}
	
	// 거래처 조회
	@RequestMapping("/supplier/getSupList")
	@ResponseBody
	public SupVO getSupList(@ModelAttribute("SupInfoVO") SupInfoVO vo)throws Exception{
		// 1.전체 데이터 개수 조회
		int totalPage = service.selectTotalSupCount(vo);
				
		List<SupInfoVO> list = service.selectSupList(vo);
		
		// 2.Client에 넘겨줄 데이터 세팅
		SupVO supvo = new SupVO();
		
		supvo.setSupplierList(list);
		supvo.setTotal(totalPage); // 총 데이터 수
		supvo.setStartPage(vo.getStartPage());
		supvo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return supvo;
	}
	
	// 거래처 수정/등록 띄우기
	@RequestMapping("/supplier/getSupDtl")
	@ResponseBody
	public SupInfoVO getSupDtl(@ModelAttribute("SupInfoVO")SupInfoVO vo)throws Exception{
		
		vo = service.selectSupDtl(vo);
		
		return vo;
	}
	
	// 거래처 수정하기
	@RequestMapping("/supplier/updateSupplier")
	@ResponseBody
	public int updateSupplier(@ModelAttribute("SupInfoVO")SupInfoVO vo)throws Exception{
		
		int cnt = service.updateSupplier(vo);
		
		return cnt;
	}

	// 거래처 등록
	@RequestMapping("/supplier/insertSupplier")
	@ResponseBody
	public int insertSupplier(@ModelAttribute("SupInfoVO")SupInfoVO vo)throws Exception{
		
		int cnt = service.insertSupplier(vo);
		
		return cnt;
	}
	
	// 발주 조회화면
	@RequestMapping("/supplier/supOrder")
	public String supOrder() throws Exception{
		return "/supplier/supOrder";
	}
	
	// 발주 조회
	@RequestMapping("/supplier/getSupOrderSearch")
	@ResponseBody
	public SupOVO getSupOrderSearch(@ModelAttribute("SupOrderVO") SupOrderVO vo)throws Exception{
		
		// 1.전체 데이터 개수 조회
		int totalPage = service.selectTotalSupOrderCount(vo);
				
		List<SupOrderVO> list = service.selectSupOrderList(vo);
		
		// 2.Client에 넘겨줄 데이터 세팅
		SupOVO supovo = new SupOVO();
		
		supovo.setSupOrderList(list);
		supovo.setTotal(totalPage); // 총 데이터 수
		supovo.setStartPage(vo.getStartPage());
		supovo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return supovo;
	}
	
	// 발주 신청
	@RequestMapping("/supplier/insertSupOrder")
	@ResponseBody
	public int insertSupOrder(@ModelAttribute("SupOrderVO")SupOrderVO vo)throws Exception{
		
		int cnt = service.insertSupOrder(vo);
		
		return cnt;
	}
	
	// 발주 정보 가져오기
	@RequestMapping("/supplier/getSupOrderDtl")
	@ResponseBody
	public List<SupOrderVO> getSupOrderDtl(@ModelAttribute SupOrderVO vo)throws Exception{
		
		List<SupOrderVO> list = service.selectSupOrderDtl(vo);
		
		return list;
	}
	
	// 대쉬보드 주간 발주정보
	@RequestMapping("/supplier/getWeekSupOrder")
	@ResponseBody
	public List<SupOrderVO> getWeekSupOrder(@ModelAttribute SupOrderVO vo)throws Exception{
		
		List<SupOrderVO> list = service.selectWeekSupOrder(vo);
		
		return list;
	}
}
