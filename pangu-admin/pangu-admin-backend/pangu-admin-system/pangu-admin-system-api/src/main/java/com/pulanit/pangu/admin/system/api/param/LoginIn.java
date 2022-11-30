package com.pulanit.pangu.admin.system.api.param;

import lombok.Data;
import lombok.experimental.Accessors;

import javax.validation.constraints.NotEmpty;
import java.io.Serializable;

/**
 * 用户登录入参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class LoginIn implements Serializable {

   private static final long serialVersionUID = -2176980417334973101L;

   @NotEmpty(message = "用户名不能为空")
   private String userName;

   @NotEmpty(message = "密码不能为空")
   private String password;


}
