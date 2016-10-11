package com.sds.post.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sds.pool.PoolManager;
import com.sds.post.domain.Post;

public class PostDAO {
	PoolManager pool=PoolManager.getInstance();
	public int insert(Post dto){
		String sql="insert into post(zipcode,sido,gugun,dong,bunji,seq) values(?,?,?,?,?,?)";
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getZipcode());
			pstmt.setString(2, dto.getSido());
			pstmt.setString(3, dto.getGugun());
			pstmt.setString(4, dto.getDong());
			pstmt.setString(5, dto.getBunji());
			pstmt.setInt(6, dto.getSeq());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		
		
		return result;
	}
	public List selectAll(String dong){
		ArrayList<Post> list=new ArrayList<Post>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=pool.getConnection();
		String sql="select * from post where dong like '%'||?||'%' ";
		System.out.println(sql);
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dong);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Post dto=new Post();
				dto.setZipcode(rs.getString("zipcode"));
				dto.setSido(rs.getString("sido"));
				dto.setGugun(rs.getString("gugun"));
				dto.setDong(rs.getString("dong"));
				dto.setBunji(rs.getString("bunji"));
				dto.setSeq(rs.getInt("seq"));
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
