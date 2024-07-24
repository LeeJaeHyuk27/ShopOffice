package com.shop.login.dao;

import org.mybatis.spring.annotation.MapperScan;

import com.shop.table.vo.ManagerInfoVO;

@MapperScan(basePackages="com.shop.login.dao")
public interface LoginDao {

	public ManagerInfoVO selectUserInfo(ManagerInfoVO vo) throws Exception;
}
