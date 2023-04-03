---
title: 基于 WebMVC 接口调用模式
tags: [快速开始,网关, API]
sidebar_position: 5
slug: /quick-start/gateway/webmvc
---
<head>
  <title>盘古开发框架 | 网关开发模式简介 | 如何开发 HTTP API 接口</title>
  <meta name="keywords" content="盘古开发框架 | 网关开发模式简介 | 如何开发 HTTP API 接口" />
  <meta name="description" content="盘古开发框架是一套轻量稳健的工业级分布式微服务开发治理框架（兼容单体分层架构）" />
</head>

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

此种模式基于 WebMVC 通过 Controller 调用后端 Dubbo 服务。依赖 Servlet 容器，需要引入 Dubbo 服务接口包。对于 HTTP 接口层面的鉴权、流控等需求都需要基于拦截器来实现。高可用和性能提升可通过Caddy/Nginx 充当 API 流量网关反向代理后端多个 Web 节点实现。

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

pangu.web.cross-origin=true

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

```jsx title="DemoController.java"
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

```jsx
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
- [pangu-examples-webapi-dubbo-service-based](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-webapi-dubbo-service-based)：基于 Spring Controller 将 Dubbo 服务发布为 HTTP 接口

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/community) 寻求更多帮助。