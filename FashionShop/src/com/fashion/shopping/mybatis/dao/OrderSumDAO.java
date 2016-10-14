package com.fashion.shopping.mybatis.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;

import com.fashion.member.domain.Guest;
import com.fashion.mybatis.SessionManager;
import com.fashion.product.domain.Product;
import com.fashion.shopping.domain.Bank;
import com.fashion.shopping.domain.Customer;
import com.fashion.shopping.domain.OrderDetail;
import com.fashion.shopping.domain.OrderSum;
import com.fashion.shopping.domain.Payment;

public class OrderSumDAO {
	SessionManager manager=SessionManager.getInstance();
	//주문 등록(세부적으로 주문요약, 주문사세,결제정보, 배송지)
	public int insert(Guest guest,List cart ){//비회원 용
		int result=0;
		SqlSession session=manager.getSession();
		try {
			session.insert("Guest.insert", guest);
			int guest_id=guest.getGuest_id();
			// 비회원 등록
			Customer customer=new Customer();
			customer.setCustomer_type("guest");
			customer.setType_id(guest_id);
			//customer테이블에 (비)회원 등록
			session.insert("Customer.insert", customer);
			int customer_id=customer.getCustomer_id();
			//주문 요약
			OrderSum ordersum=new OrderSum();
			ordersum.setCustomer_id(customer_id);
			session.insert("OrderSum.insert", ordersum);
			int ordersum_id=ordersum.getOrdersum_id();
			//주문 상세
			for(int i=0;i<cart.size();i++){
				Product product=(Product)cart.get(i);
				OrderDetail orderDetail=new OrderDetail();
				orderDetail.setProduct_id(product.getProduct_id());
				orderDetail.setEa(product.getStock());
				orderDetail.setColor(product.getColor());
				orderDetail.setPsize(product.getPsize());
				orderDetail.setOrdersum_id(ordersum_id);
				session.insert("OrderDetail.insert", orderDetail);
			}
			//결제정보
			
			
			//session.insert("Payment.insert", payment);
			//배송지 정보
			
			session.commit();
		} catch (Exception e) {
			e.printStackTrace();
			session.rollback();	
		}finally{
			session.close();
		}
		return result;
	}
}
