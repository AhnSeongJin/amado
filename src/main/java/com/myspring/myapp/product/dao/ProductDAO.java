package com.myspring.myapp.product.dao;

import java.util.List;
import java.util.Map;

import org.springframework.dao.DataAccessException;

import com.myspring.myapp.product.vo.ProductVO;

public interface ProductDAO {

	public List<ProductVO> selectProductList() throws DataAccessException;

	public int insertNewProduct(Map<String, Object> articleMap) throws DataAccessException;

}
