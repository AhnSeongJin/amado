package com.myspring.myapp.product.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import com.myspring.myapp.common.pagination.Pagination;
import com.myspring.myapp.product.vo.ProductVO;

@Repository("productDAO")
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

	//전체 상품 개수 구하기
	@Override
	public int selectProductListCnt() throws DataAccessException {
		int listCnt = sqlSession.selectOne("mapper.product.selectProductListCnt");
		return listCnt;
	}

	//상품 리스트 구하기
	@Override
	public List<ProductVO> getProductList(Pagination pagination) throws DataAccessException {
		return sqlSession.selectList("mapper.product.getProductList", pagination);
	}

}
