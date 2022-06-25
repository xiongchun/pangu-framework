---
slug: tlog
title: TLog 助力盘古框架实现微服务链路日志追踪
authors: [xiongchun]
tags: [TLog]
date: 2022-01-32
description: TLog 助力盘古框架实现微服务链路日志追踪
hide_table_of_contents: false
---

随着微服务盛行，很多公司都把系统按照业务边界拆成了很多微服务。因此业务链路贯穿着很多微服务节点，导致定位某个请求的日志以及上下游业务的日志会变得非常困难。
<!--truncate-->
为了解决这一痛点， 业界也有诸多成熟方案。如 SkyWalking，Pinpoint 等，但其运维成本和数据存储成本均不可小觑。如果有相应的资源去做那它们自然是不二之选。 但如果你资源有限，那么这里给出一个非常轻量的通过集成 TLog 来解决日志追踪问题的方案。

## TLog 是什么？
TLog 提供了一种最简单的方式来解决日志追踪问题，它不收集日志，也不需要另外的存储空间，它只是自动的对你的日志进行打标签，自动生成 TraceId 贯穿你微服务的一整条链路中。并且提供上下游节点信息。

## 集成 TLog
盘古开发框架已将 TLog 作为缺省标准组件集成进盘古基础模块：`pangu-spring-boot-starter`。

## 如何使用
### 第一步：依赖盘古基础模块
```jsx
<dependency>
        <groupId>com.gitee.pulanos.pangu</groupId>
        <artifactId>pangu-spring-boot-starter</artifactId>
</dependency>
```

### 第二步：启动类调用日志增强方法
```jsx
static {
        AspectLogEnhance.enhance();
}
```

### 第三步：分别构造盘古消费者微服务和生产者微服务  
参见如下盘古范例模块。[获取代码](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-examples)
- pangu-examples-dubbo-service 服务生产者
- pangu-examples-webapi-dubbo-service-based 服务消费者

## 查看日志输出效果
我们在一个 Dubbo 服务消费者和一个 Dubbo 服务生产者应用中分别做如上配置后，就可以在每个调用链的日志里看到 TLog 自定嵌入的 TraceId 标签值 `10812814178142336`。如下所示。

```jsx
消费端：
2022-06-23 14:40:50 INFO 47050 - [nio-8080-exec-1] c.x.DemoController : < 0 >< 10812814178142336 > call case1...
生产端：
2022-06-23 14:40:50 INFO 46395 - [:20881-thread-4] c.x.UserServiceImpl : < 0.1 >< 10812814178142336 > 参数userIn：UserInDto(name=null, userType=1)
```