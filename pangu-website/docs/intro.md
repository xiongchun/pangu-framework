---
title: 简介
tags: [盘古简介,盘古架构]
sidebar_position: 1
slug: /intro
---

# 简介

<head>
  <title>盘古开发框架简介</title>
  <meta name="keywords" content="盘古开发框架简介" />
  <meta name="description" content="盘古开发框架是一套轻量稳健的工业级分布式微服务开发治理框架（兼容单体分层架构）" />
</head>

[盘古开发框架](/) 是独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发治理框架（兼容垂直单体分层架构)。它基于 [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) 协议**开源**发布，且是**免费**的。我们希望不仅是开源的受益者，也能成为开源贡献者，与开源社区一起**共建共享开源生态**。

## 设计原则

在类设计、模块结构划分、技术组件选型、框架体系架构设计时会优先遵循的一些设计范式和指导原则。

- **极简原则**  
  大道至简，简单代表好用、稳定、易协作。坚持「Keep it Simple & Stupid」设计理念。
- **最佳实践原则**  
  通过大量的生产实例总结，沉淀复用最佳实践。
- **无为而无不为**  
  不求大而全，聚焦专而精，保持架构的纯洁与透明。坚持「Less is More」设计理念。
- **服务优先原则**  
「服务」是盘古开发框架的一等公民，我们旨在微服务和云原生范式基础上构建「以服务为中心」的现代应用架构。
- **轻量灵活一致性原则**  
  通用功能模块化，既能下沉复用也能对标替换；一套架构既是分布式微服务架构的工业级首选，同时也能兼容单体应用开发。

## 主要功能
1. 自定义的 Spring Boot 启动器，完成各功能组件的自动装配。
2. 自研轻量 Maven 插件，支持各场景的模版代码生成。
3. 配置参数外部化、动态化和中心化管理。
4. 面向接口代理的高性能 RPC 服务调用。
5. 支持服务调用智能容错和负载均衡、服务限流与熔断、可视化的服务治理与运维等。构建「以服务为中心」的现代应用架构服务平台。
6. 强大的数据访问能力，内置通用 CRUD 接口；支持 Lambda 表达式；提供逻辑删除、乐观锁、分页、字段值填充等功能。
7. 支持基于异步非阻塞模型的高性能 HTTP 网关通过泛化调用后端 Dubbo 服务。同时网关支持 HTTP 层的鉴权、动态限流、熔断、防火墙、灰度发布等。
8. 提供靠谱的最终一致性分布式事务落地方案。
9. 提供数据治理相关功能，如：读写分离、数据分片、数据加密等。
10. 提供分布式环境下的多级缓存功能(注解式和编程式)。Caffeine 作为一级本地缓存，Redis 作为二级集中式缓存。
11. 支持注解声明式和编程式对业务代码在分布式环境下加并发互斥锁。
12. 应用日志输出级别动态切换、分布式日志跟踪等...

## 组件依赖
### 基础核心组件
- Spring ※ Spring Boot
- MyBatis (MyBatis Plus)
- Apache Dubbo
- Aliware Nacos

### 扩展增强型组件
- Apache ShenYu
- Apache ShardingSphere
- Aliware Seata
- Aliware Sentinel
- Layering Cache
- Lock4J

### 辅助工具类组件
- Lombok
- Apache Commons
- Google Guava
- Hutool

## 模块列表
- 盘古资源依赖声明管理模块：pangu-parent
- 盘古公共基础类库：pangu-common
- 盘古启动、中心化配置等基础能力自动装配模块：pangu-spring-boot-starter
- 盘古 Dubbo 服务开发自动装配模块：pangu-dubbo-spring-boot-starter
- 盘古数据库持久化操作自动装配模块：pangu-jdbc-spring-boot-starter
- 盘古缓存开发自动装配模块：pangu-cache-spring-boot-starter
- 盘古网关开发自动装配模块：pangu-gateway-spring-boot-starter
- 盘古 Web 应用自动装配模块：pangu-web-spring-boot-starter
- 盘古消息队列自动装配模块：pangu-rabbitmq-spring-boot-starter
- 盘古分布式事务自动装配模块：pangu-seata-spring-boot-starter
- 盘古数据治理（读写分离、数据分片等）自动装配模块：pangu-data-governance-spring-boot-starter
- 盘古代码生成器Maven插件：pangu-generator-maven-plugin
- 盘古项目官网和文档：pangu-website
- 盘古框架模版化参考范例集：pangu-examples

## FAQ 
你最想了解的常见问答可能都在这里：[:soon: 常见问答 FAQ](/docs/faq)。

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/docs/community) 寻求更多帮助。