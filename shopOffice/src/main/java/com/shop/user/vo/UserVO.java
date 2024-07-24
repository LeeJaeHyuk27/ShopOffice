package com.shop.user.vo;

import java.util.List;

import com.shop.table.vo.PageVO;
import com.shop.table.vo.UserInfoVO;

public class UserVO extends PageVO {

	private List<UserInfoVO> userList;
	
	public List<UserInfoVO> getUserList() {
		return userList;
	}
	
	public void setUserList(List<UserInfoVO> userList) {
		this.userList = userList;
	}

        

}
