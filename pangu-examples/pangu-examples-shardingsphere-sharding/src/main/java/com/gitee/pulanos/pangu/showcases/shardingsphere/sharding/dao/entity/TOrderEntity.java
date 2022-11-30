package com.gitee.pulanos.pangu.showcases.shardingsphere.sharding.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;

/**
 * 逻辑表:订单表
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-04-01 21:41:27
 */
@Data
@Accessors(chain = true)
@TableName("t_order")
public class TOrderEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * order_id
    */
   @TableId(value = "order_id", type = IdType.ASSIGN_ID)
   private Long orderId;

   /**
    * user_id
    */
   @TableField(value = "user_id")
   private Integer userId;

   /**
    * status
    */
   @TableField(value = "status")
   private String status;

}
