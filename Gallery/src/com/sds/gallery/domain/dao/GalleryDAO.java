package com.sds.gallery.domain.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sds.gallery.domain.Gallery;
import com.sds.pool.PoolManager;

public class GalleryDAO {
	PoolManager pool=PoolManager.getInstance();
	public int insert(Gallery dto){
		String sql="insert into gallery(gallery_id,writer,title,content,img) "
				+ "values(seq_gallery.nextval,?,?,?,?)";
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getWriter());
			pstmt.setString(2, dto.getTitle());
			pstmt.setString(3, dto.getContent());
			pstmt.setString(4, dto.getImg());
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		
		
		return result;
	}
	public List selectAll(){
		String sql="select * from gallery";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Gallery> list=new ArrayList<Gallery>();
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Gallery dto=new Gallery();
				dto.setGallery_id(rs.getInt("gallery_id"));
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setHit(rs.getInt("hit"));
				dto.setContent(rs.getString("content"));
				dto.setImg(rs.getString("img"));
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
	public Gallery select(int gallery_id){
		Gallery dto=null;
		String sql="select * from gallery where gallery_id=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, gallery_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new Gallery();
				dto.setWriter(rs.getString("writer"));
				dto.setTitle(rs.getString("title"));
				dto.setContent(rs.getString("content"));
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		return dto;
	}
	public int delete(int gallery_id){
		String sql="delete from gallery where gallery_id=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, gallery_id);
			result=pstmt.executeUpdate();
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return result;
	}
}
