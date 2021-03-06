package com.spiritgarage.www;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

@Configuration
public class WebMvcConfig  implements WebMvcConfigurer{
	
	@Autowired
	private Interceptor interceptor;
	
	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor).addPathPatterns("/admin/*").excludePathPatterns("/admin/loginValidation").excludePathPatterns("/admin/noticeImageUpload");
		WebMvcConfigurer.super.addInterceptors(registry);
	}
	
}
