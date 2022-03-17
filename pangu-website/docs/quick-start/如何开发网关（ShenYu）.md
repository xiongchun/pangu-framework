---
title: 如何开发网关（ShenYu）
tags: [快速开始,网关]
sidebar_position: 50
slug: /quick-start/how-to-make-gateway-app/shenyu-based
---
<head>
  <title>盘古开发框架 | 如何开发网关（ShenYu）| 基于 ShenYu 的专业网关开发 </title>
  <meta name="keywords" content="盘古开发框架 | 如何开发网关（ShenYu）| 基于 ShenYu 的专业网关开发" />
  <meta name="description" content="「盘古开发框架」是完全独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发和治理框架（兼容垂直单体分层架构)。它基于 Apache-2.0 协议开源发布，且是免费的。我们希望不仅是开源的受益者，也能成为开源的贡献者，与开源社区一起「共建共享开源生态」。" />
</head>

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

本文介绍基于 ShenYu 的专业网关开发模式。网关开发模式选型参考建议请看上文[《网关开发模式简介》](/docs/quick-start/how-to-make-gateway-app)。

## 网关模块开发

### 安装相关盘古模块

<Tabs>
<TabItem value="parent" label="盘古 Parent">

```jsx
<parent>
	<groupId>com.gitee.pulanos.pangu</groupId>
	<artifactId>pangu-parent</artifactId>
	<version>latest.version.xxx</version>
	<relativePath/>
</parent>
```
</TabItem>
<TabItem value="dependency1" label="基础模块">

```jsx
<dependency>
    <groupId>com.gitee.pulanos.pangu</groupId>
    <artifactId>pangu-spring-boot-starter</artifactId>
</dependency>
```
</TabItem>
<TabItem value="dependency2" label="Dubbo模块">

```jsx
<dependency>
	<groupId>com.gitee.pulanos.pangu</groupId>
	<artifactId>pangu-dubbo-spring-boot-starter</artifactId>
</dependency>
```
</TabItem>
<TabItem value="dependency3" label="网关模块">

```jsx
<dependency>
	<groupId>com.gitee.pulanos.pangu</groupId>
	<artifactId>pangu-gateway-spring-boot-starter</artifactId>
</dependency>
```
</TabItem>

</Tabs>

:::tip
基于 ShenYu 的网关开发模式不需要引入服务接口依赖包，网关会根据服务接口的元数据信息，泛化调用 Dubbo 服务接口。服务接口的元数据信息则根据 Dubbo 服务应用中的配置自动上传到 ShenYu 网关管理系统。此内容在下文会继续讲解。
:::

### 本地配置

> 为便于理解，本文基于本地配置的方式编写。若改为标准的 Nacos 配置中心模式，请参阅：[配置中心](/docs/advanced-guide/nacos-config-center) 章节。

<Tabs>
<TabItem value="application" label="application.yaml">

```jsx
spring:
  profiles:
    active: ${spring.profiles.active:dev}
```
</TabItem>
<TabItem value="application-dev" label="application-dev.yaml">

```jsx {24}
server:
  port: 9090

spring:
  main:
    allow-bean-definition-overriding: true

shenyu:
  cross:
    enabled: true
    allowedHeaders:
    allowedMethods: "*"
    allowedOrigin: "*"
    allowedExpose: "*"
    maxAge: "18000"
    allowCredentials: true
  switchConfig:
    local: true
  file:
    enabled: true
    maxSize : 10
  sync:
    websocket:
      urls: ${shenyu.websocket.urls:ws://localhost:9095/websocket}
  dubbo:
    parameter: multi
  exclude:
    enabled: false
    paths:
      - /favicon.ico
  extPlugin:
    path:
    enabled: true
    threads: 1
    scheduleTime: 300
    scheduleDelay: 30
  scheduler:
    enabled: false
    type: fixed
    threads: 16
  upstreamCheck:
    enabled: false
    timeout: 3000
    healthyThreshold: 1
    unhealthyThreshold: 1
    interval: 5000
    printEnabled: true
    printInterval: 60000

logging:
  level:
    root: info
    org.springframework.boot: info
    org.apache.ibatis: info
    org.apache.shenyu: info
```
</TabItem>
</Tabs>

##### 关键配置项说明
配置项 | 配置说明  
--- | ---
shenyu.sync.websocket.urls | 表示网关和 ShenYu Admin 之间使用 Websocket 的方式进行数据同步，这里是配置 ShenYu Admin 的提供的 Websocket 数据同步服务的地址（支持集群，逗号分割）。

:::caution
上表中提到到 ShenYu Admin 是 ShenYu 网关框架的配置 & 元数据管理后台。这里包含了网关模块自己的配置信息也包含了后台服务接口原数据信息，这理的配置信息和元数据信息需要和网关模块同步。ShenYu 支持多种数据同步方案，Websocket 只是盘古开发选用的一种缺省方案。关于网关的更多信息，请参阅：[使用指南->网关系统](/docs/advanced-guide/gateway) 章节。
:::

### 调用微服务接口

基于 ShenYu 的网关开发模式既不需要引入服务接口 JAR，也不需要编写具体的调用代码。完全由网关根据服务接口元数据进行 Dubbo 泛化调用。

