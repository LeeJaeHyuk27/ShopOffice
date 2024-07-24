package com.shop.table.vo;


public class SupOrderVO extends PageVO{
	
	private String orderNo;	//
	private String supplierNo;
	private String orderPrice;
	private String orderStatus;
	private String incomeDt;
	private String regDt;
	
	// 조건추가
	private String supplierCd;
	private String supplierName;
	private String goodsCd;
	private String goodsName;
	private String buyQty;
	private String unitPrice;
	private String incomeDtFrom;
	private String incomeDtTo;
	
	
	public String getIncomeDtFrom() {
		return incomeDtFrom;
	}
	public void setIncomeDtFrom(String incomeDtFrom) {
		this.incomeDtFrom = incomeDtFrom;
	}
	public String getIncomeDtTo() {
		return incomeDtTo;
	}
	public void setIncomeDtTo(String incomeDtTo) {
		this.incomeDtTo = incomeDtTo;
	}
	public String getSupplierCd() {
		return supplierCd;
	}
	public void setSupplierCd(String supplierCd) {
		this.supplierCd = supplierCd;
	}
	public String getSupplierName() {
		return supplierName;
	}
	public void setSupplierName(String supplierName) {
		this.supplierName = supplierName;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
	}
	public String getGoodsName() {
		return goodsName;
	}
	public void setGoodsName(String goodsName) {
		this.goodsName = goodsName;
	}
	public String getBuyQty() {
		return buyQty;
	}
	public void setBuyQty(String buyQty) {
		this.buyQty = buyQty;
	}
	public String getUnitPrice() {
		return unitPrice;
	}
	public void setUnitPrice(String unitPrice) {
		this.unitPrice = unitPrice;
	}
	public String getOrderNo() {
		return orderNo;
	}
	public void setOrderNo(String orderNo) {
		this.orderNo = orderNo;
	}
	public String getSupplierNo() {
		return supplierNo;
	}
	public void setSupplierNo(String supplierNo) {
		this.supplierNo = supplierNo;
	}
	public String getOrderPrice() {
		return orderPrice;
	}
	public void setOrderPrice(String orderPrice) {
		this.orderPrice = orderPrice;
	}
	public String getOrderStatus() {
		return orderStatus;
	}
	public void setOrderStatus(String orderStatus) {
		this.orderStatus = orderStatus;
	}
	public String getIncomeDt() {
		return incomeDt;
	}
	public void setIncomeDt(String incomeDt) {
		this.incomeDt = incomeDt;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}
	
	
}
