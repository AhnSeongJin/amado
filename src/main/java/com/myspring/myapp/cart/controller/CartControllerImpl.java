package com.myspring.myapp.cart.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.myspring.myapp.cart.service.CartService;
import com.myspring.myapp.cart.vo.CartVO;
import com.myspring.myapp.common.base.BaseController;
import com.myspring.myapp.member.vo.MemberVO;

@Controller("cartController")
@RequestMapping(value="/cart")
public class CartControllerImpl extends BaseController implements CartController{
	@Autowired
	private CartService cartService;
	@Autowired
	private CartVO cartVO;
	@Autowired
	private MemberVO memberVO;
	
	@Override
	@RequestMapping(value="/cart.do" ,method = RequestMethod.GET)
	public ModelAndView myCartMain(HttpServletRequest request, HttpServletResponse response)  throws Exception {
		String viewName=(String)request.getAttribute("viewName");
		ModelAndView mav = new ModelAndView(viewName);
		HttpSession session=request.getSession();
		if(session.getAttribute("member") == null) return mav; // 로그인 안된 경우 페이지 이동
		
		//로그인 한 경우
		MemberVO memberVO=(MemberVO)session.getAttribute("member");
		System.out.println("CartController: /myCartMain");
		String id=memberVO.getId();
		cartVO.setId(id);
		Map<String ,List> cartMap=cartService.myCartList(cartVO);
		session.setAttribute("cartMap", cartMap);//장바구니 목록 화면에서 상품 주문 시 사용하기 위해서 장바구니 목록을 세션에 저장한다.
		mav.addObject("cartMap", cartMap);
		System.out.println(cartMap);
		return mav;
	}
	
	@Override
	@RequestMapping(value="/addProductInCart.do" ,method = RequestMethod.POST,produces = "application/text; charset=utf8")
	public  @ResponseBody String addProductInCart(@RequestParam("product_code") String product_code, @RequestParam(value="cart_product_qty", required=false, defaultValue = "1") int cart_product_qty,
			                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String id=memberVO.getId();
		System.out.println(memberVO);
		
		cartVO.setId(id);
		//카트 등록전에 이미 등록된 제품인지 판별한다.
		cartVO.setProduct_code(product_code);
		cartVO.setId(id);
		//RequestParam에 required=false로 해서 값이 안넘어 올 경우 defaultValue="1"
		cartVO.setCart_product_qty(cart_product_qty);
		boolean isAreadyExisted=cartService.findCartProduct(cartVO);
		System.out.println("isAreadyExisted:"+isAreadyExisted);
		if(isAreadyExisted==true){ //중복O
			return "already_existed";
		}else{ //중복X
			cartService.addProductInCart(cartVO);
			return "add_success";
		}
	}
	
	@RequestMapping(value="/modifyCartQty.do" ,method = RequestMethod.POST)
	public @ResponseBody String  modifyCartQty(@RequestParam("cart_id") int cart_id,
			                                   @RequestParam("cart_product_qty") int cart_product_qty,
			                                    HttpServletRequest request, HttpServletResponse response)  throws Exception{
		System.out.println("modifyCartQty");
		HttpSession session=request.getSession();
		memberVO=(MemberVO)session.getAttribute("member");
		String id=memberVO.getId();
		cartVO.setCart_id(cart_id);
		cartVO.setId(id);
		cartVO.setCart_product_qty(cart_product_qty);
		boolean result=cartService.modifyCartQty(cartVO);
		
		if(result==true){
		   return "modify_success";
		}else{
			  return "modify_failed";	
		}
		
	}
//	
//	@RequestMapping(value="/removeCartGoods.do" ,method = RequestMethod.POST)
//	public ModelAndView removeCartGoods(@RequestParam("cart_id") int cart_id,
//			                          HttpServletRequest request, HttpServletResponse response)  throws Exception{
//		ModelAndView mav=new ModelAndView();
//		cartService.removeCartGoods(cart_id);
//		mav.setViewName("redirect:/cart/myCartList.do");
//		return mav;
//	}
}
