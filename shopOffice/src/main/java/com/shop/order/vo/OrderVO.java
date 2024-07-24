package com.shop.order.vo;

import java.util.List;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.PageVO;

public class OrderVO extends PageVO {

	private List<OrderInfoVO> orderList;

	public List<OrderInfoVO> getOrderList() {
		return orderList;
	}

	public void setOrderList(List<OrderInfoVO> orderList) {
		this.orderList = orderList;
	}
	

        

}
