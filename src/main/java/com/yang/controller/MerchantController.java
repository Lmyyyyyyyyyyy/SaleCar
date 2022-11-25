package com.yang.controller;

import com.yang.domain.Merchant;
import com.yang.domain.Order;
import com.yang.service.IMerchantService;
import com.yang.service.IOrderService;
import com.yang.service.IProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("merchant")
public class MerchantController {

	@Autowired
	private IMerchantService merchantService;
	@Autowired
	private IOrderService orderService;
	
	@Autowired
	private IProductService productService;
	@RequestMapping("/login")
	public void login(String username,String password,HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		//校验数据
		if(username == null || "".equals(username)){
			request.setAttribute("LoginMsg","用户名不能为空！");
			request.getRequestDispatcher("/merchant_login.jsp").forward(request, response);
			return;
		}
		if(password == null || "".equals(password)){
			request.setAttribute("LoginMsg","密码不能为空！");
			request.getRequestDispatcher("/merchant_login.jsp").forward(request, response);
			return;
		}	
		Merchant merchant = merchantService.findUserByMerchantName(username);
		if(merchant!=null){
			String corr_password=merchant.getPassword();
			if(corr_password.equals(password)){
				request.getSession().setAttribute("merchant", merchant);
				response.sendRedirect(request.getContextPath()+"/merchant/initAllData");
			}
		}
		else{
			request.setAttribute("LoginMsg","用户名或密码错误,请重新登录！");
			request.getRequestDispatcher("merchant_login.jsp").forward(request, response);
			return;
		}
	}
	
	@RequestMapping("/register")
	public void register(HttpServletRequest request,HttpServletResponse response) throws Exception{

		//解决乱码问题
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String password2 = request.getParameter("password2").trim();
		String email = request.getParameter("email").trim();
		
		String path="/merchant_register.jsp";
		System.out.println(request.getContextPath());
		//校验数据
		if(username == null || "".equals(username)){
			request.setAttribute("msg","商家名不能为空！");
			//转发回注册页面进行提示
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(password == null || "".equals(password)){
			request.setAttribute("msg","密码不能为空！");
		
			//转发回注册页面进行提示
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(password2 == null || "".equals(password2)){
			request.setAttribute("msg","请再次输入密码！");
			//转发回注册页面进行提示
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(!password.equals(password2)){
			request.setAttribute("msg", "两次密码输入不一致");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(password.length()<6||password.length()>16){
			request.setAttribute("msg","密码长度应在6~16之间！");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(email == null || "".equals(email)){
			request.setAttribute("msg","邮箱地址不能为空！");
			//转发回注册页面进行提示
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(!email.matches("^\\w+@\\w+(\\.\\w+)+$")){
			request.setAttribute("msg", "邮箱地址格式错误");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
	
		Merchant merchant=merchantService.findUserByMerchantName(username);
		
		if(merchant!=null){
			request.setAttribute("msg","该商家名已被注册！");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		else{	
			Merchant newMerchant=new Merchant();
			newMerchant.setUsername(username);
			newMerchant.setPassword(password);
			newMerchant.setEmail(email);
			merchantService.addMerchant(newMerchant);
			//注册成功给出提示信息, 3秒之后跳转到首页
			response.getWriter().write("<h1 style='text-align:center; color:red;'>恭喜您, 注册成功! 3秒之后前往登录...</h1>");
			response.setHeader("refresh", "3;url="+request.getContextPath()+"/merchant_login.jsp");
		}
	}
	
	@RequestMapping("/initAllData")
	public String InitAllData(HttpServletRequest request) throws Exception{
		
		List<Order> all_unpay_orders_list=orderService.findAllOrderUnPay();
		Integer today_num=orderService.findOrdersNumToday();
		
		Integer today_money=orderService.findOrdersMoneyToday();
		Integer yestoday_money=orderService.findOrdersMoneyYestoday();
		
		Integer all_products_num=productService.findAllProductsNum();
		
		request.setAttribute("today_num", today_num);
		request.setAttribute("today_money", today_money);
		request.setAttribute("yestoday_money", yestoday_money);
		request.setAttribute("all_products_num", all_products_num);
		request.setAttribute("list", all_unpay_orders_list);
		if(request.getSession().getAttribute("merchant")!=null)
			return "merchant_index";
		return "merchant_failer";
	}
}
