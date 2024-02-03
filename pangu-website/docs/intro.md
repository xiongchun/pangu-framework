---
title: 简介
tags: [盘古简介,盘古架构]
sidebar_position: 10
slug: /intro
---

<head>
  <title>盘古框架文档 | 盘古服务开发框架简介</title>
  <meta name="keywords" content="盘古框架文档 | 盘古开发框架简介" />
</head>

**盘古微服务开发框架** 以 Dubbo、Nacos、Mybatis Plus 和 Spring Boot 为核心架构，可在云原生时代构建以「服务」为中心的现代应用架构，帮助用户在云环境中更好的构建、交付和管理自己的微服务平台（也兼容支持垂直单体分层架构开发模式）。

## 模块列表

- **pangu-dependencies**   
  盘古资源依赖声明管理模块。
- **pangu-spring-boot-starter**  
  盘古启动器、中心化配置、基础类库等基自动装配模块
- **pangu-generator-maven-plugin**  
  盘古代码生成器Maven插件

## 主要功能

1. 自定义的 Spring Boot 启动器，完成各功能组件的自动装配。
2. 自研轻量 Maven 插件，支持各场景的模版代码生成。
3. 基于 Nacos 提供的配置参数外部化、动态化和中心化管理。
4. 基于 Dubbo 提供的面向接口代理的高性能 RPC 服务调用和服务治理能力。
5. 基于 Mybatis Plus 强大的数据访问能力，内置通用 CRUD 接口；支持 Lambda 表达式；提供逻辑删除、乐观锁、分页、字段值填充等功能。
6. 支持基于异步非阻塞模型的高性能 HTTP 网关通过泛化调用后端 Dubbo 服务。同时网关支持 HTTP 层的鉴权、动态限流、熔断、防火墙、灰度发布等。
7. 基于 Seata 提供靠谱的最终一致性分布式事务落地方案。
8. 提供数据治理相关功能，如：读写分离、数据分片、数据加密等。
9. 提供消息队列在异步通信、服务解耦、消峰填谷、缓存同步等应用场景下的使用能力。
10. 支持注解声明式和编程式对业务代码在分布式环境下加并发互斥锁。
11. 应用日志输出级别动态切换、分布式日志跟踪等...

## 组件依赖

- **基础核心组件**
  - Spring Boot ※ Spring Framework
  - MyBatis (MyBatis Plus)
  - Apache Dubbo
  - Aliware Nacos

- **扩展增强型组件**
  - Apache ShardingSphere
  - Aliware Seata
  - Aliware Sentinel
  - Lock4J

- **辅助工具类组件**
  - Lombok
  - Apache Commons
  - Hutool
  - FastJSON2

## 视频教程

> **广告**：欢迎订阅我的 B 站频道观看更多 [高清教程](https://space.bilibili.com/1517598861/channel/collectiondetail?sid=2112816)。我的 ID: [程序员大熊哥](https://space.bilibili.com/1517598861)。

<iframe src="//www.bilibili.com/blackboard/html5mobileplayer.html?aid=1250142618&bvid=BV1CJ4m1b7nc&cid=1424796961&p=1&highQuality" scrolling="no" border="0" frameborder="yes" framespacing="0" allowfullscreen="true" width="100%" height="463"> </iframe>

## 下一步

继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/community) 寻求更多帮助。
