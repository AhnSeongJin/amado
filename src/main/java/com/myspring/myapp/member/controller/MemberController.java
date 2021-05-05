package com.myspring.myapp.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.myapp.member.vo.MemberVO;

public interface MemberController {
	// 로그인 폼
	public ModelAndView login(String action, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 회원가입 폼
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 로그인
	public ModelAndView login(Map<String, String> loginMap, HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 로그아웃
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception;
	// 회원 등록
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response) throws Exception;
	
	
	
}