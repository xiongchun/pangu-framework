---
title: 简介
tags: [盘古简介,盘古架构]
sidebar_position: 1
slug: /intro
---

# 简介

<head>
  <title>盘古开发框架 | 简介 | 架构设计范式和指导原则 | 主要功能特性| 盘古框架模块列表 | 盘古开发框架 | 盘古框架的进化史 | FAQ </title>
  <meta name="keywords" content="盘古开发框架 | 简介 | 架构设计范式和指导原则 | 主要功能特性| 盘古框架模块列表 | 盘古开发框架 | 盘古框架的进化史 | FAQ" />
  <meta name="description" content="「盘古开发框架」是完全独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发和治理框架（兼容垂直单体分层架构)。它基于 Apache-2.0 协议开源发布，且是免费的。我们希望不仅是开源的受益者，也能成为开源的贡献者，与开源社区一起「共建共享开源生态」。" />
</head>

「盘古开发框架」是完全独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发和治理框架（兼容垂直单体分层架构)。它基于 [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) 协议**开源**发布，且是**免费**的。我们希望不仅是开源的受益者，也能成为开源的贡献者，与开源社区一起「共建共享开源生态」。

## 架构设计范式和指导原则

我们在做类设计、模块结构划分、技术组件选型、框架体系架构设计时会优先遵循的一些设计范式和指导原则。

- **约定优于配置**  
  开发人员仅需在没有约定和约定不符合需要的时候自定义配置。
- **组合优于继承**  
  尽量使用合成或聚合的方式，而不是继承派生关系。
- **最佳实践**  
  通过大量的生产实例，总结最佳实践，沉淀复用。	
- **大道至简 Less is More**  
  不求大而全聚焦专而精，坚持「少即是多」的设计理念，保持架构纯洁与透明。
- **服务优先**  
「服务」是盘古框架的一等公民。我们旨在微服务和云原生范式基础上构建「以服务为中心」的现代应用架构。

## 技术组件依赖图
<img width="780"
  src={require('/resources/doc/34-pangu-framework.png').default}
  alt="数据分片实现-只分表" />

## 主要功能特性

- 自定义的 [pangu-*-spring-boot-starter](https://gitee.com/pulanos/pangu-framework/tree/master) 启动器，覆盖开发过程常见需求，完成各个盘古模块的自动装配。
- 自定义的代码生成器Maven插件 [pangu-generator-maven-plugin](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-generator-maven-plugin) ，生成开发所需的模版代码。
- 基于 [Apache ShenYu](https://shenyu.apache.org) 网关框架，实现对后端 [Dubbo](https://dubbo.apache.org/en/) 服务的泛化调用；同时网关支持鉴权、动态限流、熔断、防火墙；支持 A/B Test，蓝绿发布等。
- 基于 [Apache Dubbo](https://dubbo.apache.org/en/) 框架提供面向接口代理的高性能RPC调用、智能容错和负载均衡、运行期流量调度、可视化的服务治理与运维。
- 基于 [Nacos](https://nacos.io/en-us/index.html) 提供动态配置服务，以中心化、外部化和动态化的方式管理所有环境的应用配置参数；提供了对Dubbo服务的服务发现和服务监控监测等服务元数据可视化管理。
- 基于 [Mybatis-Plus](https://gitee.com/baomidou/mybatis-plus) 提供了强大的内置通用 Mapper CRUD 操作、支持 Lambda 表达式、内置屏蔽不通数据库方言差异的分页插件、自动填充字段值、多种主键自动生成策略、逻辑删除、乐观锁插件等功能。
- 基于 [layering-cache](https://github.com/xiaolyuh/layering-cache) 提供支持分布式环境的多级缓存功能。使用 [Caffeine](https://github.com/ben-manes/caffeine) 作为一级本地缓存， [Redis](https://redis.io/) 作为二级集中式缓存。
- 基于 [lock4j](https://gitee.com/baomidou/lock4j) 提供分布式锁。支持注解声明式和 API 编程式对业务代码在分布式环境下加并发锁。
- 基于 [Seata](https://seata.io/en-us/index.html) 提供分布式事务的落地方案。
- 基于 [ShardingSphere](https://shardingsphere.apache.org/index.html) 来提供数据治理相关功能，如：读写分离、数据分片、数据加密等。
- 基于[Sentinel](https://sentinelguard.io/en-us/) 提供面向云原生微服务架构的高可用流量控制组件。
- 应用日志输出级别动态切换、分布式日志跟踪等...

## 盘古框架模块列表

|<div style={{width:'300px'}}>模块名称</div> | <div style={{width:'450px'}}>模块说明</div>  
--- | ---
pangu-parent | 盘古资源依赖声明管理模块 
pangu-common | 盘古公共基础类库
pangu-spring-boot-starter | 盘古启动、中心化配置、动态日志等基础能力自动装配模块
pangu-dubbo-spring-boot-starter | 盘古微服务开发自动装配模块
pangu-jdbc-spring-boot-starter | 盘古数据库持久化操作自动装配模块
pangu-cache-spring-boot-starter | 盘古缓存开发自动装配模块
pangu-gateway-spring-boot-starter | 盘古网关开发自动装配模块
pangu-web-spring-boot-starter | 盘古 Web 应用自动装配模块
pangu-rabbitmq-spring-boot-starter | 盘古消息队列自动装配模块
pangu-seata-spring-boot-starter | 盘古分布式事务自动装配模块
pangu-data-governance-spring-boot-starter | 数据治理（读写分离、数据分片、数据加密等）自动装配模块
pangu-generator-maven-plugin | 盘古代码生成器Maven插件
pangu-website | 盘古项目官网和文档
pangu-examples | 盘古框架模版化参考范例集

## 盘古框架的进化史
:::info
科技的发展进步，如同历史潮流浩浩荡荡，势不可挡。在此期间，作者发布了多个版本的开发框架平台。当前，随着云原生范式不断深入人心，DevOPS、容器、微服务等技术趋于成熟，技术革新的同时也在刷新着我们的技术栈、系统架构、开发方法、部署运维方式。鉴于此，我们承前启后，发布了适应云原生时代，能构建「以服务为中心」现代应用架构的「盘古开发框架」。
:::

|<div style={{width:'120px'}}>发布时间</div> | 框架代号 | <div style={{width:'420px'}}>主要特点</div> | <div style={{width:'90px'}}>状态</div>
--- | --- | --- | ---
2021年-至今 | [盘古](/) | 微服务开发、分布式架构&单体架构、云原生 | :kiss: 长期支持
2017年-2020年 | [MyClouds](https://gitee.com/pulanos/myclouds/blob/master/myclouds-docs/1.1%20%E5%85%A5%E9%97%A8%20-%20%E7%AE%80%E4%BB%8B.md) | LayUI、微服务开发( SpringCloud 生态)、分布式架构、通用权限系统| 项目终止
2007年-2016年 | [AOSuite](https://gitee.com/pulanos/aosuite/blob/master/doc/a.%E7%AC%AC%E4%B8%80%E7%AB%A0%20AOSuite%E7%AE%80%E4%BB%8B.md) | 自定义 JSP UI 标签库、单体架构、通用权限系统 | 项目终止

## FAQ 
你最想了解的常见问答可能都在这里：[:soon: 常见问答 FAQ](/docs/faq)。

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/docs/community) 寻求更多帮助。