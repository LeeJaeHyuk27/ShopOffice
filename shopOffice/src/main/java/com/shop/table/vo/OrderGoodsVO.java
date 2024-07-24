package com.shop.table.vo;


public class OrderGoodsVO extends BaseVO{
	
	private String orderNo; // 주문번호
	private String goodsCd; // 상품코드
	private String unitPrice; // 구매단가
	private String buyQty; // 구매수량
	
	// 조건추가
	private String ctCd;  // 상품카테고리
	private String goodsName; // 상품명
	private String ivQty; // 상품재고
	private String ctName; // 상품명
	
	
	
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getCtCd() {
		return ctCd;
	}
	public void setCtCd(String ctCd) {
		this.ctCd = ctCd;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getIvQty() {
		return ivQty;
	}
	public void setIvQty(String ivQty) {
		this.ivQty = ivQty;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getBuyQty() {
		return buyQty;
	}
	public void setBuyQty(String buyQty) {
		this.buyQty = buyQty;
	}
	
	
	
	
	
}
