---
title: 如何发布微服务 (Web API)
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
在盘古开发框架下实现将微服务发布为 HTTP 接口有两种方式。一种是基于 pangu-web 模块的接口调用模式；一种是基于 ShenYu 网关的泛化调用模式。

### Pangu-Web 模块的接口调用模式
- **实现原理**  
基于 Spring MVC，依赖 Servlet 容器。
- **Dubbo 集成**  
依赖接口 JAR ，接口调用 Dubbo 服务。
- **性能 & 复杂度**  
性能高，开发简单，部署运维简单。
- **其它特性**  
  - 支持跨域配置、流量控制、鉴权、熔断、白名单等（配置简单且与盘古开发框架浑然一体）。
  - 提供了Controller聚合层，可一定程度上减少了微服务之间的循环依赖和调用。

### ShenYu 网关的泛化调用模式
- **实现原理**  
基于 Webflex，依赖 Netty 框架。
- **Dubbo 集成**  
不依赖接口 JAR，泛化调用 Dubbo 服务。
- **性能 & 复杂度**  
网关自身性能较高（Webflex非阻塞模型），但泛化调用性能有损耗（10%~20%）。开发部署运维极其复杂，带来的成本不可小觑。
- **其它特性**  
支持流量控制、鉴权、熔断等（配置复杂）。

:::caution
上述是从不同维度简单粗暴的以定性的角度给出了一些比较，结论是孤立且脱离项目背景和业务场景的，仅供参考。采用什么样的开发模式不能一概而论，需要综合实际情况酌情选择。但对于大部分盘古开发项目而言，我们推荐整体性价比较高的方案一。当然，如果您的项目背景适合使用 ShenYu网关，我们也给出了详细的集成方案。详见：[盘古开发框架集成 Apache ShenYu 网关](/blog/pangu-dev-framework-apache-shenyu)。
:::

## 编程实战一：基于 Spring MVC 开发
此种模式基于 SpringMVC 通过 Controller 调用后端 Dubbo 服务。依赖 Servlet 容器，需要引入服务接口包。对于 HTTP 接口层面的鉴权、流控等需求都需要基于Web拦截器来实现（盘古已经在Starter中实现，只需配置即可使用）。高可用和性能提升可通过Caddy/Nginx 充当 API 网关 反向代理后端多个 Web 节点实现。

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
盘古开发框架下发布 Dubbo 服务为 HTTP 接口的缺省标准姿势已调整为基于 pangu-web 模块的传统接口调用模式（见上文）。基于 ShenYu 网关的开发模式已降级为一种可选方案，其文档已迁移到了博客专栏。详见：[盘古开发框架集成 Apache ShenYu 网关](/blog/pangu-dev-framework-apache-shenyu)。

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/docs/community) 寻求更多帮助。