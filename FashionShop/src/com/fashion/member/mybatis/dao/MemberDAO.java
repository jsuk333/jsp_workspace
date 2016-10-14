package com.fashion.member.mybatis.dao;

import org.apache.ibatis.session.SqlSession;

import com.fashion.member.domain.Member;
import com.fashion.mybatis.SessionManager;

public class MemberDAO {
	SessionManager manager=SessionManager.getInstance();
	//회원 정보 가져오기
	public Member select(Member member){
		SqlSession session=manager.getSession();
		Member dto=session.selectOne("Member.select", member);
		session.close();
		return dto;
	}
}
