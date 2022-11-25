package com.yang.controller;

import com.yang.service.IProductService;
import com.yang.utils.VerifyCode;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;


@Controller
@RequestMapping("image")
public class ImageController {
	
	@Autowired
	private IProductService productService;
	
	@RequestMapping("/valiImage")
	public void ValiImage(HttpServletRequest request,HttpServletResponse response) throws IOException{
		//控制浏览器不要缓存验证码图片。	
		response.setDateHeader("Expires",-1);
		response.setHeader("Cache-Control", "no-cache");
				
		VerifyCode vc=new VerifyCode();		
		//将图片保存到response缓冲区中，再响应给浏览器
		vc.drawImage(response.getOutputStream());	
		//获取图片上的验证码
		String code=vc.getCode();
		//将验证码文本保存到session中。用于后期的校验
		request.getSession().setAttribute("code",code);
	}

}
