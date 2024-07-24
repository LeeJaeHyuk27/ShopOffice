package com.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.table.vo.OrderInfoVO;
import com.shop.table.vo.UserInfoVO;
import com.shop.user.service.UserService;
import com.shop.user.vo.UserVO;

@Controller

public class UserController {

	//svn테스트
	@Autowired
	UserService service;
	
	@RequestMapping("/user/list")
	public String list() throws Exception {
		return "user/list";
	}
	
	// 회원 조회하기
	/*@RequestMapping("/user/getlist")
	@ResponseBody
	public ArrayList<UserInfoVO> getUserList(@ModelAttribute UserInfoVO vo) throws Exception  {
		
		ArrayList<UserInfoVO> list = service.selectUserList(vo);
		
		return list;
	}
	*/
	// 회원 상세조회
	@RequestMapping("/user/memberDetail")
	@ResponseBody
	public UserInfoVO getUserDetail(@ModelAttribute ("UserInfoVO") UserInfoVO vo) throws Exception  {
		
		vo = service.selectUserDetail(vo);
		
		List<OrderInfoVO> list = service.selectOrderList(vo);
		
		vo.setOrderlist(list);
		
		return vo;
	}
	// 페이징 처리
	@RequestMapping("/user/getList")
	@ResponseBody
	public UserVO searchList(@ModelAttribute("UserInfoVO")UserInfoVO vo)throws Exception{
		// 1.전체 데이터 개수를 조회
		int totalPage = service.selectTotalUserCount(vo);
		
		List<UserInfoVO> list = service.selectUserList(vo);
		
		// 2.Client에 넘겨줄 데이터 세팅
		UserVO uservo = new UserVO();
		
		uservo.setUserList(list);
		uservo.setTotal(totalPage); // 총 데이터 수
		uservo.setStartPage(vo.getStartPage());
		uservo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return uservo;
	}
	
}
