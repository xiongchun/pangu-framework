---
hide_table_of_contents: false
---

<head>
  <title>盘古开发框架简介</title>
</head>

export const Highlight = ({children, color}) => (
  <span
    style={{
      backgroundColor: color,
      borderRadius: '3px',
      color: '#fff',
      padding: '0.1rem',
      margin: '0.2rem'
    }}>
    {children}
  </span>
);

# 盘古开发框架简介

「盘古开发框架」是一套轻量稳健的工业级前、中、后台三维多端行业数字化赋能开发框架。基于商业友好的 [Apache-2.0](https://www.apache.org/licenses/LICENSE-2.0) 协议<Highlight color="#25c2a0">免费开源</Highlight>发布。我们希望不仅是开源的受益者也能成为开源贡献者，与开源社区一起**共建共享开源生态**。

## 生态子项目
盘古开发框架由「盘古服务开发框架」、「盘古中后台业务系统开发脚手架」、「盘古移动端多平台开发脚手架」三个子项目组成。可以单独拆箱使用，也可以打包整合。

#### 盘古服务开发框架
[盘古服务开发框架](/docs/intro)（PanGu Service Framework）以 Dubbo、Nacos 和 Spring Boot 为核心架构，可在云原生时代构建以「服务」为中心的现代应用架构，帮助用户在云环境中更好的构建、交付和管理自己的微服务平台（也兼容支持垂直单体分层架构开发模式）。

#### 盘古中后台业务系统开发脚手架
[盘古中后台业务系统开发脚手架](/admin/intro)（PanGu Admin）是一套基于 SCUI(Vue3、Element-Plus) + 盘古服务开发框架的中后台业务系统前后端统一解决方案。并预置了轻量成熟的权限系统参考实现，用户可以基于此快速搭建中后台业务系统二次开发脚手架。

#### 盘古移动端多平台开发脚手架
[盘古移动端多平台开发脚手架](/admin/intro)（PanGu App Starter) 是集成了 uni-app 内置组件、官方扩展组件和全面兼容 nvue 的 uni-app 生态框架 uView UI 的多平台快速开发脚手架。用户可以基于此完成Android/IOS App、微信小程序、H5 应用的快速开发（一次开发，针对不同平台编译发布版本）。

## 适用场景
基于盘古开发框架的前、中、后台三维多端行业数字化赋能能力，用户既能快速构建面向（移动）互联网的电商、金融、云端 SAAS 服务等大并发高可用可扩展的互联网应用场景，同时也能满足诸如 ERP 、CRM 等各种企业数字化和各级电子政务系统的中小规模业务需求。