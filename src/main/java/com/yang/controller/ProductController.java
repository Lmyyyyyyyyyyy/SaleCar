package com.yang.controller;

import com.github.pagehelper.PageInfo;
import com.yang.domain.OrderItem;
import com.yang.domain.Product;
import com.yang.service.IOrderItemService;
import com.yang.service.IProductService;
import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

@Controller
@RequestMapping("product")
public class ProductController {

	@Autowired
	private IProductService productService;
	
	@Autowired
	private IOrderItemService orderItemService;
	 
	@RequestMapping("/showAllProducts")
	//�����������ȫ����Ʒ��ʾ������Ʒ
	public String ShowAllProduct(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		List<Product> allProducts=productService.findAllProducts();
		request.setAttribute("list", allProducts);
		for (Product product : allProducts){
			System.out.println(product);
		}
		
		return "prod_list";
	}

	
	@RequestMapping("/findProductsByCondition")
	public String FindProductsByCondition(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		//�����������
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=utf-8");
				
		// 1.��ȡ����(��Ʒ���ơ���Ʒ���ࡢ��ͼ۸���߼۸�)
		String name = request.getParameter("name");
		String category = request.getParameter("category");
		String minPrice = request.getParameter("minprice");
		String maxPrice = request.getParameter("maxprice");
		// 2.Ϊ������������Ĭ��ֵ, ����������Ƿ�Ϸ�
		String _name = "";
		String _category = "";
		double _minPrice = 0;
		double _maxPrice = Double.MAX_VALUE;

		// 3.������������Ƿ�Ϸ�
		if (name != null && !"".equals(name.trim())) {
			_name = name;
		}
		if (category != null && !"".equals(category.trim())) {
			_category = category;
		}
		String reg = "^\\d+$";
		if (minPrice != null && !"".equals(minPrice.trim())
				&& minPrice.matches(reg)) {
			_minPrice = Double.parseDouble(minPrice);
		}
		if (maxPrice != null && !"".equals(maxPrice.trim())
				&& maxPrice.matches(reg)) {
			// ��߼۸�������ڵ�����ͼ۸�
			if (Double.parseDouble(maxPrice) >= _minPrice) {
				_maxPrice = Double.parseDouble(maxPrice);
			}
		}
		
		List<Product> suit_products = productService.findProductsByCondition(_name, _category, _minPrice, _maxPrice);
		request.setAttribute("list", suit_products);
		return "prod_list";
	}
	
	@RequestMapping("/findProductInfo")
	public String FindProductInfo(HttpServletRequest request) throws Exception{
		
		String pid=request.getParameter("pid");
		Product product = productService.findProductById(pid);
		request.setAttribute("prod", product);
		System.out.println(product);
		return "prod_info";
	}
	
	//�˴���Ҫ����SpringMVC�����˵�WEB-INF/upload/**
	@RequestMapping("/findProductImgByUrl")
	public void FindProductImgByUrl(HttpServletRequest request,HttpServletResponse response) throws Exception{
		
		request.getRequestDispatcher(request.getParameter("imgurl")).forward(request, response);	
	}
	
	@RequestMapping("/findAllProductsByPage")
	public String FindAllProductsByPage(HttpServletRequest request,HttpServletResponse response,@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,@RequestParam(name = "size",required = true,defaultValue = "20")Integer size) throws Exception{
		
		if(request.getSession().getAttribute("merchant")==null)
			return "merchant_failer";
		List<Product> allProducts=productService.findAllProductsByPage(page,size);
		
		PageInfo<Product> pageInfo=new PageInfo<Product>(allProducts);
		
	    request.setAttribute("pageInfo", pageInfo);
        request.setAttribute("psize", size);
        
        List<String> Different_Product_Ids=orderItemService.findAllDistinctProductId();
        Map<String, Integer> map=new HashMap<String, Integer>();
        
        for(String product_id:Different_Product_Ids){
            List<OrderItem> orderItems=orderItemService.findOrderItemsByProductId(product_id);
            Integer buynum=0;
            for(OrderItem o:orderItems){
            	buynum+=o.getBuynum();
            }
            map.put(product_id, buynum);
        }
        request.setAttribute("map", map);
        
		return "merchant_products-list";
	}

	@RequestMapping("/updateProduct")
	public String UpdateProduct(@ModelAttribute Product product,HttpServletRequest request,HttpServletResponse response) throws Exception{
		System.out.println(product);
		productService.updateProduct(product);
		return "redirect:findAllProductsByPage";
	}

	@RequestMapping("/addProduct")
	public String AddProduct(@ModelAttribute Product product, HttpServletRequest request ,MultipartFile pictureFile) throws Exception{
	
		//������Ҫ���к����޸ģ�����������ƷID�Լ��Ƿ����»�������
		//������ƷID
		String prod_id = UUID.randomUUID().toString();
		
		String pic_name = UUID.randomUUID().toString().replaceAll("-", "");
		//��ȡ�ļ�����չ��
		String pic_ext = FilenameUtils.getExtension(pictureFile.getOriginalFilename());
		
		//����ͼƬ�ϴ�·��/EasyMall_SSM_Wq/WebRoot/WEB-INF/upload/add
		String url = request.getSession().getServletContext().getRealPath("/WEB-INF/upload/add");
	
		//�Ծ���·���������������ͼƬ
		File newfile=new File(url+"/"+pic_name + "." + pic_ext);
		//�����ڷ�����������Ŀ���ļ�����
		pictureFile.transferTo(newfile);
		 //��ͼƬ�洢·�����浽���ݿ�
		product.setId(prod_id);
		product.setImgurl("/WEB-INF/upload/add/"+pic_name + "." + pic_ext);
		productService.addProduct(product);
		System.out.println(product);
		
		return "redirect:findAllProductsByPage";
	}
	
	@RequestMapping("/deleteProductsByProductId")
	public String DeleteProductsByProductId(String[] ids) throws Exception{
		for(String id:ids){
			if(orderItemService.findOrderItemsByProductId(id).size()==0){
				productService.deleteProductsByProductId(id);
			}
		}
		return "redirect:findAllProductsByPage";
	}
}
