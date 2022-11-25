package com.yang.service.impl;

import com.github.pagehelper.PageHelper;
import com.yang.dao.OrderDao;
import com.yang.domain.Order;
import com.yang.service.IOrderService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Service;

import java.util.List;

@Service("orderService")
public class OrderService implements IOrderService{

	@Qualifier("orderDao")
	@Autowired
	private OrderDao orderDao;
	
	@Override
	public void addOrder(Order order) throws Exception {
		// TODO Auto-generated method stub
		orderDao.addOrder(order);
	}

	@Override
	public List<Order> findOrdersByUserId(Integer user_id) throws Exception {
		// TODO Auto-generated method stub
		return orderDao.findOrdersByUserId(user_id);
	}

	@Override
	public void deleteOrderById(String id) throws Exception {
		// TODO Auto-generated method stub
		orderDao.deleteOrderById(id);
	}
	
	@Override
	public List<Order> findAllOrders() throws Exception {
		// TODO Auto-generated method stub
		return orderDao.findAllOrders();
	}
	
	@Override
	public List<Order> findOrderByPage(Integer page, Integer size) throws Exception {
		// TODO Auto-generated method stub
		//∑÷“≥≤È—Ø
		PageHelper.startPage(page, size);
		return orderDao.findAllOrders();
	}
	public Order findOrderByOrderId(String orderId) throws Exception{
		return orderDao.findOrderByOrderId(orderId);
	}

	
	@Override
	public List<Order> findAllOrderUnPay() throws Exception {
		// TODO Auto-generated method stub
		return orderDao.findAllOrderUnPay();
	}

	@Override
	public Integer findOrdersNumToday() throws Exception {
		// TODO Auto-generated method stub
		return orderDao.findOrdersNumToday();
	}

	
	@Override
	public Integer findOrdersMoneyYestoday() throws Exception {
		// TODO Auto-generated method stub
		return orderDao.findOrdersMoneyYestoday();
	}

	@Override
	public Integer findOrdersMoneyToday() throws Exception {
		// TODO Auto-generated method stub
		return orderDao.findOrdersMoneyToday();
	}

}
