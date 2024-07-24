package com.shop.system.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.system.dao.ManageDao;
import com.shop.table.vo.ManagerInfoVO;


@Service
public class ManageService {

	@Autowired
	ManageDao dao;
	
	// 매니저 조회
	public List<ManagerInfoVO> selectManagerList(ManagerInfoVO vo)throws Exception{
		return dao.selectManagerList(vo);
	}
	
	// 페이징
	public int selectTotalManagerCount(ManagerInfoVO vo)throws Exception{
		return dao.selectTotalManagerCount(vo);
	}
	
	// 모달창 띄우기
	public ManagerInfoVO selectManagerDtl(ManagerInfoVO vo)throws Exception{
		return dao.selectManagerDtl(vo);
	}
	
	// 관리자 수정
	public int saveManager(ManagerInfoVO vo)throws Exception{
		return dao.saveManager(vo);
	}
	
}
