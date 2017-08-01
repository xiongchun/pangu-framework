>AOSuite部署可以很方便的支持单机部署和集群部署。 详见下文逐一分解。

#### §1. 打包
AOSuite当前版本使用IDE自带的ANT做为打包工具。在src/resources/release有两个打包文件：aos.war.pro.xml和aos.war.test.xml，分别对应生产环境的打包脚本和测试环境的打包脚本。 为什么将其分开呢？主要是为了在打包过程中可以工具目标环境动态的修改和设置一些参数信息。（比如：数据库连接信息等。）打开任意一个脚本文件，完成相关参数的修改后，右键执行run as Ant Build命令即可完成打包输出。具体配置细节和可能会出错的地方在后面的视频讲解部分会有相关说明。

#### §2. 单机部署
AOSuite支持部署到Tomcat7+、Weblogic10+等应用服务器，当前支持JDK1.6和JDK1.7，以后升级Spring后将支持JDK1.8(+)，具体部署方法这里就没必要赘述了。提示 由于Redis是我们的标配组件，因此无论是单机部署还是集群部署都需要先安装Redis中间件。关于Redis的安装，网上已经有太多现成资料，请大家自行完成，这里也不再赘述。

#### §3. 集群部署
AOSuite将会话信息集中存储到了Redis，因此我们在进行集群部署时将会非常方便，不需要做任何的会话同步等配置即可实现应用层线性扩展。本文以nginx+tomcat的组合讲解一下AOSuite的集群部署方式。其中nginx充当反向代理服务器(也可以是apache、haproxy等)，tomcat充当应用服务器(也可以是weblogic等)。 提示 这种模式，nginx节点是会产生单点故障的，但对于大部分应用来说，这个故障概率是可以接受的。当然，如果你的应用场景需要不惜增加复杂性来保障高可用的话，可以再组合一些HA中间件(如：keepalived、heatbeat等)来解决反向代理服务器的单点故障问题，这里就不深入展开了。因为我个人一向推崇最小、可用、性价比、持续迭代；严厉反对脱离现实因素不计成本的假大空方案。

下面为nginx配置文件的主要片段。1台nginx服务器：192.168.1.10；2台tomcat服务器：192.168.1.11和192.168.1.12。配置后集群入口为：http://192.168.1.10/AOSuite 。
```
    upstream tomcats {                        
        server 192.168.1.11:8080 weight=1;
        server 192.168.1.12:8080 weight=1;
    }
    
    location /AOSuite {
         proxy_pass http://tomcats;
         proxy_redirect off;
         proxy_set_header HOST $host;
         proxy_set_header X-Real-IP $remote_addr;
         proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
         client_max_body_size 10m;
         client_body_buffer_size 128k;
         proxy_connect_timeout 60s;
         proxy_read_timeout 300s;
         proxy_send_timeout 300s;      
     }
```
 :fa-bullhorn: 提示：更多nginx的安装配置细节可以自行研究，网上的这方面资料已经非常丰富了。这里就不再做详细介绍。