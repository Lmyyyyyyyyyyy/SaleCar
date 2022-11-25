package com.yang.service;

import com.yang.domain.OrderItem;

import java.util.List;


public interface IOrderItemService {
	
	public void addOrderItem(OrderItem orderItem) throws Exception;

	public List<OrderItem> findOrderItemByOrderId(String order_id) throws Exception;

	public void deleteOrderItemByOrderId(String order_id) throws Exception;
	
	public List<OrderItem> findOrderItemsByProductId(String product_id) throws Exception;
	
	public List<String> findAllDistinctProductId() throws Exception;
	
}
