package com.gitee.pulanos.pangu.showcases.seata.at.dao.entity;

import com.baomidou.mybatisplus.annotation.*;
import lombok.Data;
import lombok.experimental.Accessors;
import java.io.Serializable;

/**
 * Account
 * <p>此文件由代码生成器自动生成</p>
 *
 * @author 普蓝开源社区
 * @date 2022-02-15 11:40:43
 */
@Data
@Accessors(chain = true)
@TableName("account")
public class AccountEntity implements Serializable {

   private static final long serialVersionUID=1L;

   /**
    * id
    */
   @TableId(value = "id", type = IdType.AUTO)
   private Integer id;

   /**
    * user_id
    */
   @TableField(value = "user_id")
   private String userId;

   /**
    * money
    */
   @TableField(value = "money")
   private Integer money;

}
