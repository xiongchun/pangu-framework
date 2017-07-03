>本教程将带初次接触AOSuite G1开发的用户以最短的时间体验一下AOSuite G1开发的流程。希望能帮助开发者更快的入门或给技术决策者在技术选型调研时作为参考。 本教程以开发一个增删查改的CRUD后台管理模块为例子。（虚拟业务场景：信用卡账户信息管理）

#### §1. 自动生成持久层代码
生成信用卡账户信息表demo_account的Dao相关代码。打开DaoConsole.java，配置 数据库连接信息和Java代码输出路径以及包路径信息，然后执行这个main()方法就可以生成代码。将会输出持久化对象文件：DemoAccountPO.java、数据访问接口文件：DemoAccountDao.java、单表常用SQL映射文件：DemoAccountDao.xml 3个源码文件。

#### §2. 新增功能模块菜单并授权
- 这里是列表文本打开系统管理->功能模块菜单。增加一个模块，请求地址可填入：demoService.initMisc2。
- 这里是列表文本打开系统管理->角色管理菜单。将新增的菜单权限授予超级用户角色。
- 这里是列表文本刷新页面即可在功能导航中看到新增的菜单。（提示：点击菜单后会报错，此时还没有对应的后台实现）

#### §3. 编写Service实现类
新建DemoService.java后台服务实现类。（提示：平台做了抽象封装，这里不需要Controller类）  
[点我查看DemoService代码片段](http://git.oschina.net/osworks/codes/aixs1e97tk530g2n6jwqv72)

#### §4. 编写JSP页面
新建JSP文件misc2.jsp。[在线体验本范例效果](http://http://121.41.231.94/AOSuite) (访问路径：范例 -> 综合实例 -> 实例②-增删改查)  
[点我查看misc2.jsp代码片段](http://git.oschina.net/osworks/codes/dvs4eoqgt5m7r9j12x3bf25)