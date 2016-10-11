package com.fashion.product.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashion.pool.PoolManager;
import com.fashion.product.domain.TopCategory;

public class TopCategoryDAO {
	PoolManager pool=PoolManager.getInstance();
	
	//모든 레코드 가져오기!
	public List selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List list=new ArrayList<TopCategory>();
		
		String sql="select * from topcategory order by rank asc";
		
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				TopCategory dto = new TopCategory();
				dto.setTop_id(rs.getInt("top_id"));
				dto.setTitle(rs.getString("title"));
				dto.setRank(rs.getInt("rank"));
				
				list.add(dto);
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		return list;
	}
}






