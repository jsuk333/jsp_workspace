package com.fashion.shopping.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.mybatis.SessionManager;
import com.fashion.shopping.domain.Bank;

public class BankDAO {
	SessionManager manager=SessionManager.getInstance();
	public List selectAll(){
		SqlSession session=manager.getSession();
		List list=session.selectList("Bank.selectAll");
		session.close();
		return list;
	}
	public Bank select(int bank_id){
		SqlSession session=manager.getSession();
		Bank bank=session.selectOne("Bank.select", bank_id);
		session.close();
		return bank;
	}
}
