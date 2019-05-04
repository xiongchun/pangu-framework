#### 获取源代码
从源码托管网站 https://gitee.com/osworks/MyClouds 获取源代码。可以通过git/svn/zip下载的方式获取。（具体步骤略）
#### 安装依赖中间件
- Java（1.8+）
- Redis(KV缓存数据库)  
  windows版本通过这里可以下载：https://github.com/MicrosoftArchive/redis/releases  
  其它版本可直接从官网下载：https://redis.io  
  （安装过程略，请自行完成）
- Consul(服务注册&发现中间件)  
  下载地址：https://www.consul.io/downloads.html  
  启动命令：`consul.exe agent -dev`  
  Web控制台：http://127.0.0.1:8500
- Maven  
  请自行安装和配置。  
#### 系统管理库表&基础数据初始化
  从myclouds-admin-server/src/main/resources/db/文件夹中找到对应数据库的sql脚本文件。如：myclouds-mysql.sql，并执行此脚本。
#### 运行MyClouds  
  本文以Eclipse为例，其它IDE请自行完成。
- 导入MyClouds Maven项目  
  执行命令`File -> Import -> Maven -> Existing Maven Projects`。选中MyClouds根目录（如：`E:/git/MyClouds`）完成导入。
  >  :fa-info-circle: 提示：项目依赖了lombok，导入后可能有编译错误，需要为Eclipse增加lombok的编译支持。lombok安装方法：https://www.projectlombok.org/setup/eclipse
- 修改配置中心的配置数据  
  分别打开myclouds-config-server/src/main/resources/config/路径下的myclouds-admin-server-dev.yml和myclouds-admin-webserver-dev.yml文件，修改myclouds-admin-server工程和myclouds-admin-webserver工程对应的配置数据。
- install依赖工程  
  分别在myclouds-domain工程和myclouds-common上面执行`Maven install`命令。（`工程右键 -> Run as -> Maven install`）
- 启动项目  
  依次启动myclouds-config-server配置中心、myclouds-admin-server工程、myclouds-admin-webserver工程。  
  启动成功后访问：http://127.0.0.1 即可进入登录页面。  
  登录账号：root 密码：111111
  ![输入图片说明](https://images.gitee.com/uploads/images/2018/1001/001211_69b123ff_431745.png "2018-10-01_001107.png")
#### 后记  
  上述为写给普通用户比较简单通用且不容易出错的环境搭架方法。对于各路大仙请忽略，你可以使用自己偏爱的方法和工具来完成环境搭建工作。