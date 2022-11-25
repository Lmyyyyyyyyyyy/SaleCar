package com.yang.controller;

import com.github.pagehelper.PageInfo;
import com.yang.domain.SLog;
import com.yang.service.ILogService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.List;

@Controller
@RequestMapping("log")
public class  LogController {
	
	@Autowired
	private ILogService logService;
	
	@RequestMapping("/findAllSysLog")
	public ModelAndView FindAllSysLog(@RequestParam(name = "page",required = true,defaultValue = "1")Integer page,@RequestParam(name = "size",required = true,defaultValue = "15")Integer size) throws Exception{
		
		ModelAndView  mv=new ModelAndView();
		List<SLog> logList=logService.findAllSysLog(page,size);

		PageInfo<SLog> pageInfo=new PageInfo<SLog>(logList);
		mv.addObject("pageInfo", pageInfo);
		mv.addObject("psize", size);
		mv.addObject("log",logList);
		mv.setViewName("merchant-logs");
		
		return mv;
	}
	@RequestMapping("/deleteLogById")
	public String DeleteLogById(String[] ids) throws Exception{
		for(String id:ids)
			logService.deleteLogById(id);	
		return "redirect:findAllSysLog";
	}
}
