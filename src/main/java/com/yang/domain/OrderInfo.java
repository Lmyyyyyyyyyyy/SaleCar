package com.yang.domain;

import java.io.Serializable;
import java.util.Map;

public class OrderInfo implements Serializable{
	
	private Order order;//������Ϣ
	private Map<Product, Integer> map;//�ö����е����ж�������Ϣ
	
	public Order getOrder() {
		return order;
	}
	public void setOrder(Order order) {
		this.order = order;
	}
	public Map<Product, Integer> getMap() {
		return map;
	}
	public void setMap(Map<Product, Integer> map) {
		this.map = map;
	}
	
}
