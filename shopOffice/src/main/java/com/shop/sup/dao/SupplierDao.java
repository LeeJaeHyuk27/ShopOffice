package com.shop.sup.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.SupInfoVO;
import com.shop.table.vo.SupOrderVO;

@MapperScan(basePackages="com.shop.sup.dao")
public interface SupplierDao {

	// 거래처명 조회
	public ArrayList<SupInfoVO> selectSupNameList(SupInfoVO vo)throws Exception;
	
	// 거래처 조회
	public List<SupInfoVO> selectSupList(SupInfoVO vo)throws Exception;
	
	// 페이징(거래처)
	public int selectTotalSupCount(SupInfoVO vo)throws Exception;
	
	// 거래처 수정/등록 띄우기
	public SupInfoVO selectSupDtl(SupInfoVO vo)throws Exception;
	
	// 거래처 수정
	public int updateSupplier(SupInfoVO vo)throws Exception;
	
	// 거래처 등록
	public int insertSupplier(SupInfoVO vo)throws Exception;
	
	// 발주 조회
	public List<SupOrderVO> selectSupOrderList(SupOrderVO vo)throws Exception;
	
	// 페이징(발주)
	public int selectTotalSupOrderCount(SupOrderVO vo)throws Exception;
	
	// 발주 신청
	public int insertSupOrder(SupOrderVO vo)throws Exception;
	
	// 발주 정보 가져오기
	public List<SupOrderVO> selectSupOrderDtl(SupOrderVO vo)throws Exception;
	
	// 대쉬보드 주간 발주정보
	public List<SupOrderVO> selectWeekSupOrder(SupOrderVO vo)throws Exception;
}
