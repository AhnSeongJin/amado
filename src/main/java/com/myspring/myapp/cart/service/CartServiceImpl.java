package com.myspring.myapp.cart.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.myspring.myapp.cart.dao.CartDAO;
import com.myspring.myapp.cart.vo.CartVO;
import com.myspring.myapp.product.vo.ProductVO;



@Service("cartService")
@Transactional(propagation=Propagation.REQUIRED)
public class CartServiceImpl  implements CartService{
	@Autowired
	private CartDAO cartDAO;
	
	public Map<String ,List> myCartList(CartVO cartVO) throws Exception{
		Map<String,List> cartMap=new HashMap<String,List>();
		List<CartVO> myCartList=cartDAO.selectCartList(cartVO);
		System.out.println("service/selectCartList 성공");
		if(myCartList.size()==0){ //카트에 저장된 상품이없는 경우
			return null;
		}
		List<ProductVO> myProductList=cartDAO.selectProductList(cartVO.getId());
		cartMap.put("myCartList", myCartList);
		cartMap.put("myProductList",myProductList);
		return cartMap;
	}
	
	public boolean findCartProduct(CartVO cartVO) throws Exception{
		 return cartDAO.selectCountInCart(cartVO);
	}	
	
	public void addProductInCart(CartVO cartVO) throws Exception{
		cartDAO.insertProductInCart(cartVO);
	}
	
	public boolean modifyCartQty(CartVO cartVO) throws Exception{
		boolean result=true;
		cartDAO.updateCartProductQty(cartVO);
		return result;
	}

	@Override
	public void deleteProductInCart(CartVO cartVO) throws Exception {
		cartDAO.deleteProductInCart(cartVO);
	}
	
//	public void removeCartGoods(int cart_id) throws Exception{
//		cartDAO.deleteCartGoods(cart_id);
//	}
	
}
