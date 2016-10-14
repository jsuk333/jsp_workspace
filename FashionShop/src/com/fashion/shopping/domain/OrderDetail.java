package com.fashion.shopping.domain;

public class OrderDetail {
	 private int orderdetail_id;
	 private int ordersum_id;
	 private int product_id;
	 private String color;
	 private String psize;
	 private int ea;
	 
	public int getOrderdetail_id() {
		return orderdetail_id;
	}
	public void setOrderdetail_id(int orderdetail_id) {
		this.orderdetail_id = orderdetail_id;
	}
	public int getOrdersum_id() {
		return ordersum_id;
	}
	public void setOrdersum_id(int ordersum_id) {
		this.ordersum_id = ordersum_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPsize() {
		return psize;
	}
	public void setPsize(String psize) {
		this.psize = psize;
	}
	public int getEa() {
		return ea;
	}
	public void setEa(int ea) {
		this.ea = ea;
	}
	 
}
