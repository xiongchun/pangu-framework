---
title: 简介
tags: [盘古简介, 盘古架构]
sidebar_position: 1
slug: /intro
---

# 简介

这是一套轻量灵活的Java开源企业级单体开发 & 微服务分布式开发治理框架(遵循[Apache-2.0 LICENSE](https://www.apache.org/licenses/LICENSE-2.0)发布)。

## 架构设计指导思想

:::tip
如下为我们在做类设计、模块结构划分、框架体系架构设计时从技术角度会优先思考的一些设计范式。
:::

- 约定优于配置（convention over configuration）  
  开发人员仅需在没有约定和约定不符合需要的时候自定义配置。
- 组合优于继承（composition over inheritance ）  
  尽量使用合成或聚合的方式，而不是继承派生关系。
- 单一职责原则（single responsibility principle）
- 最佳实践原则（best practice principle）  
  通过大量的生产实例，总结最佳实践，沉淀复用。	
- 服务优先原则（service first principle）  
  服务是盘古框架的一等公民。我们旨在微服务范式和云原生范式基础上构建以"服务"为中心的现代应用架构。

## 主要功能特性

- 自定义的[pangu-*-spring-boot-starter](https://gitee.com/pulanos/pangu-framework/tree/master)启动器，覆盖开发过程常见需求，完成各个盘古模块的自动装备。
- 自定义的代码生成器Maven插件[pangu-generator-maven-plugin](https://gitee.com/pulanos/pangu-framework/tree/master/pangu-generator-maven-plugin)，生成开发所需的模版代码。
- 基于[Apache ShenYu](https://shenyu.apache.org)网关框架，实现对后端[Dubbo](https://dubbo.apache.org/en/)服务的泛化调用；同时网关支持鉴权、动态限流、熔断、防火墙；支持 A/B Test，蓝绿发布等。
- 基于[Apache Dubbo](https://dubbo.apache.org/en/)框架，提供面向接口代理的高性能RPC调用、智能容错和负载均衡、运行期流量调度、可视化的服务治理与运维。
- 基于[Nacos](https://nacos.io/en-us/index.html),提供动态配置服务，以中心化、外部化和动态化的方式管理所有环境的应用配置参数；提供了对Dubbo服务的服务发现和服务监控监测等服务元数据可视化管理。
- 基于[Mybatis-Plus](https://gitee.com/baomidou/mybatis-plus)，在[MyBatis](https://mybatis.org/mybatis-3/index.html)的基础上提供了强大的内置通用Mapper CRUD操作、支持Lambda表达式、内置屏蔽不通数据库方言差异的分页插件、自动填充字段值、多种主键自动生成策略、逻辑输出、乐观锁插件等。
- 基于[layering-cache](https://github.com/xiaolyuh/layering-cache)，提供支持分布式环境的多级缓存功能。使用[Caffeine](https://github.com/ben-manes/caffeine)作为一级本地缓存，[Redis](https://redis.io/)作为二级集中式缓存。支持缓存信息监控统计、支持缓存过期时间在注解上直接配置、支持缓存的自动刷新、缓存Key支持SpEL表达式、支持无感禁用一级缓存或二级缓存。通过缓存空值来解决缓存穿透问题、通过异步加载缓存的方式来解决缓存击穿和雪崩问题。
- 基于[lock4j](https://gitee.com/baomidou/lock4j)，提供分布式锁。支持注解声明式和API编程式对业务代码在分布式环境下加并发锁。
- 应用日志输出级别动态切换、分布式日志跟踪等...

## 盘古模块

- **pangu-parent**  
盘古资源依赖声明管理模块
- **pangu-common**  
盘古公共基础类库
- **pangu-spring-boot-starter**  
盘古启动、中心化配置、动态日志等基础能力自动装配模块
- **pangu-dubbo-spring-boot-starter**  
盘古微服务开发自动装配模块
- **pangu-jdbc-spring-boot-starter**  
盘古数据库持久化操作自动装配模块
- **pangu-cache-spring-boot-starter**  
盘古缓存开发自动装配模块
- **pangu-gateway-spring-boot-starter**  
盘古网关开发自动装配模块
- **pangu-web-spring-boot-starter**  
盘古Web应用自动装配模块
- **pangu-generator-maven-plugin**  
盘古代码生成器Maven插件
- **pangu-website**  
盘古项目官网和文档
- **pangu-examples**  
盘古框架模版化参考范例集

## 盘古框架的进化史
:::info
科技的发展进步，如同历史潮流浩浩荡荡，势不可挡。近年来，随着云原生范式不断深入人心，DevOPS、容器、微服务等技术趋于成熟，技术革新的同时也在刷新着我们的技术栈、系统架构、开发方法、部署运维方式。鉴于此，我们承前启后，发布了适应云原生时代，构建以"服务"为中心现代应用架构的『盘古开发框架』。
:::

**[盘古开发框架](/)** `2021年-至今`  
↑   
**[MyClouds](https://gitee.com/pulanos/myclouds/blob/master/myclouds-docs/1.1%20%E5%85%A5%E9%97%A8%20-%20%E7%AE%80%E4%BB%8B.md)**   `2017年-2020年`  
↑  
**[AOSuite](https://gitee.com/pulanos/aosuite/blob/master/doc/a.%E7%AC%AC%E4%B8%80%E7%AB%A0%20AOSuite%E7%AE%80%E4%BB%8B.md)**    `2011年-2016年`  
↑  
**[G4Studio](https://gitee.com/xiong-chun/G4Studio)**   `2006年-2010年`

## 下一步
继续阅读 `快速开始` 以快速上手盘古开发框架。