package com.fashion.subcategory.domain;

public class Subcategory {
	private int sub_id;
	private int top_id;
	private String title;
	private int rank;
	public int getSub_id() {
		return sub_id;
	}
	public void setSub_id(int sub_id) {
		this.sub_id = sub_id;
	}
	public int getTop_id() {
		return top_id;
	}
	public void setTop_id(int top_id) {
		this.top_id = top_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public int getRank() {
		return rank;
	}
	public void setRank(int rank) {
		this.rank = rank;
	}
	
}
