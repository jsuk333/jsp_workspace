/*
 * jndi 를 이용하여, 외부의 자원으로 분리시켜놓은 
 * db 정보를 검색하여 가져와보자!!
 * 우리의 경우) jdbc/oracle 이 검색 키워드이다!!!
 * */
package com.fashion.pool;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PoolManager {
	private static PoolManager instance;	
	InitialContext context; //jndi를 이용하여 외부의 
	//자원을 검색할 수있는 객체 
	DataSource ds; //커넥션을 얻을 수있는 커넥션풀객체
	
	private PoolManager() {
		try {
			context = new InitialContext();
			ds=(DataSource)context.lookup("java:/comp/env/jdbc/oracle"); 
		} catch (NamingException e) {
			e.printStackTrace();
		}
	}
	public static PoolManager getInstance() {
		if(instance==null){
			instance=new PoolManager();
		}
		return instance;
	}
	
	//DataSource로부터 Connection 객체를 반환 
	public Connection getConnection(){
		Connection con=null;
		try {
			con=ds.getConnection();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return con;
	}
	
	//DML 수행후 반납 
	public void freeConnection(Connection con, PreparedStatement pstmt){
		if(pstmt !=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
	//select 수행 후 반납 
	public void freeConnection(Connection con, PreparedStatement pstmt, ResultSet rs){
		if(rs !=null){
			try {
				rs.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(pstmt !=null){
			try {
				pstmt.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		if(con!=null){
			try {
				con.close();
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
	}
	
}












