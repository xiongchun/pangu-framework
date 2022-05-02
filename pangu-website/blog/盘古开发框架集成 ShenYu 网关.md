---
slug: pangu-dev-framework-apache-shenyu
title: 盘古开发框架集成 ShenYu 网关
authors: [xiongchun]
tags: [网关,ShenYu,Dubbo,泛化调用]
date: 2022-01-29
description: 盘古开发框架集成 ShenYu 网关
hide_table_of_contents: false
---

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

盘古开发框架下实现微服务网关接口的缺省姿势为基于 pangu-web 模块的传统接口调用模式，具体请参考文档：[如何发布微服务 (API 网关)](/docs/quick-start/how-to-create-http-api)。本文提供另外一种通过集成Apache ShenYu 网关实现泛化调用 Dubbo 服务将其发布为 HTTP 接口的可选方法。

<!--truncate-->

## ShenYu 网关介绍
ShenYu 网关基于 Webflex 非阻塞模型通过泛化调用后端 Dubbo 服务。依赖 Netty 不需要 Servlet 容器，不需要引入服务接口包即可通过 Dubbo 泛化调用服务接口的方式就可以将后端 Dubbo 服务转换为 HTTP API。同时网关支持鉴权、动态限流、熔断、防火墙、灰度发布等。

### 相关名词解释
- **shenyu-admin**  
网关插件和元数据信息配置管理后台。独立 JAR，需要单独部署。
- **shenyu-gateway**  
网关模块，代理 Http 请求，泛化调用后端 Dubbo 服务。此模块负责接收 Http 请求。
- **数据同步**  
数据同步是指在 ShenYu-Admin 后台操作数据以后，使用何种策略将数据同步到 ShenYu Gateway 网关模块。ShenYu 当前支持 ZooKeeper、WebSocket、Http 长轮询、Nacos 、Etcd 和 Consul 进行数据同步。盘古开发使用的是 WebSocket 方式进行数据同步。
- **插件**  
ShenYu 使用插件化设计思想，实现插件的热插拔。内置丰富的插件，包括 RPC 代理、熔断和限流、权限认证、监控等等。
- **选择器**  
每个插件可设置多个选择器，对流量进行初步筛选。
- **规则**  
每个选择器可设置多个规则，对流量进行更细粒度的控制。

### 网关调用结构图
![盘古网关系统](/resources/doc/9-pangu-framework-shenyu.png)

## ShenYu 网关实战
ShenYu 网关提供的功能非常多，这里我们只关注 HTTP 请求代理功能。即代理前端 HTTP 请求，通过 Dubbo 泛化调用后端 Dubbo 服务。
### 安装相关模块

<Tabs defaultValue="parent">
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
	<groupId>org.springframework.boot</groupId>
	<artifactId>spring-boot-starter-webflux</artifactId>
</dependency>
<dependency>
	<groupId>org.apache.shenyu</groupId>
	<artifactId>shenyu-spring-boot-starter-gateway</artifactId>
</dependency>
<dependency>
	<groupId>org.apache.shenyu</groupId>
	<artifactId>shenyu-spring-boot-starter-sync-data-websocket</artifactId>
</dependency>
<dependency>
	<groupId>org.apache.shenyu</groupId>
	<artifactId>shenyu-spring-boot-starter-plugin-apache-dubbo</artifactId>
</dependency>
```
</TabItem>

</Tabs>

:::tip
基于 ShenYu 网关开发模式不需要引入 Dubbo 服务接口 Jar，网关会根据服务接口的元数据信息，泛化调用 Dubbo 服务接口。服务接口的元数据信息则根据 Dubbo 服务应用中的配置自动上传到 ShenYu 网关管理系统。此内容在下文会继续讲解。
:::

### 本地配置  

> 为便于理解，本文基于本地配置的方式编写。若改为标准的 Nacos 配置中心模式，请参阅：[配置中心](/docs/advanced-guide/nacos-config-center) 章节。

```jsx
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
#### 关键配置项说明
- **shenyu.sync.websocket.urls**  
表示网关和 ShenYu Admin 之间使用 Websocket 的方式进行数据同步，这里是配置 ShenYu Admin 提供的 Websocket 数据同步服务的地址（支持集群，逗号分割）。

:::info
上表中提到到 ShenYu Admin 是 ShenYu 网关框架的配置 & 元数据管理后台。这里包含了网关模块自己的配置信息也包含了后台服务接口元数据信息，这理的配置信息和元数据信息需要和网关模块同步。ShenYu 支持多种数据同步方案，Websocket 只是盘古开发选用的一种缺省方案。
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

- **shenyu.client.register-type**  
服务接口元数据采集方式，可选 http 直连模式或配置中心 zookeeper、etcd、consul 和 nacos。盘古开发采集接口元数据缺省选择 http 直接 ShenYu Admin 的方式。
- **shenyu.client.server-lists**  
ShenYu Admin 地址或配置中心地址。集群时多个地址用逗号分开。
- **shenyu.client.props.contextPath**  
本服务在网关中的路由前缀,可自定义按需配置。

**自动上报服务接口元数据**  
在 Dubbo 服务实现类的方法上使用注解 `@ShenyuDubboClient` 标记，表示该接口方法元数据自动上传到 ShenYu Admin。如下代码所示。

```jsx
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
- [pangu-examples-dubbo-gateway-shenyu-service](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-dubbo-gateway-shenyu-service)：Dubbo 服务提供者（支持接口元数据上传到网关系统）
- [pangu-examples-webapi-gateway-shenyu-based](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples/pangu-examples-webapi-gateway-shenyu-based)：基于 ShenYu 网关将 Dubbo 服务发布为 HTTP 接口

## 参考文献
- [如何发布微服务 (API 网关)](/docs/quick-start/how-to-create-http-api)
- [盘古开发框架简介](/docs/intro)