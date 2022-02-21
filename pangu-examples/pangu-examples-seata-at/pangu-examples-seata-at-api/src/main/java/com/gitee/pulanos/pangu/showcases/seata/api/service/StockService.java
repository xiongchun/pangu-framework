package com.gitee.pulanos.pangu.showcases.seata.api.service;

import com.gitee.pulanos.pangu.showcases.seata.api.dto.BuyDto;

/**
 * @author xiongchun
 */
public interface StockService {

    /**
     * 扣减库存
     * @param buyDto
     */
    void decreaseStock(BuyDto buyDto);
}
