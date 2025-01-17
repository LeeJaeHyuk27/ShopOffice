package com.shop.user.dao;

import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.BoardInfoVO;

@MapperScan(basePackages="com.shop.user.dao")
public interface BoardDao {
	
	// 문의 조회
	public List<BoardInfoVO> selectBoardList(BoardInfoVO vo)throws Exception;

	// 문의 상세조회
	public BoardInfoVO selectBoardDtl(BoardInfoVO vo) throws Exception;
	
	// 답변 등록하기
	public int updateReply(BoardInfoVO vo)throws Exception;
	
	// 페이징
	public int selectTotalBoardCount(BoardInfoVO vo)throws Exception;
}
