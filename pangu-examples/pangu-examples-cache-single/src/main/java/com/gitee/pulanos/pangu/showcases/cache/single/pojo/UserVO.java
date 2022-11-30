package com.gitee.pulanos.pangu.showcases.cache.single.pojo;

import lombok.Data;
import lombok.experimental.Accessors;

import java.io.Serializable;
import java.util.Date;

/**
 * @author xiongchun
 */
@Data
@Accessors(chain = true)
public class UserVO implements Serializable {

   private static final long serialVersionUID = 1L;

   /**
    * 流水号
    */
   private Long id;

   /**
    * 姓名
    */
   private String name;

   /**
    * 生日
    */
   private Date birthday;

   /**
    * 年龄
    */
   private Integer age;

   /**
    * 创建时间
    */
   private Date gmtCreate;

}
