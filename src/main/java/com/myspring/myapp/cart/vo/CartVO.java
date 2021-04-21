package com.myspring.myapp.cart.vo;

import java.sql.Date;

import org.springframework.stereotype.Component;

@Component("cartVO")
public class CartVO {
	private int cart_id;
	private String product_code;
	private String id;
	private int cart_product_qty;
	private Date cre_date;
	
	public int getCart_id() {
		return cart_id;
	}
	public void setCart_id(int cart_id) {
		this.cart_id = cart_id;
	}
	public String getProduct_code() {
		return product_code;
	}
	public void setProduct_code(String product_code) {
		this.product_code = product_code;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getCart_product_qty() {
		return cart_product_qty;
	}
	public void setCart_product_qty(int cart_product_qty) {
		this.cart_product_qty = cart_product_qty;
	}
	public Date getCre_date() {
		return cre_date;
	}
	public void setCre_date(Date cre_date) {
		this.cre_date = cre_date;
	}
	
	@Override
	public String toString() {
		return "CartVO [cart_id=" + cart_id + ", product_code=" + product_code + ", id=" + id + ", cart_product_qty="
				+ cart_product_qty + ", cre_date=" + cre_date + "]";
	}
	
	

}
