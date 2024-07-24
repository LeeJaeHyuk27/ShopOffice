package com.shop.goods.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.CategoryVO;
import com.shop.table.vo.GoodsImgVO;
import com.shop.table.vo.GoodsInfoVO;

@MapperScan(basePackages="com.shop.goods.dao")
public interface GoodsDao {

	// 상품 조회
	public ArrayList<GoodsInfoVO> selectGoodsList(GoodsInfoVO vo)throws Exception;
	
	// 페이징
	public int selectTotalGoodsCount(GoodsInfoVO vo)throws Exception;
	
	// 맥스 넘버 가져오기
	public String selectMaxGoodsCd(GoodsInfoVO vo) throws Exception;
	
	// 상품 상세조회
	public GoodsInfoVO selectGoodsDtl(GoodsInfoVO vo)throws Exception;
	
	// 상품 등록
	public int insertGoods(GoodsInfoVO vo)throws Exception;
	
	// 상품 이미지 등록
	public int insertGoodsImg(GoodsImgVO vo)throws Exception;
	
	// 상품 수정
	public int updateGoods(GoodsInfoVO vo)throws Exception;
	
	// 대분류 리스트
	public List<CategoryVO> selectCtLv1List(GoodsInfoVO vo)throws Exception;
	
	// 중분류 리스트
	public List<CategoryVO> selectCtLv2List(GoodsInfoVO vo)throws Exception;
	
	// 소분류 리스트
	public List<CategoryVO> selectCtLv3List(GoodsInfoVO vo)throws Exception;
	
	// 상품 이름 불러오기
	public GoodsInfoVO selectGoodsName(GoodsInfoVO vo)throws Exception;
}
