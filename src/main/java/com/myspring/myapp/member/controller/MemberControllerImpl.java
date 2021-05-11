package com.myspring.myapp.member.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.myapp.member.service.MemberService;
import com.myspring.myapp.member.vo.MemberVO;

@Controller("memberController")
@RequestMapping(value="/member")
public class MemberControllerImpl implements MemberController {
	private static final Logger logger = LoggerFactory.getLogger(MemberControllerImpl.class);
	@Autowired
	private MemberService memberService;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/login.do", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value= "action", required=false) String action, HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		
		//login 메소드에서 로그인후 action값 사용하기 위해
		HttpSession session = request.getSession();
		session.setAttribute("action", action);
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/login.do" ,method = RequestMethod.POST)
	public ModelAndView login(@RequestParam Map<String, String> loginMap,
			                  HttpServletRequest request, HttpServletResponse response) throws Exception {
		ModelAndView mav = new ModelAndView();
		//System.out.println("view에서 넘어온값:"+loginMap);
		memberVO = memberService.login(loginMap);
		if(memberVO!= null && memberVO.getId()!=null){
			HttpSession session=request.getSession();
			session=request.getSession();
			session.setAttribute("isLogOn", true);
			session.setAttribute("member", memberVO);
			
			//action값이 같이 넘어올 경우 로그인 완료후 action에 저장된 위치로 이동
			String action=(String)session.getAttribute("action");
			System.out.println("action값: "+action);
			if(action!=null){
				mav.setViewName("redirect:"+action);
			}else{
				mav.setViewName("redirect:/index.do");	
			}
							
		}else{
			String message="아이디나  비밀번호가 틀립니다. 다시 로그인해주세요";
			mav.addObject("message", message);
			mav.setViewName("/member/login");
		}
		return mav;
	}
	
	@Override
	@RequestMapping(value = "/logout.do", method =  RequestMethod.GET)
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		session.removeAttribute("member");
		session.removeAttribute("isLogOn");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("redirect:/index.do");
		return mav;
	}
	
	@Override
	@RequestMapping(value="/register.do", method = RequestMethod.GET)
	public ModelAndView register(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		System.out.println("MemberController: "+viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addMember.do", method = RequestMethod.POST)
	public ModelAndView addMember(@ModelAttribute("member") MemberVO memberVO, HttpServletRequest request, HttpServletResponse response)
			throws Exception {
		request.setCharacterEncoding("utf-8");
		response.setContentType("html/text; charset=utf-8");
		int result = 0;
		result = memberService.addMember(memberVO);
		ModelAndView mav = new ModelAndView("redirect:/member/login.do");
		return mav;
	}
	
	
	
	
	
	
	private String getViewName(HttpServletRequest request) throws Exception {
		String contextPath = request.getContextPath();
		String uri = (String) request.getAttribute("javax.servlet.include.request_uri");
		if (uri == null || uri.trim().equals("")) {
			uri = request.getRequestURI();
		}

		int begin = 0;
		if (!((contextPath == null) || ("".equals(contextPath)))) {
			begin = contextPath.length();
		}

		int end;
		if (uri.indexOf(";") != -1) {
			end = uri.indexOf(";");
		} else if (uri.indexOf("?") != -1) {
			end = uri.indexOf("?");
		} else {
			end = uri.length();
		}

		String viewName = uri.substring(begin, end);
		if (viewName.indexOf(".") != -1) {
			viewName = viewName.substring(0, viewName.lastIndexOf("."));
		}
		if (viewName.lastIndexOf("/") != -1) {
			//getViewName()�쓣 �샇異쒗븷 寃쎌슦 fileName.lastIndexOf("/",1)�쓣 �궗�슜�빐
			//JSP媛� 吏��젙�맂 �뤃�뜑 �씠由꾩뿉 �빐�떦�븯�뒗 泥� 踰덉㎏ �슂泥�遺��꽣 媛��졇�삩�떎.
			//ex))	member/listmembers.do濡� �슂泥��븷 寃쎌슦 member/listMember瑜� �뙆�씪 �씠由꾩쑝濡� 媛��졇�샂
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}


}
