package com.pulanit.pangu.admin.system.api.param;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

/**
 * 用户查询入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class LoginIn implements Serializable {

   private static final long serialVersionUID = 1L;

   /**
    * 姓名
    */
   private String name;

   /**
    * 用户类型
    */
   @NotEmpty(message = "用户类型不能为空")
   private String userType;

}
