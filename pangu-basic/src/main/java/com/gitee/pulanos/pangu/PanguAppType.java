package com.gitee.pulanos.pangu;

import org.springframework.boot.WebApplicationType;

/**
 * 盘古应用类型
 * <p> WEBNONE, WEBSERVLET, WEBFLUX
 * 
 * @author xiongchun
 * @since 4.0.0
 */
public enum PanguAppType {

    //开发非容器依赖型应用(纯Dubbo后端服务等)
    WEBNONE,
    //传统Servlet容器应用
    WEBSERVLET,
    //WEBFLUX异步非阻塞函数式编程应用
    WEBFLUX;

    static WebApplicationType toWebApplicationType(PanguAppType panguApplicationType) {
        switch (panguApplicationType) {
            case WEBNONE:
                return WebApplicationType.NONE;
            case WEBSERVLET:
                return WebApplicationType.SERVLET;
            case WEBFLUX:
                return WebApplicationType.REACTIVE;
            default:
                return WebApplicationType.SERVLET;
        }
    }
    
}
