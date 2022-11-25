package com.yang.controller;

import com.yang.domain.Product;
import com.yang.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.Map;

@Controller
@RequestMapping("cart")
public class CartController {
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping(value="/addProductToCart")
	public String AddProductToCart(@RequestParam("pid")String pid,@RequestParam("buyNum")String num,HttpSession session) throws Exception{
		
		Product product=productService.findProductById(pid);
		Integer buyNum=Integer.parseInt(num);
		
		//获取购物车Map记录表
		Map<Product,Integer> map=(Map<Product, Integer>)session.getAttribute("cartmap");
		if(buyNum<0){
			map.remove(product);
		}else{
			if(product!=null)
				map.put(product,map.containsKey(product)?map.get(product)+buyNum:buyNum);
		}
		return "redirect:/cart.jsp";
	}
	
	//通过Ajax请求的方式更新购物车商品的购置数目
	@RequestMapping(value="/updateBuyNumToCart",method=RequestMethod.POST)
	public void UpdateBuyNumToCart(@RequestParam("pid")String pid,@RequestParam("buyNum")String num,HttpSession session) throws Exception{
		
		Product product=productService.findProductById(pid);
		Integer buyNum=Integer.parseInt(num);
		//获取购物车Map记录表
		Map<Product,Integer> map=(Map<Product, Integer>)session.getAttribute("cartmap");
		
		if(product!=null){
			map.put(product, buyNum);
		}
	}

		
	
}
