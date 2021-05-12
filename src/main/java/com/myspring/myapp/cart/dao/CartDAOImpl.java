package com.myspring.myapp.cart.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.myapp.cart.vo.CartVO;
import com.myspring.myapp.product.vo.ProductVO;


@Repository("cartDAO")
public class CartDAOImpl  implements  CartDAO{
	@Autowired
	private SqlSession sqlSession;
	
	public List<CartVO> selectCartList(CartVO cartVO) throws DataAccessException {
		List<CartVO> cartList =(List)sqlSession.selectList("mapper.cart.selectCartList",cartVO);
		return cartList;
	}
	public List<ProductVO> selectProductList(String id) throws DataAccessException {
		List<ProductVO> myProductList;
		System.out.println("dao/selectProductList: "+id);
		myProductList = sqlSession.selectList("mapper.cart.selectProductList",id);
		return myProductList;
	}
	
	public boolean selectCountInCart(CartVO cartVO) throws DataAccessException {
		String  result =sqlSession.selectOne("mapper.cart.selectCountInCart",cartVO);
		return Boolean.parseBoolean(result);
	}

	public void insertProductInCart(CartVO cartVO) throws DataAccessException{
		int cart_id=selectMaxCartId();
		cartVO.setCart_id(cart_id);
		sqlSession.insert("mapper.cart.insertProductInCart",cartVO);
	}
	
	public void updateCartProductQty(CartVO cartVO) throws DataAccessException{
		sqlSession.insert("mapper.cart.updateCartProductQty",cartVO);
	}

	// 카트아이디(번호) 생성
	private int selectMaxCartId() throws DataAccessException{
		int cart_id =sqlSession.selectOne("mapper.cart.selectMaxCartId");
		return cart_id;
	}
	
	@Override
	public void deleteProductInCart(CartVO cartVO) throws DataAccessException {
		sqlSession.delete("mapper.cart.deleteProductInCart", cartVO);
		
	}

}
