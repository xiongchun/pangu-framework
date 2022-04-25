---
title: 如何发布微服务 (HTTP API)
tags: [快速开始,网关, API]
sidebar_position: 25
slug: /quick-start/how-to-create-http-api
---
<head>
  <title>盘古开发框架 | 网关开发模式简介 | 如何开发 HTTP API 接口</title>
  <meta name="keywords" content="盘古开发框架 | 网关开发模式简介 | 如何开发 HTTP API 接口" />
  <meta name="description" content="盘古开发框架是一套轻量稳健的工业级分布式微服务开发治理框架（兼容单体分层架构）" />
</head>

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

在上文[《如何开发微服务应用》](/docs/quick-start/how-to-make-microservice-architecture-app)中，已经介绍了如何开发一个微服务应用以及微服务模块之间的互相调用。本文介绍如何将微服务发布为 HTTP 接口供前端调用。

## 技术实现方案
在盘古开发框架下实现将微服务发布为 HTTP 接口有两种方式：一种是基于 Spring MVC 的简单暴露模式；一种是基于 ShenYu 的 网关开发模式。

|<div style={{width:'100px'}}>-</div>| 基于 Spring MVC | 基于 Apache ShenYu 网关
--- | --- | ---
底层技术 | Servlet 阻塞模型，依赖 Servlet 容器 | Webflex 非阻塞模型，依赖 Netty
性能 | 一般 | 流量配置动态化，性能极高，网关消耗在 1~2ms
复杂度 | 简单直接 | 开发部署运维相对复杂
Dubbo 集成 | 依赖服务接口 JAR ，显式调用 Dubbo 服务 | 不依赖服务接口 JAR，泛化调用 Dubbo 服务
其它特性 | 需自研 | 支持流量控制、鉴权、熔断、防火墙等

:::caution
上表是从不同维度简单粗暴的以定性的角度给出了一些比较，结论是孤立且脱离项目背景和业务场景的，仅供参考。采用什么样的开发模式不能一概而论，需要综合实际情况酌情选择。
:::

## 编程实战一：基于 Spring MVC 开发
此种模式基于 SpringMVC 通过 Controller 调用后端 Dubbo 服务。依赖 Servlet 容器，需要引入服务接口包。对于 HTTP 接口层面的鉴权、流控等需求都需要自己用Web拦截器来实现。高可用和性能提升可通过Nginx反向代理后端多个 Web 节点实现。

### 安装相关盘古模块

<Tabs defaultValue="dependency3">
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
<TabItem value="dependency3" label="Web模块">

```jsx
<dependency>
    <groupId>com.gitee.pulanos.pangu</groupId>
    <artifactId>pangu-web-spring-boot-starter</artifactId>
</dependency>
```
</TabItem>
<TabItem value="dependency4" label="服务接口包">

```jsx
<dependency>
    <groupId>com.gitee.pulanos.pangu</groupId>
    <artifactId>pangu-examples-dubbo-api</artifactId>
    <version>1.0.0</version>
</dependency>
```

</TabItem>
</Tabs>

### 本地配置

> 为便于理解，本文基于本地配置的方式编写。若改为标准的 Nacos 配置中心模式，请参阅：[配置中心](/docs/advanced-guide/nacos-config-center) 章节。

```jsx
spring.application.name=pangu-examples-webapi-dubbo-service-based
spring.jackson.time-zone=GMT+8

dubbo.protocol.name=dubbo
dubbo.protocol.port=-1 
dubbo.consumer.timeout=5000
dubbo.registry.address=nacos://${nacos.server-addr}?namespace=${nacos.namespace}
dubbo.consumer.check=false

logging.level.root=INFO
```

### 调用微服务接口
可以在任何一个 SpringBean 组件中（针对网关模块而言一般是 Controller 中），引入服务接口后就像本地接口调用一样调用远程服务。Dubbo 将提供高性能的基于代理的远程调用能力，服务以接口为粒度，为开发者屏蔽远程调用底层细节。
如下所示，通过 Cotroller 调用远程服务接口，实现将微服务接口发布为 WebAPI。

```jsx {2,13} title="DemoController.java"
// 注入 Dubbo 服务接口
@Reference(version = "1.0.0", group = "pangu-examples-dubbo-service")
private UserService userService;

/**
 * 通过 Spring MVC 将 Duboo 微服务接口发布为 HTTP API
 * @return
 */
@RequestMapping("/case1")
public Result<List<UserOut>> case1() {
	log.info("call case1...");
	UserIn userIn = new UserIn().setUserType("1");
	List<UserOut> userOuts = userService.listUserOuts(userIn);
	return Result.success(userOuts);
}
```

### 启动入口

```jsx {1}
@EnableDubbo
@SpringBootApplication
public class DubboProviderApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(DubboProviderApplication.class).run(args);
	}
}
```

### 本范例源码
- [pangu-examples-dubbo-api](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-api)：Dubbo 服务接口包
- [pangu-examples-dubbo-service](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-service)：Dubbo 服务提供者
- [pangu-examples-webapi-dubbo-service-based](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-webapi-dubbo-service-based)：基于 SpringMVC 将 Dubbo 服务发布为 HTTP 接口

## 编程实战二：基于 ShenYu 网关开发
ShenYu 网关基于 Webflex 非阻塞模型通过泛化调用后端 Dubbo 服务。依赖 Netty 不需要 Servlet 容器，不需要引入服务接口包。同时网关支持鉴权、动态限流、熔断、防火墙、灰度发布等。

### 安装相关盘古模块

