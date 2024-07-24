package com.shop.table.vo;

import java.util.List;

public class UserInfoVO extends PageVO{
	
	private String userId;		//회원ID	
	private String userName;	//회원명
	private String phone;		//연락처
	private String email;		//이메일
	private String addr;		//주소
	private String addrDtl;		//주소
	private String withDrawYn;		//탈퇴여부
	private String withDrawDt;		//탈퇴일
	private String joinDt;  //가입일
	
	//조건추가
	private String joinDtFrom;
	private String joinDtTo;
	
	//주문내역
	private List<OrderInfoVO> orderlist;
	
	//
	private String orderCnt;  //총주문횟수
	private String orderPrice;  //총주문금액
	
	

	public String getOrderCnt() {
		return orderCnt;
	}
	public void setOrderCnt(String orderCnt) {
		this.orderCnt = orderCnt;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public List<OrderInfoVO> getOrderlist() {
		return orderlist;
	}
	public void setOrderlist(List<OrderInfoVO> orderlist) {
		this.orderlist = orderlist;
	}
	public String getJoinDtFrom() {
		return joinDtFrom;
	}
	public void setJoinDtFrom(String joinDtFrom) {
		this.joinDtFrom = joinDtFrom;
	}
	public String getJoinDtTo() {
		return joinDtTo;
	}
	public void setJoinDtTo(String joinDtTo) {
		this.joinDtTo = joinDtTo;
	}

	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDtl() {
		return addrDtl;
	}
	public void setAddrDtl(String addrDtl) {
		this.addrDtl = addrDtl;
	}
	public String getWithDrawYn() {
		return withDrawYn;
	}
	public void setWithDrawYn(String withDrawYn) {
		this.withDrawYn = withDrawYn;
	}
	public String getWithDrawDt() {
		return withDrawDt;
	}
	public void setWithDrawDt(String withDrawDt) {
		this.withDrawDt = withDrawDt;
	}
	public String getJoinDt() {
		return joinDt;
	}
	public void setJoinDt(String joinDt) {
		this.joinDt = joinDt;
	}
	
	
	
	
}
