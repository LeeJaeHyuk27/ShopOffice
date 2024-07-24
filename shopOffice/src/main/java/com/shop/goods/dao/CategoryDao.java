package com.shop.goods.dao;

import java.util.ArrayList;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.CategoryVO;

@MapperScan(basePackages="com.shop.goods.dao")
public interface CategoryDao {

	// Level1 코드 불러오기
	public ArrayList<CategoryVO> getLevel1List(CategoryVO vo) throws Exception;
	
	// Level2 코드 불러오기
	public ArrayList<CategoryVO> getLevel2List(CategoryVO vo) throws Exception;
	
	// Level3 코드 불러오기
	public ArrayList<CategoryVO> getLevel3List(CategoryVO vo) throws Exception;
	
	// 카테고리 선택
	public ArrayList<CategoryVO> getCategory(CategoryVO vo) throws Exception;
	
	// 카테고리 이름 불러오기
	public CategoryVO getName(CategoryVO vo)throws Exception;
	
	// 카테고리 이름 변경
	public int updateCtName(CategoryVO vo)throws Exception;
	
	// 카테고리 추가
	public int insertCt(CategoryVO vo)throws Exception;
}
