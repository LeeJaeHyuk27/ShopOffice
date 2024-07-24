package com.shop.schedule.service;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.shop.schedule.dao.DailyOrderDao;

@Service
public class DailyOrderService {

	@Autowired
	DailyOrderDao dao;	
	/*
	public int insertDailyOrder()throws Exception{
		return dao.insertDailyOrder();
	}
	*/
}
