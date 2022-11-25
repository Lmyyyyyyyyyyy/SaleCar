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
		//�����������Ҫ������֤��ͼƬ��	
		response.setDateHeader("Expires",-1);
		response.setHeader("Cache-Control", "no-cache");
				
		VerifyCode vc=new VerifyCode();		
		//��ͼƬ���浽response�������У�����Ӧ�������
		vc.drawImage(response.getOutputStream());	
		//��ȡͼƬ�ϵ���֤��
		String code=vc.getCode();
		//����֤���ı����浽session�С����ں��ڵ�У��
		request.getSession().setAttribute("code",code);
	}

}
