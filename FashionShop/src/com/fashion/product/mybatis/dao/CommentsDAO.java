package com.fashion.product.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.SessionManager;
import com.fashion.product.domain.Comments;

public class CommentsDAO {
	SessionManager manager=SessionManager.getInstance();
	public int insert(Comments dto){
		SqlSession session=manager.getSession();
		int result=0;
		result=session.insert("Comments.insert", dto);
		session.commit();//mybatis는 디폴트가 commit false이다. 따라서 개발자가 커밋 시켜야 한다.
		session.close();
		return result;
	}
	public List selectAll(int product_id){
		List list=null;
		SqlSession session=manager.getSession();
		list=(List)session.selectList("Comments.selectAll", product_id);
		session.close();
		return list;
	}
}
