package com.shop.goods.vo;

import java.util.List;

import com.shop.table.vo.GoodsInfoVO;
import com.shop.table.vo.PageVO;

public class GoodsVO extends PageVO {

	private List<GoodsInfoVO> goodsList;

	public List<GoodsInfoVO> getGoodsList() {
		return goodsList;
	}

	public void setGoodsList(List<GoodsInfoVO> goodsList) {
		this.goodsList = goodsList;
	}


	

        

}
