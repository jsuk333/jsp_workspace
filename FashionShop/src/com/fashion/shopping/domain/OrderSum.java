package com.fashion.shopping.domain;

public class OrderSum {
	private int ordersum_id;
	private int customer_id;
	private String regdate;
	private String ispay;
	public int getOrdersum_id() {
		return ordersum_id;
	}
	public void setOrdersum_id(int ordersum_id) {
		this.ordersum_id = ordersum_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public String getIspay() {
		return ispay;
	}
	public void setIspay(String ispay) {
		this.ispay = ispay;
	}
	
}
