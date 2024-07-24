package com.shop.order.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.order.service.OrderService;
import com.shop.order.vo.OrderVO;
import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.OrderInfoVO;

@Controller
public class OrderController {

	@Autowired
	OrderService service;
	
	@RequestMapping("/order/order")
	public String order() throws Exception{
		return "/order/order";
	}
	
	// 주문 조회
	@RequestMapping("/order/getOrderList")
	@ResponseBody
	public OrderVO selectOrderList(@ModelAttribute("OrderInfoVO") OrderInfoVO vo)throws Exception{
		// 1.전체 데이터 개수 조회
		int totalPage = service.selectTotalOrderCount(vo);
		
		List<OrderInfoVO> list = service.selectOrderList(vo);
		
		// 2.Client에 넘겨줄 데이터 세팅
		OrderVO ordervo = new OrderVO();
		
		ordervo.setOrderList(list);
		ordervo.setTotal(totalPage); // 총 데이터 수
		ordervo.setStartPage(vo.getStartPage());
		ordervo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return ordervo;
	}
	// 일괄 처리1
	@RequestMapping("/order/updateOrder")
	@ResponseBody
	public int updateOrder(@ModelAttribute ("OrderInfoVO")OrderInfoVO vo)throws Exception{
		
		int cnt = service.updateOrder(vo);
		
		return cnt;
	}
	// 일괄 처리2
	@RequestMapping("/order/updateOrder1")
	@ResponseBody
	public int updateOrder1(@ModelAttribute ("OrderInfoVO")OrderInfoVO vo)throws Exception{
		
		int cnt = service.updateOrder1(vo);
		
		return cnt;
	}
	// 주문 상세조회
	@RequestMapping("/order/getOrderDtl")
	@ResponseBody
	public OrderInfoVO getOrderDtl(@ModelAttribute("OrderInfoVO")OrderInfoVO vo)throws Exception{
		
		vo = service.selectOrderDtl(vo);
		
		List<OrderGoodsVO> list = service.selectOrderGoods(vo);
		
		vo.setOrderGoods(list);
		
		return vo;
	}
	//주문 상태변경
	@RequestMapping("/order/statusUpdate")
	@ResponseBody
	public int statusUpdate(@ModelAttribute("OrderInfoVO")OrderInfoVO vo)throws Exception{
		
		int cnt = service.statusUpdate(vo);
		
		return cnt;
	}
	
	// 대쉬보드 주간 주문정보
	@RequestMapping("/order/getWeekOrder")
	@ResponseBody
	public List<OrderInfoVO> selectWeekOrder(@ModelAttribute OrderInfoVO vo)throws Exception{
		
		List<OrderInfoVO> list = service.selectWeekOrder(vo);
		
		return list;
	}
	
}