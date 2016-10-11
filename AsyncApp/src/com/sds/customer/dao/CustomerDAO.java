package com.sds.customer.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.sds.customer.domain.Customer;
import com.sds.pool.PoolManager;

public class CustomerDAO {
	PoolManager pool=PoolManager.getInstance();
	public boolean isExist(String id){
		boolean result=false;
		String sql="select * from customer where id=?";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, id);
			rs=pstmt.executeQuery();
			result=rs.next();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt, rs);
		}
		
		return result;
	}
	public int insert(Customer dto){
		int result=0;
		String sql="insert into customer(customer_id,id,password,zipcode1,zipcode2,addr1,addr2) " ;
		sql=sql+"values(seq_customer.nextval,?,?,?,?,?,?)";
		Connection con=null;
		PreparedStatement pstmt=null;
		
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, dto.getId());
			pstmt.setString(2, dto.getPassword());
			pstmt.setString(3, dto.getZipcode1());
			pstmt.setString(4, dto.getZipcode2());
			pstmt.setString(5, dto.getAddr1());
			pstmt.setString(6, dto.getAddr2());
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
		String sql="select * from customer order by customer_id asc";
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		ArrayList<Customer> list=new ArrayList<Customer>();
		con=pool.getConnection();
		try {
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			while(rs.next()){
				Customer dto=new Customer();
				dto.setCustomer_id(Integer.parseInt(rs.getString("customer_id")));
				dto.setId(rs.getString("id"));
				dto.setPassword(rs.getString("password"));
				dto.setZipcode1(rs.getString("zipcode1"));
				dto.setZipcode2(rs.getString("zipcode2"));
				dto.setAddr1(rs.getString("addr1"));
				dto.setAddr2(rs.getString("addr2"));
				dto.setRegdate(rs.getString("regdate").substring(0,10));
				list.add(dto);
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return list;
	}
}
