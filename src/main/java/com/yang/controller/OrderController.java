package com.yang.controller;

import com.github.pagehelper.PageInfo;
import com.yang.domain.*;
import com.yang.service.IOrderItemService;
import com.yang.service.IOrderService;
import com.yang.service.IProductService;
import com.yang.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.*;

@Controller
@RequestMapping("/order")
public class OrderController {
	
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IProductService productService;
	
	@Autowired
	private IOrderItemService orderItemService;

	@Autowired
	private IUserService userService;

	
	@RequestMapping("/addOrder")
	public void AddOrder(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String encode="utf-8";
		request.setCharacterEncoding(encode);
		response.setContentType("text/html;charset=" + encode);
		User user=(User)request.getSession().getAttribute("user");
		if (user == null) {
			response.getWriter().write("<a href='"+request.getContextPath()+"/login.jsp'>请先登录！</a>");
		} else {
			// 2.获取订单数据(即获取订单中包含哪些商品和商品购买数量)，并将数据封装到JavaBean中
			//点击去结算生成订单
			Order order = new Order();
			order.setId(UUID.randomUUID().toString());
			order.setPaystate(0);// 默认是0表示未支付
			order.setReceiverinfo(request.getParameter("receiverinfo"));
			order.setUser_id(user.getId());
			//订单项记录订单id，产品id以及购置数量
			List<OrderItem> list = new ArrayList<OrderItem>();
			double totalMoney=0;
			//通过购物车map获取数据设置OrderItem以及订单总价
			Map<Product, Integer> map = (Map<Product, Integer>) request
					.getSession().getAttribute("cartmap");
			for (Map.Entry<Product, Integer> entry : map.entrySet()) {
				double price = entry.getKey().getPrice();// 当前商品的单价
				int buyNum = entry.getValue();// 购买数量
				totalMoney += price * buyNum;// 计算订单总金额
				OrderItem item = new OrderItem();
				item.setOrder_id(order.getId());
				item.setProduct_id(entry.getKey().getId());
				item.setBuynum(buyNum);
				// 将订单中的每一个商品即每一个订单项添加到一个list集合中保存
				list.add(item);
			}
			//设置订单总价
			order.setMoney(totalMoney);
			// 5.调用addOrder方法添加订单
			try {
				orderService.addOrder(order);
				//遍历OrderItem的List集合，根据Order的情况更新OrderItem表
				//并检查库存是否合理，对库存进行更新
				for (OrderItem orderItem : list) {
					// 检查购买数量(orderItem.buyNum)是否小于等于库存数量(Product.pnum)
					// 获取购买数量
					int buyNum = orderItem.getBuynum();
					// 获取库存数量
					// >>获取商品id
					String pid = orderItem.getProduct_id();
					// >>查询商品信息
					Product prod = productService.findProductById(pid);
					int pnum = prod.getPnum();
					if (buyNum > pnum) {// 如果购买数量大于库存数量
						throw new Exception("库存数量不足, 订单添加失败!");
					}
					orderItemService.addOrderItem(orderItem);
					productService.updateProductNumById(pid, prod.getPnum() - buyNum);
				}
			} catch (Exception e) {
				response.getWriter().write("<h1 style='color:red;text-align:center'>"+ e.getMessage() + "</h1>");
				return;
			}
			// 6.订单添加后清空购物车中的商品
			map.clear();
			// 7.添加成功回到订单列表页面
			response.sendRedirect("findOrderListByUserId");
		}
	}
	//查询到所有订单
	@RequestMapping("/findOrderListByUserId")
	public void FindOrderListByUserId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String encode="utf-8";
		request.setCharacterEncoding(encode);
		response.setContentType("text/html;charset=" + encode);
		
