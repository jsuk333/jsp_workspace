package com.sds.board.domain;

import java.util.ArrayList;

import com.sds.comments.domain.Comments;

public class Board {
	private int board_id;
	private String title;
	private String writer;
	private String regdate;
	private String content;
	private int hit;
	private ArrayList<Comments> commentsList;
	public ArrayList<Comments> getCommentsList() {
		return commentsList;
	}
	public void setCommentsList(ArrayList<Comments> commentsList) {
		this.commentsList = commentsList;
	}
	public int getBoard_id() {
		return board_id;
	}
	public void setBoard_id(int board_id) {
		this.board_id = board_id;
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getHit() {
		return hit;
	}
	public void setHit(int hit) {
		this.hit = hit;
	}
}

