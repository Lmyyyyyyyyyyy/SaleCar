package com.yang.service;

import com.yang.domain.Order;

import java.util.List;


public interface IOrderService {
	
	public void addOrder(Order order) throws Exception;
	
	public List<Order> findOrdersByUserId(Integer user_id) throws Exception;
	
	public void deleteOrderById(String id) throws Exception;
	
	public List<Order> findAllOrders() throws Exception;

	public List<Order> findOrderByPage(Integer page, Integer size) throws Exception;

	public Order findOrderByOrderId(String orderId) throws Exception;
	
	public List<Order> findAllOrderUnPay() throws Exception;
	
	public Integer findOrdersNumToday() throws Exception;
	
	public Integer findOrdersMoneyToday() throws Exception;
	
	public Integer findOrdersMoneyYestoday() throws Exception;
}
