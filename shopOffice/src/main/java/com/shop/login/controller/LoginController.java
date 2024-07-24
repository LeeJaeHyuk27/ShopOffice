package com.shop.login.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;


import com.shop.login.service.LoginService;
import com.shop.login.vo.MessageVO;
import com.shop.table.vo.ManagerInfoVO;
import com.shop.table.vo.UserInfoVO;
import com.shop.util.AesUtil;

@Controller
public class LoginController {

	@Autowired
	LoginService service;
	
	@RequestMapping("/login")
	public String login() throws Exception {
		return "login";
	}
	
	@RequestMapping("loginProcess")
	@ResponseBody
	public MessageVO loginProcess(@ModelAttribute ManagerInfoVO vo, HttpServletRequest request) throws Exception{
		
		MessageVO msgvo = new MessageVO();
		
		String pwd = AesUtil.aesEncode(vo.getManagePwd());
		vo = service.selectUserInfo(vo);
		
		if(vo!=null) {	//등록 아이디일 경우
			if(vo.getManagePwd().equals(pwd)) {  //동일한 패스워드일 경우.
				//세션저장
				HttpSession session = request.getSession();
				 session.setAttribute("MallUser", vo);
				msgvo.setResult(true);
				
			}else {	//패스워드가 동일하지 않을 경우
				msgvo.setResult(false);
				msgvo.setMsg("패스워드가 일치하지 않습니다.");
			}
		}else {  //등록 아이디가 아닐경우
			msgvo.setResult(false);
			msgvo.setMsg("미등록 회원아이디 입니다.");
		}
		return msgvo;
	}
}
