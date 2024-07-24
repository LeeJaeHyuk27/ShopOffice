package com.shop.user.vo;

import java.util.List;

import com.shop.table.vo.BoardInfoVO;
import com.shop.table.vo.PageVO;

public class BoardVO extends PageVO {

	private List<BoardInfoVO> boardList;

	public List<BoardInfoVO> getBoardList() {
		return boardList;
	}

	public void setBoardList(List<BoardInfoVO> boardList) {
		this.boardList = boardList;
	}
	

	

}
