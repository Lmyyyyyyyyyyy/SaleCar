package com.yang.controller;

import com.yang.domain.User;
import com.yang.service.IUserService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.net.URLEncoder;

@Controller
@RequestMapping("user")
public class UserController {

	@Autowired
	private IUserService userService;

	@RequestMapping("/login")
	public void login(String username,String password,String remname,HttpServletRequest request,HttpServletResponse response) throws Exception{
		//校验数据
		if(username == null || "".equals(username)){
			request.setAttribute("LoginMsg","用户名不能为空！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(password == null || "".equals(password)){
			request.setAttribute("LoginMsg","密码不能为空！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		if(password.length()<6||password.length()>16){
			request.setAttribute("LoginMsg","密码长度应在6~16之间！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
			return;
		}
		//记住用户名
		if("true".equals(remname)){
			Cookie cookie=new Cookie("remname",URLEncoder.encode(username,"utf-8"));
			cookie.setMaxAge(60*60*24*30);   //设置一个月有效期
			cookie.setPath(request.getContextPath()+"/");  //设置访问路径
			response.addCookie(cookie);
		}else{
			Cookie cookie=new Cookie("remname",URLEncoder.encode(username,"utf-8"));
			cookie.setMaxAge(0);
			cookie.setPath(request.getContextPath()+"/");  //设置访问路径
			response.addCookie(cookie);
		}
		User user = userService.findUserByUserName(username);
		if(user!=null){
			String corr_password=user.getPassword();
			if(corr_password.equals(password)){
				request.getSession().setAttribute("user", user);
				response.sendRedirect(request.getContextPath()+"/index.jsp");
				System.out.println(user);
			}
		}
		else{
			request.setAttribute("LoginMsg","用户名或密码错误,请重新登录！");
			request.getRequestDispatcher("/login.jsp").forward(request, response);
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
		String nickname = request.getParameter("nickname").trim();
		String email = request.getParameter("email").trim();
		String valistr = request.getParameter("valistr").trim();

		//校验数据
		if(username == null || "".equals(username)){
			request.setAttribute("msg","用户名不能为空！");
			//转发回注册页面进行提示
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if(password == null || "".equals(password)){
			request.setAttribute("msg","密码不能为空！");
			//转发回注册页面进行提示
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if(password2 == null || "".equals(password2)){
			request.setAttribute("msg","请再次输入密码！");
			//转发回注册页面进行提示
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if(!password.equals(password2)){
			request.setAttribute("msg", "两次密码输入不一致");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if(email == null || "".equals(email)){
			request.setAttribute("msg","邮箱地址不能为空！");
			//转发回注册页面进行提示
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if(!email.matches("^\\w+@\\w+(\\.\\w+)+$")){
			request.setAttribute("msg", "邮箱地址格式错误");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		if( valistr== null || "".equals(valistr)){
			request.setAttribute("msg","验证码不能为空！");
			//转发回注册页面进行提示
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		// 验证码是否正确校验
		String code=(String)request.getSession().getAttribute("code");
		if(!valistr.equalsIgnoreCase(code)){//不区分大小写
			request.setAttribute("msg","验证码不正确！");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		//检查是否重复提交
		String token1=request.getSession().getAttribute("token").toString();
		String token2=request.getParameter("token");
		if(token1==null||token2==null||!token1.equals(token2)){
			throw new RuntimeException("不要重复提交数据！");
		}else{
			//正确操作后
			//清除session域存储的token值而不清除request域中token参数值，此时
			//session域存储的token值与request域中token参数值不同，点击之后提示重复提交
			request.getSession().removeAttribute("token");
		}
		User user=userService.findUserByUserName(username);

		if(user!=null){
			request.setAttribute("msg","该用户名已被注册！");
			request.getRequestDispatcher("/register.jsp").forward(request, response);
			return;
		}
		else{
			User newUser=new User();
			newUser.setUsername(username);
			newUser.setPassword(password);
			newUser.setEmail(email);
			newUser.setNickname(nickname);
			userService.addUser(newUser);
			//注册成功给出提示信息, 3秒之后跳转到首页
			response.getWriter().write("<h1 style='text-align:center; color:red;'>恭喜您, 注册成功! 3秒之后跳转到首页...</h1>");
			response.setHeader("refresh", "3;url="+request.getContextPath()+"/index.jsp");
			System.out.println(newUser);
		}
	}

}
