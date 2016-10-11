package com.fashion.subcategory.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.fashion.pool.PoolManager;
import com.fashion.subcategory.domain.Subcategory;

public class SubcategoryDAO {
	PoolManager pool=PoolManager.getInstance();
	public List select(int top_id){
		ArrayList<Subcategory> list=new ArrayList<Subcategory>();
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from subcategory where top_id=? order by sub_id asc";
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, top_id);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Subcategory dto=new Subcategory();
				dto.setSub_id(rs.getInt("sub_id"));
				dto.setTop_id(rs.getInt("top_id"));
				dto.setTitle(rs.getString("title"));
				dto.setRank(rs.getInt("rank"));
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
