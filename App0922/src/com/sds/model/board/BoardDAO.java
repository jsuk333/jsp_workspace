/*�� Ŭ������ ���̰� �����̰� ������� ������ ���̽����� ���� �۾��� �������� ���� ������ Ŭ���� �̴�.
 * ���ø����̼� ���� �о߿����� �̷��� ������ ��ü�� ��������
 * DAO(Data Access Object)�� �Ѵ�.
 * ���� )  �ڹ� �о��� �� �ƴϱ� �����̱� ������ MS ������ ��� ���������� 
 * �������� DAO��� ����. dao�� �ֿ� ������ CRUD(Create Read Update Delete)(insert read update delete)�̴�.
 * 							
 * */
package com.sds.model.board;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.sds.pool.PoolManager;

public class BoardDAO {
	PoolManager pool=PoolManager.getInstance();
	//�Խù� �Ѱ� �ֱ�
	public int insert(String writer, String title, String content){
		Connection con=null;
		PreparedStatement pstmt=null;
		int result=0;
		try {
			con=pool.getConnection();
			String sql="insert into board(board_id,writer,title,content) values(seq_board.nextval,?,?,?)";
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1, writer);
			pstmt.setString(2, title);
			pstmt.setString(3, content);
			result=pstmt.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		return result;	
	}
	//�Խù� ��� ��������
	public List selectAll(){
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		String sql="select * from board order by board_id desc";
		ArrayList<BoardDTO> list=new ArrayList<BoardDTO>();
		try {
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			rs=pstmt.executeQuery();
			//rs�� �� �����Ƿ� rs�� ��ü�� ���� ��ü���� �̿��غ���
			//DTO(Data Transfer Object), VO(Value Object)
			while(rs.next()){
				BoardDTO dto=new BoardDTO();
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setContent(rs.getString("content"));
				list.add(dto);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt,rs);
		}
		return list;
	}
	
	public BoardDTO selectRecord(int board_id){
		BoardDTO dto=null;
		Connection con=null;
		PreparedStatement pstmt=null;
		ResultSet rs=null;
		try {
			String sql="select * from board where board_id=?";
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			rs=pstmt.executeQuery();
			if(rs.next()){
				dto=new BoardDTO();
				dto.setBoard_id(rs.getInt("board_id"));
				dto.setTitle(rs.getString("title"));
				dto.setWriter(rs.getString("writer"));
				dto.setRegdate(rs.getString("regdate"));
				dto.setContent(rs.getString("content"));
			}else{
				dto.setTitle("�����Ͱ� �����ϴ�.");
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt,rs);
		}
		return dto;
	}
	public boolean delete(int board_id){
		Connection con=null;
		PreparedStatement pstmt=null;
		boolean flag=false;
		try {
			String sql="delete board where board_id=?";
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setInt(1, board_id);
			int result=pstmt.executeUpdate();
			if(result!=0){
				flag=true;
			}else{
				flag=false;
			}
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		return flag;
	}
	public boolean editRecord(BoardDTO dto){
		boolean flag=false;
		
		Connection con=null;
		PreparedStatement pstmt=null;
		String sql="update board set writer=?, title=?, content=? where board_id=?";
		try {
			con=pool.getConnection();
			pstmt=con.prepareStatement(sql);
			pstmt.setString(1,dto.getWriter() );
			pstmt.setString(2,dto.getTitle());
			pstmt.setString(3,dto.getContent());
			pstmt.setInt(4, dto.getBoard_id());
			int result=pstmt.executeUpdate();
			if(result!=0){
				flag=true;
			}else{
				flag=false;
			}
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally{
			pool.freeConnection(con, pstmt);
		}
		
		
		return flag;
	}
}
