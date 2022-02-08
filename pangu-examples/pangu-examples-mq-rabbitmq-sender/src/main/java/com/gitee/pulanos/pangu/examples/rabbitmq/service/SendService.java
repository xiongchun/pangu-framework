/*
 * Licensed to the Apache Software Foundation (ASF) under one or more
 * contributor license agreements.  See the NOTICE file distributed with
 * this work for additional information regarding copyright ownership.
 * The ASF licenses this file to You under the Apache License, Version 2.0
 * (the "License"); you may not use this file except in compliance with
 * the License.  You may obtain a copy of the License at
 *
 *     http://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */

package com.gitee.pulanos.pangu.examples.rabbitmq.service;

import cn.hutool.core.date.DateUtil;
import lombok.extern.slf4j.Slf4j;
import org.springframework.amqp.rabbit.core.RabbitTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

/**
 * 生产者
 *
 * @author xiongchun
 */
@Slf4j
@Component
public class SendService {

    @Autowired
    private RabbitTemplate rabbitTemplate;

    /**
     * 基于Fanout交换机的消息发送
     * @return
     */
    public void sendMsg1FanoutBased(){
        String msg = "我是云南大熊(Fanout), " + DateUtil.now();
        // 参数说明：参数1：交换机名称。  参数2：routing key  参数3：消息内容
        rabbitTemplate.convertAndSend("exchange-fanout", "", msg);
        log.info("消息发送成功");
    }

    /**
     * 基于Direct交换机的消息发送
     * @return
     */
    public void sendMsg1DirectBased(String routingKey){
        String msg = "我是云南大熊(Direct), " + DateUtil.now();
        // 参数说明：参数1：交换机名称。  参数2：routing key  参数3：消息内容
        rabbitTemplate.convertAndSend("exchange-direct", routingKey, msg);
        log.info("消息发送成功");
    }
}
