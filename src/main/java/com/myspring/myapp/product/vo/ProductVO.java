package com.myspring.myapp.product.vo;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("productVO")
public class ProductVO {
	private String product_code;
	private String product_name;
	private String product_price;
	private String image_file_name;
	private Date reg_date;
	
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getProduct_name() {
		return product_name;
	}
	public void setProduct_name(String product_name) {
		this.product_name = product_name;
	}
	public String getProduct_price() {
		return product_price;
	}
	public void setProduct_price(String product_price) {
		this.product_price = product_price;
	}
	public String getImage_file_name() {
		return image_file_name;
	}
	public void setImage_file_name(String image_file_name) {
		try {
			if(image_file_name!= null && image_file_name.length()!=0) {
				this.image_file_name = URLEncoder.encode(image_file_name,"UTF-8");
			}
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
		}
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	
	@Override
	public String toString() {
		return "ProductVO [product_code=" + product_code + ", product_name=" + product_name + ", product_price="
				+ product_price + ", image_file_name=" + image_file_name + ", reg_date=" + reg_date + "]";
	}
	
	
}
