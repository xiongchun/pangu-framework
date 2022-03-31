---
title: 常见问答FAQ
tags: [盘古简介, FAQ]
sidebar_position: 19
slug: /faq
---
<head>
  <title>盘古开发框架 | 常见问答 FAQ</title>
  <meta name="keywords" content="盘古开发框架 | 常见问答FAQ" />
  <meta name="description" content="「盘古开发框架」是完全独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发和治理框架（兼容垂直单体分层架构)。它基于 Apache-2.0 协议开源发布，且是免费的。我们希望不仅是开源的受益者，也能成为开源的贡献者，与开源社区一起「共建共享开源生态」。" />
</head>

#### 1. 盘古开发框架的开源协议是啥？创始初衷和目标愿景是什么？  
「盘古开发框架」基于商业友好的 [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) 协议**开源**发布，且是**免费**的，创始初衷是「分享经验-传递价值-成就你我」。目标愿景是「共建共享开源生态」，不仅做开源生态的受益者也希望成为开源生态的贡献者。

#### 2. 盘古开发框架可以做单体开发吗?
可以。从纯技术角度看，盘古开发的最佳姿势是 [分布式微服务开发](/docs/quick-start/how-to-make-microservice-architecture-app)。但也支持搭建 [垂直单体分层架构的开发模式](/docs/quick-start/how-to-make-monomer-architecture-app)。

#### 3. 盘古开发框架和 [Spring Cloud](https://spring.io/projects/spring-cloud) 或 [Spring Cloud Alibaba](https://spring.io/projects/spring-cloud-alibaba) 是什么关系？ 为什么不直接使用而是另起炉灶？
Spring Cloud 是目前最流行的用于构建分布式微服务架构的框架集合，其核心能力包括但不限于网关、服务注册&发现、配置中心、熔断限流、服务调用等。但最流行的未必是最好的。的确如此，从可用性、成熟度、产品完整性等方面看，SC 的任何官方能力组件的表现都很一般甚至很糟糕。（此处不接受反驳 :u7981:） 

既然 Spring Cloud 那么弱鸡，阿里为什么还要发布 Spring Cloud Alibaba 将将自己开源组件或商业组件去适配它呢？我想这如果从宣传、推广自家组件和商业服务的视角来看，那自然就没什么疑惑和矛盾的了。类似产品还有微软的 [Spring Cloud Azure](https://github.com/Azure/azure-sdk-for-java)、亚马逊的 [Spring Cloud Aws](https://github.com/awspring/spring-cloud-aws)，或许将来还会有Spring Cloud Baidu、Spring Cloud Tencent 等等。（其中滋味大家细品）

「盘古开发框架」基于阿里中间件Nacos、Seata、Sentinel 和 Apache 项目 ShenYu、Dubbo、ShardingSphere 提供全套轻量出色的分布式微服务架构的能力。它是完全独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发和治理框架（兼容垂直单体分层架构)。

#### 4. 盘古开发框架可以开发前端吗？有没有现成的『通用权限管理系统』？
不可以。盘古是纯后端的底层技术架构框架，可开发 Web API 接口、 Dubbo 接口或执行纯后台任务。目前不涉及前端UI层开发，更无所谓的『通用权限管理系统』。

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/docs/community) 寻求更多帮助。