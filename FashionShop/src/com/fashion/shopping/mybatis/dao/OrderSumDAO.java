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
	//�ֹ� ���(���������� �ֹ����, �ֹ��缼,��������, �����)
	public int insert(Guest guest,List cart ){//��ȸ�� ��
		int result=0;
		SqlSession session=manager.getSession();
		try {
			session.insert("Guest.insert", guest);
			int guest_id=guest.getGuest_id();
			// ��ȸ�� ���
			Customer customer=new Customer();
			customer.setCustomer_type("guest");
			customer.setType_id(guest_id);
			//customer���̺� (��)ȸ�� ���
			session.insert("Customer.insert", customer);
			int customer_id=customer.getCustomer_id();
			//�ֹ� ���
			OrderSum ordersum=new OrderSum();
			ordersum.setCustomer_id(customer_id);
			session.insert("OrderSum.insert", ordersum);
			int ordersum_id=ordersum.getOrdersum_id();
			//�ֹ� ��
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
			//��������
			
			
			//session.insert("Payment.insert", payment);
			//����� ����
			
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
