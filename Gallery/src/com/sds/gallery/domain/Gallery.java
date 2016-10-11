package com.sds.gallery.domain;

public class Gallery {
	 private int gallery_id;
	 private String writer;
	 private String title;
	 private String regdate;
	 private int hit;
	 private String content;
	 private String img;
	public int getGallery_id() {
		return gallery_id;
	}
	public void setGallery_id(int gallery_id) {
		this.gallery_id = gallery_id;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getRegdate() {
		return regdate;
	}
	public void setRegdate(String regdate) {
		this.regdate = regdate;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
}
