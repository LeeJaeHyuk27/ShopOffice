package com.shop.user.dao;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;
import com.shop.table.vo.UserInfoVO;
import com.shop.table.vo.OrderInfoVO;

@MapperScan(basePackages="com.shop.user.dao")
public interface UserDao {
	
	// 회원 조회하기
	public List<UserInfoVO> selectUserList(UserInfoVO vo) throws Exception;

	// 회원 상세조회
	public UserInfoVO selectUserDetail(UserInfoVO vo) throws Exception;
	
	// 회원 상세조회(주문내역)
	public List<OrderInfoVO> selectOrderList(UserInfoVO vo) throws Exception;
	
	// 페이징
	public int selectTotalUserCount(UserInfoVO vo)throws Exception;
	

}
