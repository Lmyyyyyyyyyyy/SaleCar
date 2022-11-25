package com.yang.service;

import com.yang.domain.Product;

import java.util.List;


public interface IProductService {
	
	public List<Product> findAllProducts() throws Exception;
	
	public List<Product> findProductsByCondition(String name,String category,double _minPrice,double _maxPrice) throws Exception;
	
	public Product findProductById(String id) throws Exception;

	void updateProductNumById(String id, Integer pnum) throws Exception;

	public List<Product> findAllProductsByPage(Integer page,Integer size) throws Exception;
	
	public void updateProduct(Product product) throws Exception;

	public void addProduct(Product product) throws Exception;
	
	public Integer findAllProductsNum() throws Exception;
	
	public void deleteProductsByProductId(String id) throws Exception;
}
