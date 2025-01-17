package com.shop.table.vo;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.fasterxml.jackson.annotation.JsonIgnore;

public class GoodsInfoVO extends PageVO{
	
	private String goodsCd;
	private String ctCd;
	private String goodsName;
	private String normalPrice;
	private String sellPrice;
	private String ivQty;
	private String goodsStatus;
	private String supplierCd;
	private String thumbnailUrl;
	private String content;
	private String regDt;
	
	@JsonIgnore
	private MultipartFile thumbnailFile; // 업로드 파일
	
	@JsonIgnore
	private List<MultipartFile> atcFileList; // 업로드 파일
	
	//조건 추가
	private String ctName;
	private String upCtCd;
	private String imgUrl;
	
	
	//카테고리 리스트
	private List<CategoryVO> CtLv1List;
	private List<CategoryVO> CtLv2List;
	private List<CategoryVO> CtLv3List;

	
	
	


	
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public MultipartFile getThumbnailFile() {
		return thumbnailFile;
	}
	public void setThumbnailFile(MultipartFile thumbnailFile) {
		this.thumbnailFile = thumbnailFile;
	}
	public List<MultipartFile> getAtcFileList() {
		return atcFileList;
	}
	public void setAtcFileList(List<MultipartFile> atcFileList) {
		this.atcFileList = atcFileList;
	}
	public List<CategoryVO> getCtLv1List() {
		return CtLv1List;
	}
	public void setCtLv1List(List<CategoryVO> ctLv1List) {
		CtLv1List = ctLv1List;
	}
	public List<CategoryVO> getCtLv2List() {
		return CtLv2List;
	}
	public void setCtLv2List(List<CategoryVO> ctLv2List) {
		CtLv2List = ctLv2List;
	}
	public List<CategoryVO> getCtLv3List() {
		return CtLv3List;
	}
	public void setCtLv3List(List<CategoryVO> ctLv3List) {
		CtLv3List = ctLv3List;
	}
	public String getUpCtCd() {
		return upCtCd;
	}
	public void setUpCtCd(String upCtCd) {
		this.upCtCd = upCtCd;
	}
	public String getCtName() {
		return ctName;
	}
	public void setCtName(String ctName) {
		this.ctName = ctName;
	}
	public String getGoodsCd() {
		return goodsCd;
	}
	public void setGoodsCd(String goodsCd) {
		this.goodsCd = goodsCd;
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
	public String getNormalPrice() {
		return normalPrice;
	}
	public void setNormalPrice(String normalPrice) {
		this.normalPrice = normalPrice;
	}
	public String getSellPrice() {
		return sellPrice;
	}
	public void setSellPrice(String sellPrice) {
		this.sellPrice = sellPrice;
	}
	public String getIvQty() {
		return ivQty;
	}
	public void setIvQty(String ivQty) {
		this.ivQty = ivQty;
	}
	public String getGoodsStatus() {
		return goodsStatus;
	}
	public void setGoodsStatus(String goodsStatus) {
		this.goodsStatus = goodsStatus;
	}
	public String getSupplierCd() {
		return supplierCd;
	}
	public void setSupplierCd(String supplierCd) {
		this.supplierCd = supplierCd;
	}
	public String getThumbnailUrl() {
		return thumbnailUrl;
	}
	public void setThumbnailUrl(String thumbnailUrl) {
		this.thumbnailUrl = thumbnailUrl;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getRegDt() {
		return regDt;
	}
	public void setRegDt(String regDt) {
		this.regDt = regDt;
	}

	
}
