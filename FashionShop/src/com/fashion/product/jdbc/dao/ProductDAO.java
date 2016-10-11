package com.fashion.product.jdbc.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.fashion.pool.PoolManager;
import com.fashion.product.domain.Product;

public class ProductDAO {
	PoolManager pool=PoolManager.getInstance();
	
	public int insert(Product dto){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		int result=0;
		
		String sql="insert into product(product_id,sub_id,product_name,gender,brand,nation,price,discount,point,memo,psize,color,stock,img,detail)";
		sql=sql+" values(seq_product.nextval,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
		
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, dto.getSub_id());
			pstmt.setString(2, dto.getProduct_name());
			pstmt.setString(3, dto.getGender());
			pstmt.setString(4, dto.getBrand());
			pstmt.setString(5, dto.getNation());
			pstmt.setInt(6, dto.getPrice());
			pstmt.setInt(7, dto.getDiscount());
			pstmt.setInt(8, dto.getPoint());
			pstmt.setString(9, dto.getMemo());
			pstmt.setString(10, dto.getPsize());
			pstmt.setString(11, dto.getColor());
			pstmt.setInt(12, dto.getStock());
			pstmt.setString(13, dto.getImg());
			pstmt.setString(14, dto.getDetail());
			
			result=pstmt.executeUpdate();
			if(result!=0){
				//세션이 종료되기 전에, 현재 세션에서 일으킨 시퀀스를
				//조회하자!
				sql="select seq_product.currval as product_id from dual";
				pstmt=con.prepareStatement(sql);
				rs=pstmt.executeQuery();
				
				if(rs.next()){
					result=rs.getInt("product_id");
				}
			}
		} catch (SQLException e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt,rs);
		}
		return result;
	} 
	
	
}      
                                     













