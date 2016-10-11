package com.favor.domain;

public class Favor {
	private int favor_id;
	private double lat;
	private double lng;
	private String name;
	private String img;
	private String content;
	private double score;
	public int getFavor_id() {
		return favor_id;
	}
	public void setFavor_id(int favor_id) {
		this.favor_id = favor_id;
	}
	public double getLat() {
		return lat;
	}
	public void setLat(double lat) {
		this.lat = lat;
	}
	public double getLng() {
		return lng;
	}
	public void setLng(double lng) {
		this.lng = lng;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public double getScore() {
		return score;
	}
	public void setScore(double score) {
		this.score = score;
	}
	
}
