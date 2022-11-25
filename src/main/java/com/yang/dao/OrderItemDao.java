package com.yang.dao;

import com.yang.domain.OrderItem;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("orderItemDao")
public interface OrderItemDao {

	@Insert("insert into orderitem(order_id,product_id,buynum) values(#{order_id},#{product_id},#{buynum})")
	public void addOrderItem(OrderItem orderItem) throws Exception;
	
	@Select("select * from orderItem where order_id=#{order_id}")
	public List<OrderItem> findOrderItemByOrderId(String order_id) throws Exception;
	
	@Delete("delete from orderItem where order_id=#{order_id}")
	public void deleteOrderItemByOrderId(String order_id) throws Exception;
	
	@Select("select * from orderItem where product_id=#{product_id}")
	public List<OrderItem> findOrderItemsByProductId(String product_id) throws Exception;
	
	@Select("select distinct product_id from orderItem")
	public List<String> findAllDistinctProductId() throws Exception;
	
}
