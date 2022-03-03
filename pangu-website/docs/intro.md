---
title: 简介
tags: [盘古简介,盘古架构]
sidebar_position: 1
slug: /intro
---

<head>
  <title>盘古开发框架简介 | 架构设计 | 主要功能特性</title>
</head>

这是一套轻量灵活的Java开源企业级单体开发 & 微服务分布式开发治理框架(遵循 [Apache-2.0 LICENSE](https://www.apache.org/licenses/LICENSE-2.0) 发布)。

## 架构设计范式和指导原则

:::tip
我们在做类设计、模块结构划分、技术组件选型、框架体系架构设计时会优先遵循的一些设计范式和指导原则。
:::

- **约定优于配置**  
  开发人员仅需在没有约定和约定不符合需要的时候自定义配置。
- **组合优于继承**  
  尽量使用合成或聚合的方式，而不是继承派生关系。
- **单一职责原则**  
- **最佳实践原则**  
  通过大量的生产实例，总结最佳实践，沉淀复用。	
- **服务优先原则**  
  服务是盘古框架的一等公民。我们旨在微服务范式和云原生范式基础上构建以"服务"为中心的现代应用架构。
- **简约而不简单**  
  坚持选型自信和道路自信，不求大而全专注小而精。

## 盘古框架模块列表

模块名称 | 模块说明  
--- | ---
pangu-parent | 盘古资源依赖声明管理模块 
pangu-common | 盘古公共基础类库
pangu-spring-boot-starter | 盘古启动、中心化配置、动态日志等基础能力自动装配模块
pangu-dubbo-spring-boot-starter | 盘古微服务开发自动装配模块
pangu-jdbc-spring-boot-starter | 盘古数据库持久化操作自动装配模块
pangu-cache-spring-boot-starter | 盘古缓存开发自动装配模块
pangu-gateway-spring-boot-starter | 盘古网关开发自动装配模块
pangu-web-spring-boot-starter | 盘古Web应用自动装配模块
pangu-rabbitmq-spring-boot-starter | RabbitMQ消息队列自动装配模块
pangu-seata-spring-boot-starter | Seata分布式事务自动装配模块
pangu-generator-maven-plugin | 盘古代码生成器Maven插件
pangu-website | 盘古项目官网和文档
pangu-examples | 盘古框架模版化参考范例集

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
- 应用日志输出级别动态切换、分布式日志跟踪等...

## 盘古框架的进化史
:::info
科技的发展进步，如同历史潮流浩浩荡荡，势不可挡。在此期间，作者发布了多个版本的开发框架平台。当前，随着云原生范式不断深入人心，DevOPS、容器、微服务等技术趋于成熟，技术革新的同时也在刷新着我们的技术栈、系统架构、开发方法、部署运维方式。鉴于此，我们承前启后，发布了适应云原生时代，构建以"服务"为中心现代应用架构的『盘古开发框架』。
:::

|<div style={{width:'120px'}}>发布时间</div> | 框架代号 | 主要特点 | <div style={{width:'80px'}}>状态</div>
--- | --- | --- | ---
2021年-至今 | [盘古](/) | 微服务开发、分布式架构&单体架构、云原生 |  :kiss: 长期支持
2017年-2020年 | [MyClouds](https://gitee.com/pulanos/myclouds/blob/master/myclouds-docs/1.1%20%E5%85%A5%E9%97%A8%20-%20%E7%AE%80%E4%BB%8B.md) | LayUI、微服务开发(SpringCloud生态)、分布式架构、通用权限系统| 项目终止
2011年-2016年 | [AOSuite](https://gitee.com/pulanos/aosuite/blob/master/doc/a.%E7%AC%AC%E4%B8%80%E7%AB%A0%20AOSuite%E7%AE%80%E4%BB%8B.md) | 自定义JSP UI标签库、单体架构、通用权限系统 | 项目终止
2006年-2010年 | [G4Studio](https://gitee.com/xiong-chun/G4Studio) | 原生ExtJS UI、单体架构、通用权限系统 | 项目终止

## FAQ 
> 在这里我将以最简单直接的方式回答一些用户可能最想了解的常见问题。  

#### 1. 盘古开发框架的开源协议是啥？创始初衷和目标愿景是什么？  
盘古框架基于商业友好的 [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) 开源协议发布。创始初衷是『分享经验-传递价值-成就你我』。目标愿景是『共建共享开源生态』，不仅做开源生态的受益者也希望成为开源生态的贡献者。

#### 2. 盘古开发框架可以做单体开发吗?
可以。从纯技术角度看，盘古开发的最佳姿势是[分布式微服务开发](/docs/quick-start/how-to-make-microservice-architecture-app)。但也支持搭建垂直[单体分层架构的开发模式](/docs/quick-start/how-to-make-monomer-architecture-app)。

#### 3. 盘古开发框架和 [Spring Cloud](https://spring.io/projects/spring-cloud) 或 [Spring Cloud Alibaba](https://spring.io/projects/spring-cloud-alibaba) 是什么关系？  
都没啥直接关系。盘古开发框架是完全独立于 Spring Cloud (*) 生态之外的一套轻量灵活、成熟可靠的分布式微服务开发和治理框架。

## 下一步
继续阅读其它章节获取您想要的答案或通过我们的[开发者社区](/docs/community)寻求更多帮助。