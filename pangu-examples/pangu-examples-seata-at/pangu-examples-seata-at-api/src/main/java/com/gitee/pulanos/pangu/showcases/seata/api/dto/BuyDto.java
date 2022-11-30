package com.gitee.pulanos.pangu.showcases.seata.api.dto;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 用户下单入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class BuyDto implements Serializable {

   private static final long serialVersionUID = 1L;

   /**
    * user_id
    */
   private String userId;

   /**
    * commodity_code
    */
   private String commodityCode;

   /**
    * count
    */
   private Integer count;

   /**
    * money
    */
   private Integer money;

}
