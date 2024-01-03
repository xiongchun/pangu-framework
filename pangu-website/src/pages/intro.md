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

**盘古开发框架** 是一套轻量稳健的工业级前、中、后台三维多端行业数字化赋能开发基座。基于 [Apache](https://www.apache.org/licenses/LICENSE-2.0) 协议<Highlight color="#25c2a0">免费开源</Highlight>发布，希望与开源社区一起 **分享经验传递价值，共建共享开源生态**。

盘古开发框架由如下三个生态子项目组成。

- [**盘古微服务开发框架**](/docs/intro)  
一套构建以「服务」为中心的现代应用架构，用户可以开发、管理自己的微服务应用。

- [**盘古中后台业务系统开发脚手架**](/admin/intro)  
一套预置了权限系统的中后台统一解决方案，用户可以基于此快速搭建中后台业务系统前后端二次开发脚手架。

- [**盘古移动端多平台开发脚手架**](/app/intro)  
一套移动端多平台快速开发脚手架，用户可以快速开发 Android / IOS 应用、微信小程序、H5 应用。

## 适用场景

基于盘古开发框架的前、中、后台三维多端行业数字化赋能能力，用户既能快速构建面向互联网的电商、金融、云端 SaaS 等大并发高可用可扩展的互联网应用场景服务，同时也能满足诸如 ERP 、CRM 等各种企业数字化和各级电子政务系统的中小规模业务开发需求。

## 设计原则

在类设计、模块结构划分、技术组件选型、框架体系架构设计时会优先遵循的一些设计范式和指导原则。

- **极简原则**  
  大道至简，简单代表好用、稳定、易协作。坚持「Keep it Simple & Stupid」设计理念。
- **服务优先原则**  
「服务」是盘古开发框架的一等公民，旨在微服务和云原生范式基础上构建「以服务为中心」的现代应用架构。
- **最佳实践原则**  
  通过大量的生产实例检验，沉淀复用最佳实践。
- **透明原则**  
  不做无意义、故弄玄虚的封装；坚持组合优于继承，杜绝黑盒子；践行「Less is More」设计理念。

## 核心价值链

- **程序员**  
  盘古助你成长为独挡一面的全栈开发攻城狮，最终个进阶为手持魔杖的全能型架构师 or 技术砖家。
- **架构师、技术决策者**  
  盘古助你规避技术选型试错风险，优化自己的架构工具箱，更好的为业务服务。
- **企业、组织**  
  盘古为你降低用人成本，夯实企业数字化基座，真正做到降本增效好帮手，持续助力企业业务增长。

## 生态架构示意图

<img width="700"
  src={require('/resources/doc/34-pangu-framework.png').default}
  alt="盘古开发框架生态架构图" />

## 仓库模块列表

- **pangu-dependencies**  
  盘古资源依赖声明管理模块。
- **pangu-spring-boot-starter**  
  盘古启动器、中心化配置、基础类库等基自动装配模块
- **pangu-generator-maven-plugin**  
  盘古代码生成器Maven插件
- **pangu-admin**  
  盘古 Admin 中后台业务系统开发脚手架
- **pangu-app-starter**  
  盘古 APP 移动端多平台开发脚手架
- **pangu-website**  
  盘古框架官网 & 文档教程
- **pangu-examples**  
  盘古框架模版化参考范例集

## 重要的事情说三遍

盘古开发框架终身永久<Highlight color="#67C23A">免费开源</Highlight><Highlight color="#409EFF">免费开源</Highlight><Highlight color="#F56C6C">免费开源</Highlight>！ (请勿再咨询此问题)