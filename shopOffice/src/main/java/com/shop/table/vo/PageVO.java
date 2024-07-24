package com.shop.table.vo;

public class PageVO {
	private int total; //전체 게시물 수
	private int countPerPage=5; //페이지 당 출력되는 게시물 수
	private int currentPage=1; //현재 페이지
	private int startPage; //시작 페이지
	private int endPage; //마지막 페이지
	
	public int getTotal() {
		return total;
	}
	public void setTotal(int total) {
		this.total = total;
	}
	public int getCountPerPage() {
		return countPerPage;
	}
	public void setCountPerPage(int countPerPage) {
		this.countPerPage = countPerPage;
	}
	public int getCurrentPage() {
		return currentPage;
	}
	public void setCurrentPage(int currentPage) {
		this.currentPage = currentPage;
	}
	public int getStartPage() {
		return currentPage/countPerPage+1; //페이지의 시작 페이지 계산
	}
	public void setStartPage(int startPage) {
		this.startPage = startPage;
	}
	public int getEndPage() {
		return total/countPerPage+1; // 페이징의 종료 페이지 계산
	}
	public void setEndPage(int endPage) {
		this.endPage = endPage;
	}

	



        

}
