package com.gitee.pulanos.pangu.showcases.seata.at.service;

import com.gitee.pulanos.pangu.showcases.seata.api.dto.BuyDto;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import static org.junit.Assert.*;

@RunWith(SpringRunner.class)
@SpringBootTest
public class MainBizServiceTest {

    @Autowired
    private MainBizService mainBizService;

    @Test
    public void buyItems() {
        BuyDto buyDto = new BuyDto();
        buyDto.setCount(2);
        buyDto.setMoney(10);
        buyDto.setCommodityCode("C001");
        buyDto.setUserId("U001");
        mainBizService.buyItems(buyDto);
    }
}