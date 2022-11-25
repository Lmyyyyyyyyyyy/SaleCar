package com.yang.dao;

import com.yang.domain.Product;
import org.apache.ibatis.annotations.*;
import org.springframework.stereotype.Repository;

import java.util.List;

@Mapper
@Repository("productDao")
public interface ProductDao {
	
	@Select("select * from products")
	public List<Product> findAllProducts() throws Exception;
	
	//根据名称、分类、价格区间查找商品
	@Select("select * from products where name like concat('%',#{name},'%') and category like concat('%',#{category},'%') and price>=#{minPrice} and price<=#{maxPrice}")
	public List<Product> findProductsByCondition(@Param("name")String name,@Param("category")String category,@Param("minPrice")double minPrice,@Param("maxPrice")double maxPrice) throws Exception;
	
	@Select("select * from products where id=#{id}")
	public Product findProductById(String id) throws Exception;

	@Update("update products set pnum = #{pnum} where id = #{id}")
	public void updateProductNumById(@Param("id")String id, @Param("pnum")Integer pnum) throws Exception;
	
	@Update("update products set name=#{name} , price=#{price} , pnum=#{pnum} where id=#{id}")
	public void updateProduct(Product product) throws Exception;
	
	@Insert("insert into products(id,name,price,category,pnum,imgurl,description) values(#{id},#{name},#{price},#{category},#{pnum},#{imgurl},#{description})")
	public void addProduct(Product product) throws Exception;

	@Select("select count(*) from products")
	public Integer findAllProductsNum() throws Exception;

	@Delete("delete from products where id=#{id}")
	public void deleteProductsByProductId(String id) throws Exception;
}

