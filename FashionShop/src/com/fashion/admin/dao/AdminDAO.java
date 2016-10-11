package com.fashion.admin.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fashion.admin.domain.Admin;
import com.fashion.pool.PoolManager;

public class AdminDAO {
	PoolManager pool=PoolManager.getInstance();
	
	//로그인 체크 = 어드민 1명 조회하기 
	public Admin select(Admin admin){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		Admin dto=null;
		
		String sql="select * from admin where id=? and password=?";
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, admin.getId());
			pstmt.setString(2, admin.getPassword());
			rs=pstmt.executeQuery();
			
			if(rs.next()){//레코드가 있다면...존재함..
				dto = new Admin();
				dto.setAdmin_id(rs.getInt("admin_id"));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setName(rs.getString("name"));
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return dto;
	}
	
}