		// 1.获取当前登陆用户
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			response.getWriter().write("<a href='" + request.getContextPath()+ "/login.jsp'>请先登录！</a>");
		} else {
			List<OrderInfo> orderInfoList = new ArrayList<OrderInfo>();
			
			// 2.根据用户id查询该用户的所有订单信息
			List<Order> orderList=orderService.findOrdersByUserId(user.getId());
			//2.遍历每一个订单, 通过订单id查询当前订单中包含的所有订单项信息
			for (Order order : orderList) {
				String orderId = order.getId();
				//根据订单id查询所有订单子项信息
				List<OrderItem> orderItems = orderItemService.findOrderItemByOrderId(orderId);
				//3.遍历每一个订单项, 通过订单子项获取商品信息及商品的购买数量
				Map<Product, Integer> map = new HashMap<Product, Integer>();
				for (OrderItem orderItem : orderItems) {
					//3.1.获取商品id, 通过商品id查询商品信息, 返回Product对象
					Product product = productService.findProductById(orderItem.getProduct_id());
					//3.2.将商品信息和购买数量存入map中
					System.out.println(product);
					map.put(product, orderItem.getBuynum());
				}
				//4.将订单信息和所有的订单项信息存入OrderInfo中
				//OrderInfo由商品信息及商品的购买数量组成的<Product,Integer>Map以及订单Order对象封装
				OrderInfo orderInfo = new OrderInfo();
				orderInfo.setOrder(order);
				orderInfo.setMap(map);
				//5.将一个完整的订单信息存入List集合中
				orderInfoList.add(orderInfo);
				System.out.println(order);
			}
			// 3.将该用户的所有订单信息的list集合存入request域中, 转发到order_list.jsp中显示
			request.setAttribute("list", orderInfoList);
			request.getRequestDispatcher("/order_list.jsp").forward(request,response);
		}
	}
	/**
	 *  1.更新界面
		2.根据order_id在orderItem中查询所有删除的product
		3.更新指定的产品products-pnum库存
		4.删除orders表下的指定的id的数据
		5.删除订单，删除orderItem下的指定的order_id的数据.
	 * @param order_id
	 * @throws Exception
	 */
	//删除指定的订单
	@RequestMapping("/deleteOrderByOrderId")
	public ModelAndView DeleteOrderById(String order_id) throws Exception{
		
		List<OrderItem> orderItems_del=orderItemService.findOrderItemByOrderId(order_id);
		
		for(OrderItem orderItem:orderItems_del){
			Product prod=productService.findProductById(orderItem.getProduct_id());
			productService.updateProductNumById(orderItem.getProduct_id(), prod.getPnum() + orderItem.getBuynum());
		}
		
		orderService.deleteOrderById(order_id);
		orderItemService.deleteOrderItemByOrderId(order_id);
		
		return new ModelAndView("redirect:findOrderListByUserId");
	}
	
	/**
	 * 实现分页查询订单列表
	 * @param request
	 * @param response
	 * @param page
	 * @param size
	 * @throws Exception
	 */
	@RequestMapping("/findOrdersByPage")
	public void FindOrdersByPage(HttpServletRequest request,HttpServletResponse response,@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,@RequestParam(name = "size",required = true,defaultValue = "5")Integer size) throws Exception {
		
		if(request.getSession().getAttribute("merchant")==null)
			request.getRequestDispatcher("/merchant_failer.jsp").forward(request,response);
		
		List<Order> all_orders_list=orderService.findOrderByPage(page, size);			
		PageInfo<Order> pageInfo=new PageInfo<Order>(all_orders_list);
		
        request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("psize", size);
        
        request.getRequestDispatcher("/merchant_orders-list.jsp").forward(request,response);
    }
	
	@RequestMapping("/findOrderByOrderId")
	public void FindOrderByOrderId(String orderId,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
 		Order order=orderService.findOrderByOrderId(orderId);

		List<OrderInfo> orderInfoList = new ArrayList<OrderInfo>();
		
		List<OrderItem> orderItems = orderItemService.findOrderItemByOrderId(orderId);
		Map<Product, Integer> map = new HashMap<Product, Integer>();
		for (OrderItem orderItem : orderItems) {
			Product product = productService.findProductById(orderItem.getProduct_id());
			map.put(product, orderItem.getBuynum());
		}
	
		OrderInfo orderInfo = new OrderInfo();
		orderInfo.setOrder(order);
		orderInfo.setMap(map);
		orderInfoList.add(orderInfo);
		
		request.setAttribute("list", orderInfoList);
		String username=userService.findUserNameByUserId(order.getUser_id());
		request.setAttribute("order_user", username);
		request.getRequestDispatcher("/merchant_orders-show.jsp").forward(request,response);
	}


}
