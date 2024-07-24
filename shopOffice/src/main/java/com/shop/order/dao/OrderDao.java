package com.shop.order.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.OrderGoodsVO;
import com.shop.table.vo.OrderInfoVO;

@MapperScan(basePackages="com.shop.order.dao")
public interface OrderDao {
	

	// 주문 조회
	public ArrayList<OrderInfoVO> selectOrderList(OrderInfoVO vo)throws Exception;
	
	// 페이징
	public int selectTotalOrderCount(OrderInfoVO vo)throws Exception;
	
	// 일괄 처리1
	public int updateOrder(OrderInfoVO vo)throws Exception;
	
	// 일괄 처리2
	public int updateOrder1(OrderInfoVO vo)throws Exception;
	
	// 주문 상세조회
	public OrderInfoVO selectOrderDtl(OrderInfoVO vo)throws Exception;
	
	// 주문 상세조회(주문상품내역)
	public List<OrderGoodsVO> selectOrderGoods(OrderInfoVO vo)throws Exception;
	
	// 주문 상태변경
	public int statusUpdate(OrderInfoVO vo)throws Exception;
	
	// 대쉬보드 주간 주문정보
	public List<OrderInfoVO> selectWeekOrder(OrderInfoVO vo)throws Exception;
}