:::danger 那么问题来了，网关是如何知道 Dubbo 服务接口元数据的呢？
- 通过 ShenYu Admin 后台系统，『基础配置->元数据管理』菜单，手工新增每一个接口的元数据，然后将数据自动同步到网关模块。（不建议，量大的话太繁琐）
- 对Dubbo服务提供者增加 ShenYu Client 支持，通过在接口方法上使用注解 `@ShenyuDubboClient` 来自动采集上传接口元数据到 ShenYu Admin，然后将数据自动同步到网关模块。（盘古开发建议使用的标准姿势）如何对 Dubbo 服务提供者增加 ShenYu Client 支持请参阅下文的『[ Dubbo 服务端（网关采集接口元数据）](#dubbo服务端网关采集接口元数据)』章节。
:::

:::info 还有一个问题，网关要实现泛化调用是需要dubbo服务的注册中心的？
- 没错。通过 ShenYu Admin 后台系统『基础配置->插件管理』菜单，启用 `dubbo插件` 并填入注册中心地址。比如，我测试用的注册中心地址：`nacos://169.188.88.140:1688?namespace=pangu-dev`。如下图所示。
:::
![盘古框架网关](/resources/doc/4-pangu-framework-shenyu-dubbo.png)

### 启动入口

```jsx {4}
@SpringBootApplication
public class WebApiGatewayApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(WebApiGatewayApplication.class).run(args);
	}
}
```

## Dubbo服务端（网关采集接口元数据）

网关需要对其代理的后端 Dubbo 服务进行泛化调用，就必须知道服务接口元数据。下文就将对一个普通 Dubbo 服务应用增加 ShenYu Client 支持完成自动采集服务接口元数据功能。

### 安装 ShenYu Client 依赖包
```jsx
<dependency>
	<groupId>org.apache.shenyu</groupId>
	<artifactId>shenyu-spring-boot-starter-client-apache-dubbo</artifactId>
</dependency>
```

### 增加配置项
```jsx
shenyu.client.register-type=http
shenyu.client.server-lists=${shenyu.server-lists:http://localhost:9095}
shenyu.client.props.contextPath=/dubbo
```

配置项 | 配置说明  
--- | ---
shenyu.client.register-type | 服务接口元数据采集方式，可选 http 直连模式或配置中心 zookeeper、etcd、consul 和 nacos。盘古开发采集接口元数据缺省选择 http 直接 ShenYu Admin 的方式。
shenyu.client.server-lists | ShenYu Admin 地址或配置中心地址。集群时多个地址用逗号分开。
shenyu.client.props.contextPath | 本服务在网关中的路由前缀,可自定义按需配置

### 自动上报服务接口元数据
在 Dubbo 服务实现类的方法上使用注解 `@ShenyuDubboClient` 标记，表示该接口方法元数据自动上传到 ShenYu Admin。如下代码所示。

```jsx {5,12}
@Service(version = "1.0.0", group = "pangu-examples-dubbo-gateway-service")
public class UserServiceImpl implements UserService {

    @Override
    @ShenyuDubboClient(path = "/findUserEntity", desc = "查询用户信息")
    public UserEntity findUserEntity(Long id) {
		...
        return userEntity;
    }

    @Override
    @ShenyuDubboClient(path = "/listUserOuts", desc = "查询用户信息列表")
    public List<UserOut> listUserOuts(UserIn userIn) {
        ...
        return userOuts;
    }
}
```

**重启服务提供者：**
- 进入 ShenYu Admin 后台系统的『基础配置->元数据管理』菜单，会看到自动上报的服务元数据信息。如下图所示。
![盘古开发网关](/resources/doc/2-pangu-framework-shenyu-metadata.png)
- 进入 ShenYu Admin 后台系统的『插件列表-> proxy -> dubbo』菜单，会看到自动注册的选择器和规则信息。如下图所示。
![盘古开发网关](/resources/doc/3-pangu-framework-shenyu-plugin.png)

## 完整请求URL及参数说明
至此，就可以通过 http 的方式来请求我们的的 dubbo 服务了。

### 请求URL

:::info 如何确定 dubbo 服务对应的请求 url 地址呢？
由网关模块配置文件可知网关应用端口是 `9090`，dubbo 服务的配置项 shenyu.client.props.contextPath 为 `/dubbo`，我们的 dubbo 方法通过 @ShenyuDubboClient 标记的 path 属性为：`/findUserEntity`。综上，dubbo 服务 UserService#findUserEntity 的完整请求地址为：http://localhost:9090/dubbo/findUserEntity。
:::

### 参数说明
通过 http 协议，post 方式访问网关。在 http body 中传入 json 格式的参数。

### 请求示例
```jsx title="CURL脚本"
curl --location --request POST 'http://127.0.0.1:9090/dubbo/findUserEntity' \
--header 'Content-Type: application/json' \
--data '{id=1}'
```
```jsx title="返回结果"
{
	"code": 200,
	"message": "Access to success!",
	"data": {
		"name": "云南码农大熊",
		"id": 1,
		"userType": 2,
	}
}
```

## 本文相关范例源码
- [pangu-examples-dubbo-api](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-api)：服务接口包
- [pangu-examples-dubbo-gateway-service](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-gateway-service)：服务提供者（支持网关）
- [pangu-examples-webapi-gateway-based](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-webapi-gateway-based)：服务消费者（基于 ShenYu 的网关模块）

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/docs/community) 寻求更多帮助。