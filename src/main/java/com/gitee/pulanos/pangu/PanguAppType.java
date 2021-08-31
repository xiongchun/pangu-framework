package com.gitee.pulanos.pangu;

import com.gitee.pulanos.pangu.exception.BizException;
import org.springframework.boot.WebApplicationType;

/**
 * 盘古应用类型
 * <p> WEBNONE, WEBSERVLET, WEBFLUX
 * 
 * @author xiongchun
 * @since 4.0.0
 */
public enum PanguAppType {

    /**
     * The application should not run as a web application and should not start an
     * embedded web server.
     */
    NONSERVLET,

    /**
     * The application should run as a servlet-based web application and should start an
     * embedded servlet web server.
     */
    WEBSERVLET,

    /**
     * The application should run as a reactive web application and should start an
     * embedded reactive web server.
     */
    REACTIVE;

    static WebApplicationType toWebApplicationType(PanguAppType panguApplicationType) {
        switch (panguApplicationType) {
            case NONSERVLET:
                return WebApplicationType.NONE;
            case WEBSERVLET:
                return WebApplicationType.SERVLET;
            case REACTIVE:
                return WebApplicationType.REACTIVE;
            default:
                throw new IllegalArgumentException("不被支持的应用类型标识");
        }
    }
    
}
