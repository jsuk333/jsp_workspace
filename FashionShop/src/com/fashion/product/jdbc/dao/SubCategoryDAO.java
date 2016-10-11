package com.fashion.product.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashion.pool.PoolManager;
import com.fashion.product.domain.SubCategory;
import com.fashion.product.domain.TopCategory;

public class SubCategoryDAO {
	PoolManager pool=PoolManager.getInstance();
	
	//선택한 상위 카테고리의 소속된 하위 목록 가져오기
	public List select(int top_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		List list=new ArrayList<SubCategory>();
		
		String sql="select * from subcategory where top_id=? order by rank asc";
		
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1,top_id);
			rs=pstmt.executeQuery();
			
			while(rs.next()){
				SubCategory dto = new SubCategory();
				dto.setSub_id(rs.getInt("sub_id"));
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






