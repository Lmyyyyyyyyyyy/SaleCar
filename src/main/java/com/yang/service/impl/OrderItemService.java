package com.yang.service.impl;

import com.yang.dao.OrderItemDao;
import com.yang.domain.OrderItem;
import com.yang.service.IOrderItemService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderItemService")
public class OrderItemService implements IOrderItemService {

	@Qualifier("orderItemDao")
	@Autowired
	private OrderItemDao orderItemDao;
	
	@Override
	public void addOrderItem(OrderItem orderItem) throws Exception {
		// TODO Auto-generated method stub
		orderItemDao.addOrderItem(orderItem);
	}

	@Override
	public List<OrderItem> findOrderItemByOrderId(String order_id) throws Exception {
		// TODO Auto-generated method stub
		return orderItemDao.findOrderItemByOrderId(order_id);
	}

	@Override
	public void deleteOrderItemByOrderId(String order_id) throws Exception {
		// TODO Auto-generated method stub
		orderItemDao.deleteOrderItemByOrderId(order_id);
	}


	@Override
	public List<OrderItem> findOrderItemsByProductId(String id) throws Exception {
		// TODO Auto-generated method stub
		return orderItemDao.findOrderItemsByProductId(id);
	}

	@Override
	public List<String> findAllDistinctProductId() throws Exception {
		// TODO Auto-generated method stub
		return orderItemDao.findAllDistinctProductId();
	}

}
