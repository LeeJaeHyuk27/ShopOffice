package com.shop.order.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.order.dao.OrderDao;
import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.OrderInfoVO;

@Service
public class OrderService {

	@Autowired
	OrderDao dao;
	
	// 주문 조회
	public ArrayList<OrderInfoVO> selectOrderList(OrderInfoVO vo)throws Exception{
		return dao.selectOrderList(vo);
	}
	// 페이징
	public int selectTotalOrderCount(OrderInfoVO vo)throws Exception{
		return dao.selectTotalOrderCount(vo);
	}
	// 일괄 처리1
	public int updateOrder(OrderInfoVO vo)throws Exception{
		return dao.updateOrder(vo);
	}
	// 일괄 처리2
	public int updateOrder1(OrderInfoVO vo)throws Exception{
		return dao.updateOrder1(vo);
	}
	// 주문 상세조회
	public OrderInfoVO selectOrderDtl(OrderInfoVO vo)throws Exception{
		return dao.selectOrderDtl(vo);
	}
	// 주문 상세조회(주문상품내역)
	public List<OrderGoodsVO> selectOrderGoods(OrderInfoVO vo)throws Exception{
		return dao.selectOrderGoods(vo);
	}
	// 주문 상태변경
	public int statusUpdate(OrderInfoVO vo)throws Exception{
		return dao.statusUpdate(vo);
	}
	// 대쉬보드 주간 주문정보
	public List<OrderInfoVO> selectWeekOrder(OrderInfoVO vo)throws Exception{
		return dao.selectWeekOrder(vo);
	}
}
