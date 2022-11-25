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
		
		//У������
		if(username == null || "".equals(username)){
			request.setAttribute("LoginMsg","�û�������Ϊ�գ�");
			request.getRequestDispatcher("/merchant_login.jsp").forward(request, response);
			return;
		}
		if(password == null || "".equals(password)){
			request.setAttribute("LoginMsg","���벻��Ϊ�գ�");
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
			request.setAttribute("LoginMsg","�û������������,�����µ�¼��");
			request.getRequestDispatcher("merchant_login.jsp").forward(request, response);
			return;
		}
	}
	
	@RequestMapping("/register")
	public void register(HttpServletRequest request,HttpServletResponse response) throws Exception{

		//�����������
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
		
		String username = request.getParameter("username").trim();
		String password = request.getParameter("password").trim();
		String password2 = request.getParameter("password2").trim();
		String email = request.getParameter("email").trim();
		
		String path="/merchant_register.jsp";
		System.out.println(request.getContextPath());
		//У������
		if(username == null || "".equals(username)){
			request.setAttribute("msg","�̼�������Ϊ�գ�");
			//ת����ע��ҳ�������ʾ
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(password == null || "".equals(password)){
			request.setAttribute("msg","���벻��Ϊ�գ�");
		
			//ת����ע��ҳ�������ʾ
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(password2 == null || "".equals(password2)){
			request.setAttribute("msg","���ٴ��������룡");
			//ת����ע��ҳ�������ʾ
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(!password.equals(password2)){
			request.setAttribute("msg", "�����������벻һ��");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(password.length()<6||password.length()>16){
			request.setAttribute("msg","���볤��Ӧ��6~16֮�䣡");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(email == null || "".equals(email)){
			request.setAttribute("msg","�����ַ����Ϊ�գ�");
			//ת����ע��ҳ�������ʾ
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		if(!email.matches("^\\w+@\\w+(\\.\\w+)+$")){
			request.setAttribute("msg", "�����ַ��ʽ����");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
	
		Merchant merchant=merchantService.findUserByMerchantName(username);
		
		if(merchant!=null){
			request.setAttribute("msg","���̼����ѱ�ע�ᣡ");
			request.getRequestDispatcher(path).forward(request, response);
			return;
		}
		else{	
			Merchant newMerchant=new Merchant();
			newMerchant.setUsername(username);
			newMerchant.setPassword(password);
			newMerchant.setEmail(email);
			merchantService.addMerchant(newMerchant);
			//ע��ɹ�������ʾ��Ϣ, 3��֮����ת����ҳ
			response.getWriter().write("<h1 style='text-align:center; color:red;'>��ϲ��, ע��ɹ�! 3��֮��ǰ����¼...</h1>");
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
