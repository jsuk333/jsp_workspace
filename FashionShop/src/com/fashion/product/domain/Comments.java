package com.fashion.product.domain;

public class Comments {
	private int comments_id;
	private int product_id;
	private String title;
	private String writer;
	private String regdate;
	public int getComments_id() {
		return comments_id;
	}
	public void setComments_id(int comments_id) {
		this.comments_id = comments_id;
	}
	public int getProduct_id() {
		return product_id;
	}
	public void setProduct_id(int product_id) {
		this.product_id = product_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
}
