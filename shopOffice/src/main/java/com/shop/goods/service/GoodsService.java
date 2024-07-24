package com.shop.goods.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goods.dao.GoodsDao;
import com.shop.table.vo.CategoryVO;
import com.shop.table.vo.GoodsImgVO;
import com.shop.table.vo.GoodsInfoVO;

@Service
public class GoodsService {

	@Autowired
	GoodsDao dao;
	
	// 상품 조회
	public ArrayList<GoodsInfoVO> selectGoodsList(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsList(vo);
	}
	// 페이징
	public int selectTotalGoodsCount(GoodsInfoVO vo)throws Exception{
		return dao.selectTotalGoodsCount(vo);
	}
	// 맥스 넘버 가져오기
	public String selectMaxGoodsCd(GoodsInfoVO vo)throws Exception{
		return dao.selectMaxGoodsCd(vo);
	}
	// 상품 상세조회
	public GoodsInfoVO selectGoodsDtl(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsDtl(vo);
	}
	// 상품 등록
	public int insertGoods(GoodsInfoVO vo)throws Exception{
		return dao.insertGoods(vo);
	}
	// 상품 이미지 등록
	public int insertGoodsImg(GoodsImgVO vo)throws Exception{
		return dao.insertGoodsImg(vo);
	}
	// 상품 수정
	public int updateGoods(GoodsInfoVO vo)throws Exception{
		return dao.updateGoods(vo);
	}
	// 대분류 리스트
	public List<CategoryVO> selectCtLv1List(GoodsInfoVO vo)throws Exception{
		return dao.selectCtLv1List(vo);
	}
	// 중분류 리스트
	public List<CategoryVO> selectCtLv2List(GoodsInfoVO vo)throws Exception{
		return dao.selectCtLv2List(vo);
	}
	// 소분류 리스트
	public List<CategoryVO> selectCtLv3List(GoodsInfoVO vo)throws Exception{
		return dao.selectCtLv3List(vo);
	}
	// 상품 이름 불러오기
	public GoodsInfoVO selectGoodsName(GoodsInfoVO vo)throws Exception{
		return dao.selectGoodsName(vo);
	}
}
