package com.gitee.pulanos.pangu.framework.handler;

import java.util.Properties;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.stereotype.Component;

/**
 * 环境变量处理
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Component
public class EnvironmentHandler {
    
    @Autowired
    private ConfigurableEnvironment configurableEnvironment;
    
    public void setDefaultConfigurations() {
        MutablePropertySources mps = configurableEnvironment.getPropertySources();
        Properties p = new Properties();
        p.put("pangu-powered-by", "PULANOS");
        mps.addFirst(new PropertiesPropertySource("defaultProperties", p));
    }
}
