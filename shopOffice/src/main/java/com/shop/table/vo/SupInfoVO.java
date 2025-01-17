package com.shop.table.vo;


public class SupInfoVO extends PageVO{
	
	private String supplierCd;	//
	private String supplierName;
	private String supplierCeo;
	private String phone;
	private String opName;
	private String opPhone;
	private String opEmail;
	private String supplierStatus;
	private String regDt;
	
	// 조건추가
	private String email;
	
	
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
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
	public String getSupplierCeo() {
		return supplierCeo;
	}
	public void setSupplierCeo(String supplierCeo) {
		this.supplierCeo = supplierCeo;
	}
	public String getPhone() {
		return phone;
	}
	public void setPhone(String phone) {
		this.phone = phone;
	}
	public String getOpName() {
		return opName;
	}
	public void setOpName(String opName) {
		this.opName = opName;
	}
	public String getOpPhone() {
		return opPhone;
	}
	public void setOpPhone(String opPhone) {
		this.opPhone = opPhone;
	}
	public String getOpEmail() {
		return opEmail;
	}
	public void setOpEmail(String opEmail) {
		this.opEmail = opEmail;
	}
	public String getSupplierStatus() {
		return supplierStatus;
	}
	public void setSupplierStatus(String supplierStatus) {
		this.supplierStatus = supplierStatus;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	

}
