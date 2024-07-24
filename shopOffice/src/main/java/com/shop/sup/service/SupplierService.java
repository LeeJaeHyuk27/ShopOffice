package com.shop.sup.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.sup.dao.SupplierDao;
import com.shop.table.vo.SupInfoVO;
import com.shop.table.vo.SupOrderVO;

@Service
public class SupplierService {

	@Autowired
	SupplierDao dao;
	
	// 거래처명 조회
	public ArrayList<SupInfoVO> selectSupNameList(SupInfoVO vo)throws Exception{
		return dao.selectSupNameList(vo);
	}
	
	// 거래처 조회
	public List<SupInfoVO> selectSupList(SupInfoVO vo)throws Exception{
		return dao.selectSupList(vo);
	}
	
	// 페이징(거래처)
	public int selectTotalSupCount(SupInfoVO vo)throws Exception{
		return dao.selectTotalSupCount(vo);
	}
	// 거래처 수정/등록 띄우기
	public SupInfoVO selectSupDtl(SupInfoVO vo)throws Exception{
		return dao.selectSupDtl(vo);
	}
	
	// 거래처 수정
	public int updateSupplier(SupInfoVO vo)throws Exception{
		return dao.updateSupplier(vo);
	}

	// 거래처 등록
	public int insertSupplier(SupInfoVO vo)throws Exception{
		return dao.insertSupplier(vo);
	}
	
	// 발주 조회
	public List<SupOrderVO> selectSupOrderList(SupOrderVO vo)throws Exception{
		return dao.selectSupOrderList(vo);
	}
	
	// 페이징(발주)
	public int selectTotalSupOrderCount(SupOrderVO vo)throws Exception{
		return dao.selectTotalSupOrderCount(vo);
	}
	
	// 발주 신청
	public int insertSupOrder(SupOrderVO vo)throws Exception{
		return dao.insertSupOrder(vo);
	}
	
	// 발주 정보 가져오기
	public List<SupOrderVO> selectSupOrderDtl(SupOrderVO vo)throws Exception{
		return dao.selectSupOrderDtl(vo);
	}
	
	// 대쉬보드 주간 발주정보
	public List<SupOrderVO> selectWeekSupOrder(SupOrderVO vo)throws Exception{
		return dao.selectWeekSupOrder(vo);
	}
}
