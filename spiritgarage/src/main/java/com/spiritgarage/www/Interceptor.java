package com.spiritgarage.www;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.spiritgarage.www.admin.vo.MngrVO;

@Configuration
public class Interceptor extends HandlerInterceptorAdapter{
	
	/**
	 * 컨트롤러 실행 전에 동작함. 리턴값이 true 인 경우 정상동작 , false 인 경우 컨트롤러 진입하지 않음.
	 */
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		return true;
	}
	
	/**
	 * 컨트롤러 진입 후 view 를 랜더링 하기 전 실행됨. modelAndView 를 통해 전달값등을 조작 할수있음.
	 */
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {
		
		HttpSession session = request.getSession();
		MngrVO vo = (MngrVO)session.getAttribute("mngrInfo");
		
		String header = request.getHeader("x-requested-with");
		
		if(vo != null) {
			
			String url = request.getRequestURL().toString();
			int pos = url.lastIndexOf("/");
			
			if(!"XMLHttpRequest".equals(header)) {
				modelAndView.addObject("mngrSeq", vo.getMngrSeq());
				modelAndView.addObject("id",vo.getId());
				modelAndView.addObject("name",vo.getName());
				modelAndView.addObject("activeUrl",url.substring(pos + 1));
			}
		}else{
			if(!"XMLHttpRequest".equals(header)) {
				modelAndView.setViewName("/admin");
			}
		}
		
		super.postHandle(request, response, handler, modelAndView);
	}
	
	/**
	 * 컨트롤러 진입 후 view 까지 랜더링 한 후 최후에 실행됨.
	 */
	@Override
	public void afterCompletion(HttpServletRequest request, HttpServletResponse response, Object handler, Exception ex)
			throws Exception {
		
		super.afterCompletion(request, response, handler, ex);
	}
	
	/**
	 * 비동기 요청시 postHandle , afterCompletion 을 건너뛰고 실행됨.
	 */
	@Override
	public void afterConcurrentHandlingStarted(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		
		super.afterConcurrentHandlingStarted(request, response, handler);
	}
}
