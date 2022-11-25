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
			response.getWriter().write("<a href='"+request.getContextPath()+"/login.jsp'>���ȵ�¼��</a>");
		} else {
			// 2.��ȡ��������(����ȡ�����а�����Щ��Ʒ����Ʒ��������)���������ݷ�װ��JavaBean��
			//���ȥ�������ɶ���
			Order order = new Order();
			order.setId(UUID.randomUUID().toString());
			order.setPaystate(0);// Ĭ����0��ʾδ֧��
			order.setReceiverinfo(request.getParameter("receiverinfo"));
			order.setUser_id(user.getId());
			//�������¼����id����Ʒid�Լ���������
			List<OrderItem> list = new ArrayList<OrderItem>();
			double totalMoney=0;
			//ͨ�����ﳵmap��ȡ��������OrderItem�Լ������ܼ�
			Map<Product, Integer> map = (Map<Product, Integer>) request
					.getSession().getAttribute("cartmap");
			for (Map.Entry<Product, Integer> entry : map.entrySet()) {
				double price = entry.getKey().getPrice();// ��ǰ��Ʒ�ĵ���
				int buyNum = entry.getValue();// ��������
				totalMoney += price * buyNum;// ���㶩���ܽ��
				OrderItem item = new OrderItem();
				item.setOrder_id(order.getId());
				item.setProduct_id(entry.getKey().getId());
				item.setBuynum(buyNum);
				// �������е�ÿһ����Ʒ��ÿһ����������ӵ�һ��list�����б���
				list.add(item);
			}
			//���ö����ܼ�
			order.setMoney(totalMoney);
			// 5.����addOrder������Ӷ���
			try {
				orderService.addOrder(order);
				//����OrderItem��List���ϣ�����Order���������OrderItem��
				//��������Ƿ�����Կ����и���
				for (OrderItem orderItem : list) {
					// ��鹺������(orderItem.buyNum)�Ƿ�С�ڵ��ڿ������(Product.pnum)
					// ��ȡ��������
					int buyNum = orderItem.getBuynum();
					// ��ȡ�������
					// >>��ȡ��Ʒid
					String pid = orderItem.getProduct_id();
					// >>��ѯ��Ʒ��Ϣ
					Product prod = productService.findProductById(pid);
					int pnum = prod.getPnum();
					if (buyNum > pnum) {// ��������������ڿ������
						throw new Exception("�����������, �������ʧ��!");
					}
					orderItemService.addOrderItem(orderItem);
					productService.updateProductNumById(pid, prod.getPnum() - buyNum);
				}
			} catch (Exception e) {
				response.getWriter().write("<h1 style='color:red;text-align:center'>"+ e.getMessage() + "</h1>");
				return;
			}
			// 6.������Ӻ���չ��ﳵ�е���Ʒ
			map.clear();
			// 7.��ӳɹ��ص������б�ҳ��
			response.sendRedirect("findOrderListByUserId");
		}
	}
	//��ѯ�����ж���
	@RequestMapping("/findOrderListByUserId")
	public void FindOrderListByUserId(HttpServletRequest request,HttpServletResponse response) throws Exception{
		String encode="utf-8";
		request.setCharacterEncoding(encode);
		response.setContentType("text/html;charset=" + encode);
		
		// 1.��ȡ��ǰ��½�û�
		User user = (User) request.getSession().getAttribute("user");
		if (user == null) {
			response.getWriter().write("<a href='" + request.getContextPath()+ "/login.jsp'>���ȵ�¼��</a>");
		} else {
			List<OrderInfo> orderInfoList = new ArrayList<OrderInfo>();
			
			// 2.�����û�id��ѯ���û������ж�����Ϣ
			List<Order> orderList=orderService.findOrdersByUserId(user.getId());
			//2.����ÿһ������, ͨ������id��ѯ��ǰ�����а��������ж�������Ϣ
			for (Order order : orderList) {
				String orderId = order.getId();
				//���ݶ���id��ѯ���ж���������Ϣ
				List<OrderItem> orderItems = orderItemService.findOrderItemByOrderId(orderId);
				//3.����ÿһ��������, ͨ�����������ȡ��Ʒ��Ϣ����Ʒ�Ĺ�������
				Map<Product, Integer> map = new HashMap<Product, Integer>();
				for (OrderItem orderItem : orderItems) {
					//3.1.��ȡ��Ʒid, ͨ����Ʒid��ѯ��Ʒ��Ϣ, ����Product����
					Product product = productService.findProductById(orderItem.getProduct_id());
					//3.2.����Ʒ��Ϣ�͹�����������map��
					System.out.println(product);
					map.put(product, orderItem.getBuynum());
				}
				//4.��������Ϣ�����еĶ�������Ϣ����OrderInfo��
				//OrderInfo����Ʒ��Ϣ����Ʒ�Ĺ���������ɵ�<Product,Integer>Map�Լ�����Order�����װ
				OrderInfo orderInfo = new OrderInfo();
				orderInfo.setOrder(order);
				orderInfo.setMap(map);
				//5.��һ�������Ķ�����Ϣ����List������
				orderInfoList.add(orderInfo);
				System.out.println(order);
			}
			// 3.�����û������ж�����Ϣ��list���ϴ���request����, ת����order_list.jsp����ʾ
			request.setAttribute("list", orderInfoList);
			request.getRequestDispatcher("/order_list.jsp").forward(request,response);
		}
	}
	/**
	 *  1.���½���
		2.����order_id��orderItem�в�ѯ����ɾ����product
		3.����ָ���Ĳ�Ʒproducts-pnum���
		4.ɾ��orders���µ�ָ����id������
		5.ɾ��������ɾ��orderItem�µ�ָ����order_id������.
	 * @param order_id
	 * @throws Exception
	 */
	//ɾ��ָ���Ķ���
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
	 * ʵ�ַ�ҳ��ѯ�����б�
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
