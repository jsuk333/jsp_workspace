package com.sds.board.domain;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sds.board.domain.Board;
import com.sds.comments.domain.Comments;
import com.sds.pool.PoolManager;
public class BoardDAO {
	PoolManager pool=PoolManager.getInstance();
	public int insert(Board dto){
		String sql="insert into board(board_id,title,writer,content) values(seq_board.nextval,?,?,?)";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		con=pool.getConnection();
		int result=0;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getTitle());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getContent());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public List selectAll(){
		ArrayList<Board> list=new ArrayList<Board>();
		//String sql="select * from board order by board_id desc";
		StringBuffer sb=new StringBuffer();
		sb.append("select b.board_id as board_id, b.title as title,b.writer as writer, b.regdate as regdate,hit,count(comments_id) as total ");
		sb.append("from board b left outer join comments c ");
		sb.append("on b.board_id=c.board_id ");
		sb.append("group by b.board_id, b.title,b.writer, b.regdate,hit order by b.board_id desc");
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sb.toString());
			rs=pstmt.executeQuery();
			while(rs.next()){
				Board dto=new Board();
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setHit(rs.getInt("hit"));
				//코멘트 개수 만큼 comment 생성하여 board의 commentList에 탑재
				//단 코멘트가 존재 할때만
				if(rs.getInt("total")>0){
					ArrayList<Comments> commentsList=dto.getCommentsList();
					commentsList=new ArrayList<Comments>();
					for(int i=0;i<rs.getInt("total");i++){
						Comments comments=new Comments();
						commentsList.add(comments);
					}
					dto.setCommentsList(commentsList);
					
				}
				list.add(dto);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt,rs);
		}
		
		return list;
	}
	public Board select(int board_id){
		ArrayList<Board> list=new ArrayList<Board>();
		String sql="select * from board where board_id=? order by board_id desc";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=pool.getConnection();
		Board dto=null;
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new Board();
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setContent(rs.getString("content"));
				dto.setHit(rs.getInt("hit"));
				list.add(dto);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt,rs);
		}
		
		return dto;
	}
	public List selectAll(String keyword,String category){
		ArrayList<Board> list=new ArrayList<Board>();
		//String sql="select * from board order by board_id desc";
		StringBuffer sb=new StringBuffer();
		sb.append("select b.board_id as board_id, b.title as title,b.writer as writer, b.regdate as regdate,hit,count(comments_id) as total ");
		sb.append("from board b left outer join comments c ");
		sb.append("on b.board_id=c.board_id ");
		sb.append("group by b.board_id, b.title,b.writer, b.regdate,hit ");
		sb.append("having b."+category+" like '%'||?||'%' ");
		System.out.println(sb.toString());
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sb.toString());
			pstmt.setString(1, keyword);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Board dto=new Board();
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				dto.setHit(rs.getInt("hit"));
				//코멘트 개수 만큼 comment 생성하여 board의 commentList에 탑재
				//단 코멘트가 존재 할때만
				if(rs.getInt("total")>0){
					ArrayList<Comments> commentsList=dto.getCommentsList();
					commentsList=new ArrayList<Comments>();
					for(int i=0;i<rs.getInt("total");i++){
						Comments comments=new Comments();
						commentsList.add(comments);
					}
					dto.setCommentsList(commentsList);
					
				}
				list.add(dto);
			}
		} catch (SQLException e) {
		
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt,rs);
		}
		
		return list;
	}
	public int updateHit(int board_id){
		String sql="update board set hit=hit+1 where board_id=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		return result;
	}
}
