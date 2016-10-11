package com.sds.pool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PoolManager {
	InitialContext context;//jndi를 이용하여 외부의 자원을 검색 할 수 있는 개체
	DataSource ds;//커넥션을 얻을 수 있는 커넥션 풀 객체
	private static PoolManager instance;
	private PoolManager() {
		try {
			context=new InitialContext();
			ds=(DataSource) context.lookup("java:/comp/env/jdbc/oracle");
		} catch (NamingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	public static PoolManager getInstance(){
		if(instance==null){
			instance=new PoolManager();
		}
		return instance;
	}
	//data source 에서 connection객체를 반환
	public Connection getConnection(){
		Connection con=null;
		try{
		con=ds.getConnection();
		}catch(SQLException e){
			e.printStackTrace();
		}
		return con;
	}
	
	public void freeConnection(Connection con, PreparedStatement pstmt){
		if(con!=null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
	}
	public void freeConnection(Connection con, PreparedStatement pstmt,ResultSet rs){
		if(con!=null){
			try{
				con.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(pstmt!=null){
			try{
				pstmt.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		if(rs!=null){
			try{
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
		}
		
	}
}
