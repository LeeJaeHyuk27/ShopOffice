package com.shop.goods.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import com.shop.common.service.FileService;
import com.shop.goods.service.GoodsService;
import com.shop.goods.vo.GoodsVO;
import com.shop.table.vo.FileVO;
import com.shop.table.vo.GoodsImgVO;
import com.shop.table.vo.GoodsInfoVO;

@Controller
public class GoodsController {

	@Autowired
	GoodsService service;
	
	@Autowired
	FileService fileservice;
	
	@RequestMapping("/goods/goods")
	public String goods() throws Exception{
		return "goods/goods";
	}
	// 상품 조회
	@RequestMapping("/goods/getGoodsList")
	@ResponseBody
	public GoodsVO getGoodsList(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo) throws Exception{
		// 1.전체 데이터 개수 조회
		int totalPage = service.selectTotalGoodsCount(vo);
		
		List<GoodsInfoVO> list = service.selectGoodsList(vo);
		
		// 2.Client에 넘겨줄 데이터 세팅
		GoodsVO goodsvo = new GoodsVO();
		
		goodsvo.setGoodsList(list);
		goodsvo.setTotal(totalPage); // 총 데이터 수
		goodsvo.setStartPage(vo.getStartPage());
		goodsvo.setCurrentPage(vo.getCurrentPage()); // 현재 페이지
		
		return goodsvo;
	}
	// 상품 상세조회
	@RequestMapping("/goods/getGoodsDtl")
	@ResponseBody
	public GoodsInfoVO getGoodsDtl(@ModelAttribute("GoodsInfoVO")GoodsInfoVO vo)throws Exception{
		
		vo = service.selectGoodsDtl(vo);
		/*
		//대분류 리스트
		List<CategoryVO> list1 = service.selectCtLv1List(vo);
		vo.setCtLv1List(list1);
		//중분류 리스트
		List<CategoryVO> list2 = service.selectCtLv2List(vo);
		vo.setCtLv2List(list2);
		//소분류 리스트
		List<CategoryVO> list3 = service.selectCtLv3List(vo);
		vo.setCtLv3List(list3);
		*/
		return vo;
	}
	// 상품 등록
	@RequestMapping("/goods/insertGoods")
	@ResponseBody
	public int insertGoods(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo)throws Exception{
		
		vo.setGoodsCd(service.selectMaxGoodsCd(vo));
		
		FileVO filevo = new FileVO();
		filevo.setFile(vo.getThumbnailFile());
		filevo = fileservice.createFile(filevo);
		vo.setThumbnailUrl(filevo.getFilePath());
		
		int cnt = service.insertGoods(vo);
		
		
		List<MultipartFile> filelist = vo.getAtcFileList();
		GoodsImgVO imgvo = new GoodsImgVO();
		imgvo.setGoodsCd(vo.getGoodsCd());
        for(MultipartFile f : filelist) {
        	FileVO f_vo = new FileVO();
        	f_vo.setFile(f);
        	f_vo = fileservice.createFile(f_vo);
        	imgvo.setImgUrl(f_vo.getFilePath());
        	imgvo.setFileName(f_vo.getOrgFileNm());
        	cnt += service.insertGoodsImg(imgvo);
        }
        
		return cnt;
	}
	// 상품 수정
	@RequestMapping("/goods/updateGoods")
	@ResponseBody
	public int updateGoods(@ModelAttribute("GoodsInfoVO") GoodsInfoVO vo)throws Exception{
		
		FileVO filevo = new FileVO();
		filevo.setFile(vo.getThumbnailFile());
		filevo = fileservice.createFile(filevo);
		vo.setThumbnailUrl(filevo.getFilePath());
		
		int cnt = service.updateGoods(vo);
		
		return cnt;
	}
	
	// 상품 이름 불러오기
	@RequestMapping("/goods/getGoodsName")
	@ResponseBody
	public GoodsInfoVO getGoodsName(@ModelAttribute("GoodsInfoVO")GoodsInfoVO vo)throws Exception{
		
		vo = service.selectGoodsName(vo);
		
		return vo;
	}
}
