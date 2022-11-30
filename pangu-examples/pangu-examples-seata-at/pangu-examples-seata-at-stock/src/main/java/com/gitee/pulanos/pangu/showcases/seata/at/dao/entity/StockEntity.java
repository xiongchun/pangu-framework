package com.gitee.pulanos.pangu.showcases.seata.at.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;

/**
 * Stock
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-02-15 11:39:52
 */
@Data
@Accessors(chain = true)
@TableName("stock")
public class StockEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * id
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Integer id;

   /**
    * commodity_code
    */
   @TableField(value = "commodity_code")
   private String commodityCode;

   /**
    * count
    */
   @TableField(value = "count")
   private Integer count;

}
