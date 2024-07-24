package com.shop.goods.controller;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.shop.goods.service.CategoryService;
import com.shop.table.vo.CategoryVO;

@Controller
public class CategoryController {

	@Autowired
	CategoryService service;
	
	@RequestMapping("/goods/category")
	public  String category() throws Exception{
		return "goods/category";
	}
	// Level1 코드 불러오기
	@RequestMapping("/goods/getLevel1List")
	@ResponseBody
	public ArrayList<CategoryVO> getLevel1List(@ModelAttribute CategoryVO vo) throws Exception{
		
		ArrayList<CategoryVO> list = service.getLevel1List(vo);
		
		return list;
	}
	// Level2 코드 불러오기
	@RequestMapping("/goods/getLevel2List")
	@ResponseBody
	public ArrayList<CategoryVO> getLevel2List(@ModelAttribute CategoryVO vo) throws Exception{
		
		ArrayList<CategoryVO> list = service.getLevel2List(vo);
		
		return list;
	}
	// Level3 코드 불러오기
	@RequestMapping("/goods/getLevel3List")
	@ResponseBody
	public ArrayList<CategoryVO> getLevel3List(@ModelAttribute CategoryVO vo) throws Exception{
		
		ArrayList<CategoryVO> list = service.getLevel3List(vo);
		
		return list;
	}
	// 카테고리 선택
	@RequestMapping("/goods/getCategory")
	@ResponseBody
	public ArrayList<CategoryVO> getCategory(@ModelAttribute CategoryVO vo) throws Exception{
		
		ArrayList<CategoryVO> list = service.getCategory(vo);
		
		return list;
	}
	
	// 카테고리 이름 불러오기
	@RequestMapping("/goods/getName")
	@ResponseBody
	public CategoryVO getName(@ModelAttribute("CategoryVO")CategoryVO vo)throws Exception{
		
		vo = service.getName(vo);
		
		return vo;
	}
	// 카테고리 이름 변경
	@RequestMapping("/goods/updateCtName")
	@ResponseBody
	public int updateCtName(@ModelAttribute("CategoryVO")CategoryVO vo)throws Exception{
		
		int cnt = service.updateCtName(vo);
		
		return cnt;
	}
	// 카테고리 추가
	@RequestMapping("/goods/insertCt")
	@ResponseBody
	public int insertCt(@ModelAttribute("CategoryVO")CategoryVO vo) throws Exception{
	
		int cnt = service.insertCt(vo);
		
		return cnt;
	}
}
