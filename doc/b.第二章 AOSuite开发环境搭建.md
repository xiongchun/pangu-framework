>AOSuite缺省使用最传统的工程搭建方式和ANT(IDE内置)资源依赖管理，目的是为不同阶段的同学提供便利、减少环境配置障碍，争取入门零门槛。 提示：如果你是maven或gradle用户，可下载后自行改装使用。

#### §1. 环境准备 
- 安装Java1.7。
- 安装Eclipse JavaEE(建议)。其它Java IDE也是支持的，或许需要你做些稍微的改动。
- 安装Redis。这是AOSuite的标配组件，必须安装的。 下载Windows版本 下载Linux版本
数据初始化。请先安装数据库软件，目前支持MySQL5.5(+)。执行src/resources/sql路径下对应版本的*.sql脚本文件。

#### §2. 工程导入   
以Eclipse为例，其它IDE请自行完成。菜单File -> Import -> Existing Projects into Workspace，选择源码工程根路径后按提示操作即可完成导入。提示：导入后如果出现编译错误，请自行调整选择自己的JDK编译依赖。

#### §3. 启动 
- 找到src/resources/aos.properties配置文件，根据你的实际情况修改Redis连接信息和数据库连接信息。
- 找到aos.framework.AOS.java类，右键 -> Debug As -> Java Application即可启动。提示 平台内置了jetty，开发调试过程不需要再依赖其它Servlet容器（如：tomcat等。）建议 开发过程都 以Debug AS的方式启动，而不是Run AS方式，否则断点将无法工作，修改Java代码也不能及时生效；重启服务器，请确保通过console工具栏的红色按钮将上一次启动关闭，否则会端口冲突。

#### §4. 访问   
在启动成功的控制台会输出系统访问地址，根据地址直接访问即可。受支持的浏览器为：Chrome、Firefox、Safari、IE10+及其变种、其它webkit内核浏览器。提示：缺省配置下，为节省开发时间系统将模拟超级用户自动登录，相关设置可以在键值参数功能模块中修改。