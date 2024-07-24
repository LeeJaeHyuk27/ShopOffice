package com.shop.goods.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.shop.goods.dao.CategoryDao;
import com.shop.table.vo.CategoryVO;

@Service
public class CategoryService {

	@Autowired
	CategoryDao dao;
	// Level1 코드 불러오기
	public ArrayList<CategoryVO> getLevel1List(CategoryVO vo) throws Exception{
		return dao.getLevel1List(vo);
	}
	// Level2 코드 불러오기
	public ArrayList<CategoryVO> getLevel2List(CategoryVO vo) throws Exception{
		return dao.getLevel2List(vo);
	}
	// Level3 코드 불러오기
	public ArrayList<CategoryVO> getLevel3List(CategoryVO vo) throws Exception{
		return dao.getLevel3List(vo);
	}
	// 카테고리 선택
	public ArrayList<CategoryVO> getCategory(CategoryVO vo) throws Exception{
		return dao.getCategory(vo);
	}
	// 카테고리 이름 불러오기
	public CategoryVO getName(CategoryVO vo)throws Exception{
		return dao.getName(vo);
	}
	// 카테고리 이름 변경
	public int updateCtName(CategoryVO vo)throws Exception{
		return dao.updateCtName(vo);
	}
	// 카테고리 추가
	public int insertCt(CategoryVO vo)throws Exception{
		return dao.insertCt(vo);
	}
}
