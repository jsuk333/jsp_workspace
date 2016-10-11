/*이 클래스는 로직을 작성하기 위함이 아니라 ㅣ, 데이터베이스의 하나의 레코드를 담기 위한
 * 객체로 활용하기 위함이다.
 * 어플리케이션 설계분야 에서 이러한 목적의 객체를 가리켜 
 * DTO(Data Transfer Object),VO(Value Object)
 * 데이터 전달 객체					데이터 담는 객체
 * */
package com.sds.model.board;

public class BoardDTO {
	private int board_id;
	private String title;
	private String writer;
	private String content;
	private String regdate;
	private int hit;
	
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
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
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
	
}
