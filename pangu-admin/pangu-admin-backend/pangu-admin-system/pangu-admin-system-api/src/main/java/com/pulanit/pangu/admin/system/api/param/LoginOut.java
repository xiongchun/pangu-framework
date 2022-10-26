package com.pulanit.pangu.admin.system.api.param;

import com.pulanit.pangu.admin.system.api.domain.UserInfo;
import lombok.Builder;
import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 用户信息出参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class LoginOut implements Serializable {

   private static final long serialVersionUID = 1L;

   /**
    * TOKEN
    */
   private String token;

   /**
    * 用户信息
    */
   private UserInfo userInfo;

}
