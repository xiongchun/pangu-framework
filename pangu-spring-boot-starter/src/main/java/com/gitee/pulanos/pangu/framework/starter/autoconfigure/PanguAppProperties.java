package com.gitee.pulanos.pangu.framework.starter.autoconfigure;

import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * PanguAppProperties
 *
 * @author xiongchun
 */
@Data
@ConfigurationProperties(prefix = "pangu")
public class PanguAppProperties {

    /**
     * 盘古应用ID标识(缺省："")
     */
    private String appId = "";

}
