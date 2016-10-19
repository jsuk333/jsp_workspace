package com.sds.board.model;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.sds.mybatis.SqlSessionManager;
import com.sds.reboard.domain.ReBoard;

public class ReBoardDAO {
	SqlSessionManager manager=SqlSessionManager.getInstance();
	//한건 넣기+팀 업데이트 하기
	public int insert(ReBoard reboard){
		SqlSession session=manager.getSession();
		int result=0;
		try {
			int reboard_id=session.insert("Reboard.insert", reboard);
			result=session.update("ReBoard.updateTeam",reboard_id);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally{
			session.close();
		}
		
		return result;
	}
	//모든 레코드 가져오기
	public List selectAll(){
		SqlSession session=manager.getSession();
		List list=session.selectList("ReBoard.selectAll");
		session.close();
		return list;
	}
	//한건 가져오기
	public ReBoard selectOne(int reboard_id){
		SqlSession session=manager.getSession();
		ReBoard reboard=session.selectOne("ReBoard.selectOne", reboard_id);
		session.close();
		return reboard;
	}
	//수정하기
	public int update(ReBoard reboard){
		SqlSession session=manager.getSession();
		int result=session.update("ReBoard.update", reboard);
		session.commit();
		session.close();
		return result;
	}
	//삭제하기
	public int delete(int reboard_id){
		SqlSession session=manager.getSession();
		int result=session.delete("ReBoard.delete", reboard_id);
		session.commit();
		session.close();
		return result;
	}
	//답변 등록하기
	public int reply(ReBoard reboard){
		SqlSession session=manager.getSession();
		int result=0;
		try {
			session.update("Reboard.updateForReply", reboard);
			result=session.insert("Reboard.reply", reboard);
			session.commit();
		} catch (Exception e) {
			session.rollback();
			e.printStackTrace();
		}finally {
			session.close();
		}
		return result;
	}
}
