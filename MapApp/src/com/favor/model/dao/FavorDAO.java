package com.favor.model.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.favor.domain.Favor;
import com.favor.pool.PoolManager;

public class FavorDAO {
	PoolManager pool=PoolManager.getInstance();
	public int insert(Favor dto){
		String sql="insert into favor(favor_id,lat,lng,name,img,content,score)"
				+ " values(seq_favor.nextval,?,?,?,?,?,?)";
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setDouble(1, dto.getLat());
			pstmt.setDouble(2, dto.getLng());
			pstmt.setString(3, dto.getName());
			pstmt.setString(4, dto.getImg());
			pstmt.setString(5, dto.getContent());
			pstmt.setDouble(6, dto.getScore());
			result=pstmt.executeUpdate();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return result;
	}
	public List selectAll(){
		String sql="select * from favor order by favor_id desc";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Favor> list=new ArrayList<Favor>();
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Favor dto=new Favor();
				dto.setFavor_id(rs.getInt("favor_id"));
				dto.setLat(rs.getDouble("lat"));
				dto.setLng(rs.getDouble("lng"));
				dto.setImg(rs.getString("img"));
				dto.setContent(rs.getString("content"));
				dto.setName(rs.getString("name"));
				dto.setScore(rs.getDouble("score"));
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
