package com.gitee.pulanos.pangu.showcases.dubbo.api.dto;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;

/**
 * 用户信息出参
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class UserOutDto implements Serializable {

   private static final long serialVersionUID = 1L;

   /**
    * 姓名
    */
   private String name;

   /**
    * 用户类型
    */
   private String userType;

   /**
    * 年龄
    */
   private Integer age;

   /**
    * 所属组织ID
    */
   private Long orgId;



}