<Tabs defaultValue="dependency3">
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
<TabItem value="dependency2" label="Dubbo 模块">

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
基于 ShenYu 网关开发模式不需要引入 Dubbo 服务接口 Jar，网关会根据服务接口的元数据信息，泛化调用 Dubbo 服务接口。服务接口的元数据信息则根据 Dubbo 服务应用中的配置自动上传到 ShenYu 网关管理系统。此内容在下文会继续讲解。
:::

### 本地配置

> 为便于理解，本文基于本地配置的方式编写。若改为标准的 Nacos 配置中心模式，请参阅：[配置中心](/docs/advanced-guide/nacos-config-center) 章节。

```jsx {24} title="application-dev.yaml"
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
```

##### 关键配置项说明
配置项 | 配置说明  
--- | ---
shenyu.sync.websocket.urls | 表示网关和 ShenYu Admin 之间使用 Websocket 的方式进行数据同步，这里是配置 ShenYu Admin 提供的 Websocket 数据同步服务的地址（支持集群，逗号分割）。

:::info
上表中提到到 ShenYu Admin 是 ShenYu 网关框架的配置 & 元数据管理后台。这里包含了网关模块自己的配置信息也包含了后台服务接口元数据信息，这理的配置信息和元数据信息需要和网关模块同步。ShenYu 支持多种数据同步方案，Websocket 只是盘古开发选用的一种缺省方案。关于网关的更多信息，请参阅：[使用指南->网关系统](/docs/advanced-guide/gateway) 章节。
:::

### 调用微服务接口

基于 ShenYu 的网关开发模式既不需要引入服务接口 JAR，也不需要编写具体的调用代码。完全由网关根据服务接口元数据进行 Dubbo 泛化调用。

:::caution 那么问题来了，网关是如何知道 Dubbo 服务接口元数据的呢？
- 通过 ShenYu Admin 后台系统，『基础配置->元数据管理』菜单，手工新增每一个接口的元数据，然后将数据自动同步到网关模块。（不建议，量大的话太繁琐）
- 对Dubbo服务提供者增加 ShenYu Client 支持，通过在接口方法上使用注解 `@ShenyuDubboClient` 来自动采集上传接口元数据到 ShenYu Admin，然后将数据自动同步到网关模块。（具体实现见下文所述）
:::

#### 改造 Dubbo 服务端，自动上传接口元数据
对原 Dubbo 服务端做一些配置变更，使其能自动将接口元数据上传到 ShenYu Admin 后台系统。
**安装 ShenYu Client 依赖包**
```jsx
<dependency>
	<groupId>org.apache.shenyu</groupId>
	<artifactId>shenyu-spring-boot-starter-client-apache-dubbo</artifactId>
</dependency>
```

**增加配置项**
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

**自动上报服务接口元数据**  
在 Dubbo 服务实现类的方法上使用注解 `@ShenyuDubboClient` 标记，表示该接口方法元数据自动上传到 ShenYu Admin。如下代码所示。

```jsx {5}
@Service(version = "1.0.0", group = "pangu-examples-dubbo-gateway-service")
public class UserServiceImpl implements UserService {

    @Override
    @ShenyuDubboClient(path = "/findUserEntity", desc = "查询用户信息")
    public UserEntity findUserEntity(Long id) {
		...
        return userEntity;
    }
}
```

**配置网关泛化调用 Dubbo 服务所需的注册中心地址**  
通过 ShenYu Admin 后台系统『基础配置->插件管理』菜单，启用 `dubbo插件` 并填入注册中心地址。比如，我测试用的注册中心地址：`nacos://169.188.88.140:1688?namespace=pangu-dev`。如下图所示。

![盘古框架网关](/resources/doc/4-pangu-framework-shenyu-dubbo.png)

**重启服务提供者**  
- 进入 ShenYu Admin 后台系统的『基础配置->元数据管理』菜单，会看到自动上报的服务元数据信息。如下图所示。

![盘古开发网关](/resources/doc/2-pangu-framework-shenyu-metadata.png)
- 进入 ShenYu Admin 后台系统的『插件列表-> proxy -> dubbo』菜单，会看到自动注册的选择器和规则信息。如下图所示。

![盘古开发网关](/resources/doc/3-pangu-framework-shenyu-plugin.png)

### 启动入口

```jsx
@SpringBootApplication
public class WebApiGatewayApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(WebApiGatewayApplication.class).run(args);
	}
}
```

### 网关请求URL

至此，网关就可以调用 Dubbo 服务了。但是，如何确定 Dubbo 服务对应的请求 url 地址呢？
- 由网关模块配置文件可知网关应用端口是 `9090`。
- Dubbo 服务的配置项 shenyu.client.props.contextPath 为 `/dubbo`。
- Dubbo 方法通过 @ShenyuDubboClient 标记的 path 属性为：`/findUserEntity`。  

综上，Dubbo 服务 UserService#findUserEntity 的完整请求地址为：`http://localhost:9090/dubbo/findUserEntity`。

#### 参数说明
通过 http 协议，post 方式访问网关。在 http body 中传入 json 格式的参数。

#### 请求示例
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

### 本范例源码
- [pangu-examples-dubbo-api](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-api)：Dubbo 服务接口包
- [pangu-examples-dubbo-gateway-service](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-gateway-service)：Dubbo 服务提供者（支持接口元数据上传到网关系统）
- [pangu-examples-webapi-gateway-based](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-webapi-gateway-based)：基于 ShenYu 网关将 Dubbo 服务发布为 HTTP 接口

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/docs/community) 寻求更多帮助。