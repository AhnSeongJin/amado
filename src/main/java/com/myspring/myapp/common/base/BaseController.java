package com.myspring.myapp.common.base;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class BaseController  {
	
	@RequestMapping(value="/*.do" ,method={RequestMethod.POST,RequestMethod.GET})
	public  ModelAndView viewForm(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String viewName = getViewName(request);
		System.out.println("BaseController: "+viewName);
		ModelAndView mav = new ModelAndView();
		mav.setViewName(viewName);
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
			//getViewName()占쎌뱽 占쎌깈�빊�뮉釉� 野껋럩�뒭 fileName.lastIndexOf("/",1)占쎌뱽 占쎄텢占쎌뒠占쎈퉸
			//JSP揶쏉옙 筌욑옙占쎌젟占쎈쭆 占쎈쨨占쎈쐭 占쎌뵠�뵳袁⑸퓠 占쎈퉸占쎈뼣占쎈릭占쎈뮉 筌ｏ옙 甕곕뜆�럮 占쎌뒄筌ｏ옙�겫占쏙옙苑� 揶쏉옙占쎌죬占쎌궔占쎈뼄.
			//ex))	member/listmembers.do嚥∽옙 占쎌뒄筌ｏ옙占쎈막 野껋럩�뒭 member/listMember�몴占� 占쎈솁占쎌뵬 占쎌뵠�뵳袁⑹몵嚥∽옙 揶쏉옙占쎌죬占쎌긾
			viewName = viewName.substring(viewName.lastIndexOf("/", 1), viewName.length());
		}
		return viewName;
	}
		
}
