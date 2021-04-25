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

    WEBNONE, WEBSERVLET, WEBFLUX;

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
