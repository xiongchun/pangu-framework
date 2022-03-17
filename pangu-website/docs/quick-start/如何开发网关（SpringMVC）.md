---
title: 如何开发网关（SpringMVC）
tags: [快速开始,网关]
sidebar_position: 40
slug: /quick-start/how-to-make-gateway-app/springmvc-based
---
<head>
  <title>盘古开发框架 | 如何开发网关（SpringMVC）| 基于 SpringMVC 的简单网关开发 </title>
  <meta name="keywords" content="盘古开发框架 | 如何开发网关（SpringMVC） | 基于 SpringMVC 的简单网关开发" />
  <meta name="description" content="「盘古开发框架」是完全独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发和治理框架（兼容垂直单体分层架构)。它基于 Apache-2.0 协议开源发布，且是免费的。我们希望不仅是开源的受益者，也能成为开源的贡献者，与开源社区一起「共建共享开源生态」。" />
</head>

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

本文介绍基于 SpringMVC 的简单网关开发模式。网关开发模式选型参考建议请看上文[《网关开发模式简介》](/docs/quick-start/how-to-make-gateway-app)。

## 安装相关盘古模块

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

:::tip
基于 SpringMVC 的网关开发模式需要引入服务接口依赖包。
:::

## 本地配置

> 为便于理解，本文基于本地配置的方式编写。若改为标准的 Nacos 配置中心模式，请参阅：[配置中心](/docs/advanced-guide/nacos-config-center) 章节。

<Tabs>
<TabItem value="application" label="application.properties">

```jsx
spring.profiles.active=${spring.profiles.active:dev}
```
</TabItem>
<TabItem value="application-dev" label="application-dev.properties">

```jsx {7}
spring.application.name=pangu-examples-dubbo-service

dubbo.protocol.name=dubbo
dubbo.protocol.port=20880
dubbo.consumer.timeout=5000
#服务注册中心地址
dubbo.registry.address=nacos://${nacos.server-addr}?namespace=${nacos.namespace}
dubbo.consumer.check=false

logging.level.root=INFO
logging.level.com.gitee.pulanos.pangu=INFO
```
</TabItem>
</Tabs>

## 调用微服务接口
可以在任何一个 SpringBean 组件中（针对网关模块而言一般是 Controller 中），引入服务接口后就像本地接口调用一样调用远程服务。Dubbo 将提供高性能的基于代理的远程调用能力，服务以接口为粒度，为开发者屏蔽远程调用底层细节。
如下所示，通过 Cotroller 调用远程服务接口，实现将微服务接口发布为 WebAPI。

```jsx {2,13} title="DemoController.java"
// 注入服务接口
@Reference(version = "1.0.0", group = "pangu-examples-dubbo-service")
private UserService userService;

/**
 * 通过SpringMVC将Duboo微服务接口发布为WebAPI
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
:::caution
这种通过 SpringMVC 发布 API 的模式并非盘古开发的标准姿势，只是提供这么一种开发模式选项。
:::

## 启动入口

```jsx {1,5}
@EnableDubbo
@SpringBootApplication
public class DubboProviderApplication {
	public static void main(String[] args) {
		PanGuApplicationBuilder.init(DubboProviderApplication.class).run(args);
	}
}
```

## 完整请求 URL 及参数说明
至此，就可以通过 http 的方式来请求我们的的 dubbo 服务了。此种开发模式完全基于 SpringMVC，其请求地址和参数说明等信息本教程不再展开叙述。如有需要，请自行查阅 SpringMVC 请求和响应的相关教程即可。

## 本文相关范例源码
- [pangu-examples-dubbo-api](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-api)：服务接口包
- [pangu-examples-dubbo-service](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-service)：服务提供者
- [pangu-examples-dubbo-gateway-service](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-gateway-service)：基于 SpringMVC 的网关模块（服务消费者）

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/docs/community) 寻求更多帮助。