package com.theday.config;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.ResourceHandlerRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;

import com.theday.common.FileManagerService;
import com.theday.interceptor.PermissionInterceptor;

@Configuration
public class WebMvcConfig implements WebMvcConfigurer {

	private Logger log = LoggerFactory.getLogger(WebMvcConfig.class);

	@Autowired
	private PermissionInterceptor interceptor;
	@Override
	public void addResourceHandlers(ResourceHandlerRegistry registry) {
		String path = "file:///" + FileManagerService.windowFileUploadPath;

		if(!System.getProperty("os.name").contains("Window")) {
			path = "file:" + FileManagerService.linuxFileUploadPath;
		}
		registry
		.addResourceHandler("/images/**") 	// ** 모든 주소
		.addResourceLocations(path);
	}

	@Override
	public void addInterceptors(InterceptorRegistry registry) {
		registry.addInterceptor(interceptor)
		.addPathPatterns("/**")// **아래 디렉토리까지 확인
		.excludePathPatterns("/static/**","/error","/user/sign_out"); //권한 검사 하지 않는 Path 예외
		
	}
	
}
