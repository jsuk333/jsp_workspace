package com.sds.comments.domain;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sds.pool.PoolManager;

public class CommentsDAO {
	PoolManager pool=PoolManager.getInstance();
	public int insert(Comments dto){
		String sql="insert into comments(COMMENTS_ID,BOARD_ID,WRITER,TITLE) values(seq_comments.nextval,?,?,?)";
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getBoard_id());
			pstmt.setString(2, dto.getWriter());
			pstmt.setString(3, dto.getTitle());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		
		return result;
	}
	
	public List selectAll(int board_id){
		String sql="select * from comments where board_id=? order by comments_id desc";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Comments> list=new ArrayList<Comments>();
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Comments dto=new Comments();
				dto.setComments_id(rs.getInt("comments_id"));
				dto.setBoard_id(Integer.parseInt(rs.getString("board_id")));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegdate(rs.getString("regdate"));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
}
