package com.gitee.pulanos.pangu.framework.handler;

import java.security.spec.InvalidParameterSpecException;
import java.util.Properties;

import cn.hutool.core.util.StrUtil;
import com.alibaba.nacos.api.annotation.NacosInjected;
import com.alibaba.nacos.api.config.ConfigService;
import com.alibaba.nacos.api.exception.NacosException;
import com.gitee.pulanos.pangu.framework.Constants;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.core.env.ConfigurableEnvironment;
import org.springframework.core.env.MutablePropertySources;
import org.springframework.core.env.PropertiesPropertySource;
import org.springframework.stereotype.Component;

/**
 * 应用环境上下文处理
 * 
 * @author xiongchun
 * @since 4.0.0
 */
@Slf4j
@Component
public class EnvironmentHandler {
    
    @Autowired
    private ConfigurableEnvironment configurableEnvironment;

    @NacosInjected
    private ConfigService configService;
    @Value("${nacos.config.data-id}")
    private String dataId;

    /**
     * 设置缺省参数
     */
    public void setDefaultConfigurations() {
        MutablePropertySources mps = configurableEnvironment.getPropertySources();
        Properties p = new Properties();
        p.put("pangu-powered-by", "PULANOS");
        mps.addFirst(new PropertiesPropertySource("defaultProperties", p));
    }

    /**
     * 启动后的环境确认检查点
     */
    public void confirmChecks() throws NacosException {
        String cfgText = configService.getConfig(dataId, Constants.Nacos.DEFAULT_GROUP, 10000);
        if (StrUtil.isEmpty(cfgText)){
            String errMsg = "连接配置中心失败或配置中心未对该应用创建配置信息。排查建议：1）确认连接信息；2）在配置中心为此应用创建配置信息。";
            throw new IllegalStateException(errMsg);
        }else {
            log.info("ConfirmChecks PASSED.");
        }
    }

}
