package com.shop.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.main.dao.MainDao;
import com.shop.table.vo.MainVO;

@Service
public class MainService {
	
	@Autowired
	MainDao dao;
	
	// 대쉬보드 정보 불러오기
	public MainVO dashboardInfo(MainVO vo) throws Exception{
		return dao.dashboardInfo(vo);
	}
	// 대쉬보드 매출 차트 불러오기
	public List<MainVO> salesChart(MainVO vo)throws Exception{
		return dao.salesChart(vo);
	}
	// 대쉬보드 주문 차트 불러오기
	public List<MainVO> orderChart(MainVO vo)throws Exception{
		return dao.orderChart(vo);
	}
}
