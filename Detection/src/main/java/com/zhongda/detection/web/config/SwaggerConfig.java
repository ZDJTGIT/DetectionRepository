package com.zhongda.detection.web.config;

import io.swagger.annotations.Api;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.config.annotation.EnableWebMvc;

import springfox.documentation.builders.ApiInfoBuilder;
import springfox.documentation.builders.RequestHandlerSelectors;
import springfox.documentation.service.ApiInfo;
import springfox.documentation.service.Contact;
import springfox.documentation.spi.DocumentationType;
import springfox.documentation.spring.web.plugins.Docket;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@Configuration
@EnableWebMvc
@EnableSwagger2
public class SwaggerConfig {

	@Bean
    public Docket api() {
        return new Docket(DocumentationType.SWAGGER_2)
        		.select()
        		.apis(RequestHandlerSelectors.withClassAnnotation(Api.class))
        		.build()
                .apiInfo(apiInfo());
	}

	private ApiInfo apiInfo() {
        return new ApiInfoBuilder()
        		.title("中大在线监测平台API接口")
        		.contact(new Contact("罗杰", "http://localhost/Detection", "asd@qq.com"))
        		.description("HTTP对外开放接口")
        		.version("2.7.0")
        		.build();
	}

}