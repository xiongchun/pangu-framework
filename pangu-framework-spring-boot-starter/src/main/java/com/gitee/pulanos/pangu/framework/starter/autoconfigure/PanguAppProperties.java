package com.gitee.pulanos.pangu.framework.starter.autoconfigure;

import cn.hutool.core.lang.UUID;
import cn.hutool.core.util.IdUtil;
import lombok.Data;
import org.springframework.boot.context.properties.ConfigurationProperties;

/**
 * PanguAppProperties
 *
 * @author xiongchun
 */
@Data
@ConfigurationProperties(prefix = "pangu.app")
public class PanguAppProperties {

    /**
     * 盘古应用ID标识(缺省："")
     */
    private String appId = "";

}
