package com.shop.user.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.table.vo.BoardInfoVO;
import com.shop.user.service.BoardService;
import com.shop.user.vo.BoardVO;



@Controller
public class BoardController {

	@Autowired
	BoardService service;
	
	// 회원문의 페이지
	@RequestMapping("/user/board")
	public String board() throws Exception{
		return "user/board";
	}
	// 문의 조회
	@RequestMapping("/user/getBoardList")
	@ResponseBody
	public BoardVO searchList(@ModelAttribute("BoardInfoVO")BoardInfoVO vo) throws Exception{
		
		int totalPage = service.selectTotalBoardCount(vo);
		
		List<BoardInfoVO> list = service.selectBoardList(vo);
		
		BoardVO boardvo = new BoardVO();
		
		boardvo.setBoardList(list);
		boardvo.setTotal(totalPage); // 총 데이터 수
		boardvo.setStartPage(vo.getStartPage());
		boardvo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return boardvo;
	}
	
	// 문의 상세조회
	@RequestMapping("/user/getBoardDtl")
	@ResponseBody
	public BoardInfoVO getBoardDtl(@ModelAttribute ("BoardInfoVO")BoardInfoVO vo) throws Exception {
		
		vo = service.selectBoardDtl(vo);
		
		return vo;
	}
	// 답변 등록하기
	@RequestMapping("/user/reply")
	@ResponseBody
	public int reply(@ModelAttribute("BoardInfoVO")BoardInfoVO vo) throws Exception {
		
		int cnt = service.updateReply(vo);
		
		return cnt;
	}
	
	
}
