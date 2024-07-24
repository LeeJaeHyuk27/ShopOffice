package com.shop.user.service;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shop.user.dao.UserDao;
import com.shop.table.vo.UserInfoVO;
import com.shop.table.vo.OrderInfoVO;

@Service
public class UserService {

	@Autowired
	UserDao dao;
	
	// 회원 조회하기
	public List<UserInfoVO> selectUserList(UserInfoVO vo) throws Exception{
		return dao.selectUserList(vo);
	}
	// 회원 상세조회
	public UserInfoVO selectUserDetail(UserInfoVO vo) throws Exception{
		return dao.selectUserDetail(vo);
	}
	// 회원 상세조회(주문내역)
	public List<OrderInfoVO> selectOrderList(UserInfoVO vo) throws Exception{
		return dao.selectOrderList(vo);
	}
	// 페이징
	public int selectTotalUserCount(UserInfoVO vo)throws Exception{
		return dao.selectTotalUserCount(vo);
	}

}
