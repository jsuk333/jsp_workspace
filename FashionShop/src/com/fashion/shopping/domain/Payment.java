package com.fashion.shopping.domain;

public class Payment {
	 private int payment_id;
	 private int ordersum_id;
	 private int totalbuy;
	 private int totalpay;
	 private String pay_name;
	 private int bank_id;
	public int getPayment_id() {
		return payment_id;
	}
	public void setPayment_id(int payment_id) {
		this.payment_id = payment_id;
	}
	public int getOrdersum_id() {
		return ordersum_id;
	}
	public void setOrdersum_id(int ordersum_id) {
		this.ordersum_id = ordersum_id;
	}
	public int getTotalbuy() {
		return totalbuy;
	}
	public void setTotalbuy(int totalbuy) {
		this.totalbuy = totalbuy;
	}
	public int getTotalpay() {
		return totalpay;
	}
	public void setTotalpay(int totalpay) {
		this.totalpay = totalpay;
	}
	public String getPay_name() {
		return pay_name;
	}
	public void setPay_name(String pay_name) {
		this.pay_name = pay_name;
	}
	public int getBank_id() {
		return bank_id;
	}
	public void setBank_id(int bank_id) {
		this.bank_id = bank_id;
	}

	 
}
