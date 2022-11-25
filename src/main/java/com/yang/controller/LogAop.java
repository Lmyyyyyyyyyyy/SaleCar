package com.yang.controller;

import com.yang.domain.Merchant;
import com.yang.domain.SLog;
import com.yang.domain.User;
import com.yang.service.ILogService;
import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.Signature;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
import org.aspectj.lang.reflect.MethodSignature;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;
import org.springframework.web.bind.annotation.RequestMapping;

import javax.servlet.http.HttpServletRequest;
import java.lang.reflect.Method;
import java.util.Date;
import java.util.UUID;

@Component
@Aspect
public class LogAop {

    @Autowired
    private HttpServletRequest request;

    @Autowired
    private ILogService logService;

    private Date visitTime; 
    private Class clazz; 
    private Method method;

    @Before("execution(* com.yang.controller.*.*(..))")
    public void doBefore(JoinPoint jp) throws NoSuchMethodException {
        visitTime = new Date();
        clazz = jp.getTarget().getClass();
        String methodName = jp.getSignature().getName();
        Object[] args = jp.getArgs();
        if (args == null || args.length == 0) {
            method = clazz.getMethod(methodName);
        } else {
        	Signature sig=jp.getSignature();
        	MethodSignature  msig=null;
        	if (!(sig instanceof MethodSignature)) {
                throw new IllegalArgumentException("该注解只能用于方法");
            }
        	msig=(MethodSignature) sig;
        	Class[] parameterTypes = msig.getMethod().getParameterTypes();
        	method = jp.getTarget().getClass().getMethod(methodName, parameterTypes);
        }
    }
    //后置通知
    @After("execution(* com.yang.controller.*.*(..))")
    public void doAfter(JoinPoint jp) throws Exception {
        long time = new Date().getTime() - visitTime.getTime(); //获取访问的时长
        String url = "";
        if (clazz != null && method != null && clazz != LogAop.class&&clazz!=LogController.class&&clazz!=UserController.class) {
            RequestMapping classAnnotation = (RequestMapping) clazz.getAnnotation(RequestMapping.class);
            if (classAnnotation != null) {
                String[] classValue = classAnnotation.value();
         
                RequestMapping methodAnnotation = method.getAnnotation(RequestMapping.class);
                if (methodAnnotation != null) {
                    String[] methodValue = methodAnnotation.value();
                    url = classValue[0] + methodValue[0];
                    String ip = request.getRemoteAddr();
                    Merchant merchant=(Merchant)request.getSession().getAttribute("merchant");
                    User user=(User)request.getSession().getAttribute("user");  
                    if(merchant!=null&&user==null){
	                    String username = merchant.getUsername();
	                    SLog log = new SLog();
	                    log.setId(UUID.randomUUID().toString());
	                    log.setExecutionTime((int)time); 
	                   
	                    log.setIp(ip);
	                    log.setMethod("[类] " + clazz.getName() + "[方法] " + method.getName());
	                    log.setUrl(url);
	                    log.setUsername(username);
	                    log.setVisitTime(visitTime);
	                    logService.save(log);
                    }
                }
            }
        }

    }
}
