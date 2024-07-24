package com.shop.user.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.table.vo.BoardInfoVO;
import com.shop.user.dao.BoardDao;

@Service
public class BoardService {

	@Autowired
	BoardDao dao;
	// 문의 조회
	public List<BoardInfoVO> selectBoardList(BoardInfoVO vo)throws Exception{
		return dao.selectBoardList(vo);
	}
	// 문의 상세조회
	public BoardInfoVO selectBoardDtl(BoardInfoVO vo) throws Exception{
		return dao.selectBoardDtl(vo);
	}
	// 답변 등록하기
	public int updateReply(BoardInfoVO vo) throws Exception{
		return dao.updateReply(vo);
	}
	// 페이징
	public int selectTotalBoardCount(BoardInfoVO vo)throws Exception{
		return dao.selectTotalBoardCount(vo);
	}
}
