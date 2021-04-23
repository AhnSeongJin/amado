package com.myspring.myapp.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.myapp.product.vo.ProductVO;

@Repository("boardDAO")
public class ProductDAOImpl implements ProductDAO {
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<ProductVO> selectProductList() throws DataAccessException {
		List<ProductVO> productList = sqlSession.selectList("mapper.product.selectAllProduct");
		return productList;
	}

	@Override
	public int insertNewProduct(Map<String, Object> articleMap) throws DataAccessException {
		System.out.println("productInfo: "+articleMap);
		return sqlSession.insert("mapper.product.insertNewProduct", articleMap);
	}

	@Override
	public ProductVO selectOneProduct(String product_code) throws DataAccessException {
		ProductVO productVO = sqlSession.selectOne("mapper.product.selectOneProduct", product_code);
		return productVO;
	}

}
