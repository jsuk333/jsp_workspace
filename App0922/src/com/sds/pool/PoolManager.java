package com.sds.pool;

///*jndi�� �̿��Ͽ� �ܺ��� �ڿ����� �и����� ���� db������ ������ ���� �˻��Ͽ�
 //* �츮�� ���) jdbc/oracle�� �˻� Ű�����̴�.*/
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.naming.InitialContext;
import javax.naming.NamingException;
import javax.sql.DataSource;

public class PoolManager {
	InitialContext context;//jndi�� �̿��Ͽ� �ܺ��� �ڿ��� �˻� �� �� �ִ� ��ü
	DataSource ds;//Ŀ�ؼ��� ���� �� �ִ� Ŀ�ؼ� Ǯ ��ü
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
	//data source ���� connection��ü�� ��ȯ
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
