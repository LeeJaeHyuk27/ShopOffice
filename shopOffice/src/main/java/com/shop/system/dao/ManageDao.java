package com.shop.system.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.ManagerInfoVO;

@MapperScan(basePackages="com.shop.system.dao")
public interface ManageDao {

	// 매니저 조회
	public List<ManagerInfoVO> selectManagerList(ManagerInfoVO vo)throws Exception;
	
	// 페이징
	public int selectTotalManagerCount(ManagerInfoVO vo)throws Exception;
	
	// 모달창 띄우기
	public ManagerInfoVO selectManagerDtl(ManagerInfoVO vo)throws Exception;
	
	// 관리자 수정
	public int saveManager(ManagerInfoVO vo)throws Exception;
	
}
