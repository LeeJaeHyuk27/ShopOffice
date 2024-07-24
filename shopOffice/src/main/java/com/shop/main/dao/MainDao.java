package com.shop.main.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.MainVO;

@MapperScan(basePackages = "com.shop.main.dao")
public interface MainDao {

	// 대쉬보드 회원 불러오기
	public MainVO dashboardInfo(MainVO vo) throws Exception;
	
	// 대쉬보드 매출차트
	public List<MainVO> salesChart(MainVO vo)throws Exception;
	
	// 대쉬보드 주문차트
	public List<MainVO> orderChart(MainVO vo)throws Exception;
}
