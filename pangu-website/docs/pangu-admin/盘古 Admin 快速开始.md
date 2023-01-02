---
title: 盘古 Admin 快速开始
tags: [盘古 Admin]
sidebar_position: 1
slug: /pangu-admin/quick-start
---

<head>
  <title>盘古通用权限系统开发框架 | 快速开始 | SUCI(Vue3、Element-Plus) | 盘古开发框架</title>
  <meta name="keywords" content="盘古通用权限系统开发框架 | 快速开始 | SUCI(Vue3、Element-Plus) | 盘古开发框架" />
</head>

import Tabs from '@theme/Tabs';
import TabItem from '@theme/TabItem';

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

## 简介

**盘古 Admin** 是一套基于 **SCUI**(Vue3、Element-Plus) + **盘古开发框架**的中后台业务系统前后端统一解决方案。并预置了轻量成熟的 [权限系统参考实现](/online-demo) 。用户可以基于它快速搭建二次开发脚手架，实现业务逻辑。

## 工程结构说明
盘古 Admin 仓库代码路径：`pangu-framework/pangu-admin`。
- pangu-admin-backend：后端
  - pangu-admin-web：统一网关模块
  - pangu-admin-system：权限系统模块
  - XX-XXN：业务系统模块 N (二次开发)
- pangu-admin-frontend：前端

## 后端开发环境搭建

- 将后端工程引入 IDEA。工程代码：pangu-framework/pangu-admin/pangu-admin-backend。
- 执行目录 ~/pangu-admin-system/pangu-admin-system-app/src/main/resources/sql 中的数据脚本。

### 配置
分别在 nacos 配置中心创建模块`pangu-admin-web`和`pangu-admin-system-app`的配置信息。如下图所示。

![盘古开发框架 Admin](/resources/doc/35-pangu-admin.png)

> 关于 naocs 配置中心的相关用法请查阅开发指南章节的 [配置中心](/docs/advanced-guide/nacos-config-center)。

<Tabs>
<TabItem value="pangu-admin-web" label="pangu-admin-web">

```jsx title="Data Id 为 ppangu-admin-web 的配置数据"
spring.jackson.time-zone=GMT+8
pangu.web.cross-origin=true

dubbo.protocol.name=dubbo
dubbo.protocol.port=-1
dubbo.consumer.timeout=5000
dubbo.registry.address=nacos://${nacos.server-addr}?namespace=${nacos.namespace}
dubbo.consumer.check=false

app.jwt.secret-key=alliswell666
app.jwt.ttl-min=480
app.jwt.persistent=true

app.log.queue.producer.disabled=false
#app.log.queue.producer.excludes.method-start-with=list,find,select,query,read
app.log.queue.consumer.pool.threads=10

logging.level.root=INFO
logging.level.com.gitee.pulanos.pangu=INFO
logging.level.com.alibaba.nacos.client.config.impl.ClientWorker=WARN
logging.level.com.yomahub.tlog.dubbo.filter=ERROR
```

</TabItem>

<TabItem value="pangu-admin-system-app" label="pangu-admin-system-app">

```jsx title="Data Id 为 pangu-admin-system-app 的配置数据"
dubbo.protocol.name=dubbo
dubbo.protocol.port=-1
dubbo.consumer.timeout=5000
dubbo.registry.address=nacos://${nacos.server-addr}?namespace=${nacos.namespace}
dubbo.consumer.check=false
dubbo.provider.filter=-exception

spring.datasource.type=com.zaxxer.hikari.HikariDataSource
spring.datasource.driver-class-name=com.mysql.cj.jdbc.Driver
spring.datasource.url=jdbc:mysql://localhost:3306/pangu-admin?useUnicode=true&characterEncoding=utf-8&autoReconnect=true&failOverReadOnly=false&allowMultiQueries=true&useSSL=false&rewriteBatchedStatements=true
spring.datasource.username=root
spring.datasource.password=root123456

mybatis-plus.mapperLocations=classpath*:/mapper/**/*.xml
mybatis-plus.configuration.log-impl=org.apache.ibatis.logging.slf4j.Slf4jImpl
mybatis-plus.global-config.db-config.logic-delete-field=deleted
mybatis-plus.global-config.db-config.logic-not-delete-value=0
mybatis-plus.global-config.db-config.logic-delete-value=id
pangu.jdbc.db-type=mysql

logging.file.name=logs/pangu.log
logging.level.root=INFO
logging.level.com.gitee.pulanos.pangu=INFO
logging.level.com.pulanit.pangu.admin.system.dao=DEBUG
```
</TabItem>
</Tabs>

### 启动

启动参数说明  
  - -Dnacos.server-addr: nacos 服务器地址。
  - -Dnacos.namespace: nacos 里的命名空间 ID 。

**启动权限服务模块**
```jsx title="启动参数"
-Dnacos.server-addr=100.100.100.XXX:8048 -Dnacos.namespace=pangu-dev
```
启动成功后在 nacos 服务列表中可看到相关服务提供者信息。如下图所示。

![盘古开发框架 Admin](/resources/doc/36-pangu-admin.png)

**启动网关模块**
```jsx title="启动参数"
-Dnacos.server-addr=100.100.100.XXX:8048 -Dnacos.namespace=pangu-dev
```
启动成功后在 nacos 服务列表中可看到相关服务消费者信息。如下图所示。

![盘古开发框架 Admin](/resources/doc/37-pangu-admin.png)

## 前端开发环境搭建

前端工程代码路径：pangu-framework/pangu-admin/pangu-admin-frontend。

### 介绍
盘古 Admin 前端基于 SUCI 开发。SCUI 是一个中后台前端解决方案，基于 VUE3 和 ElementPlus 实现。 使用最新的前端技术栈，提供各类实用的组件方便在业务开发时的调用，并且持续性的提供丰富的业务模板帮助你快速搭建企业级中后台前端任务。更多 SCUI 信息，请直接参考其 [项目主页和相关文档](https://lolicode.gitee.io/scui-doc/guide/)。

### 安装 & 启动
:::tip 提示
安装依赖和启动需依赖npm。安装方法：[https://nodejs.org/zh-cn](https://nodejs.org/zh-cn/)
:::

```jsx
# 进入项目目录
cd pangu-framework/pangu-admin/pangu-admin-frontend
# 安装依赖
npm i
# 启动项目 (开发模式)
npm run serve
# 构建部署（生产模式）：将根目录生成 dist 文件夹发布到服务器即可
# npm run build
```
编译启动成功后可通过控制台提示信息开始访问。如：http://localhost:2800

### 截屏（部分）
如下为权限系统参考实现的部分截屏。

<Tabs>
<TabItem value="1" label="1">

![盘古开发框架 Admin](/resources/doc/38-pangu-admin.png)
</TabItem>
<TabItem value="2" label="2">

![盘古开发框架 Admin](/resources/doc/39-pangu-admin.png)
</TabItem>
<TabItem value="3" label="3">

![盘古开发框架 Admin](/resources/doc/40-pangu-admin.png)
</TabItem>
<TabItem value="4" label="4">

![盘古开发框架 Admin](/resources/doc/41-pangu-admin.png)
</TabItem>
<TabItem value="5" label="5">

![盘古开发框架 Admin](/resources/doc/42-pangu-admin.png)
</TabItem>
<TabItem value="6" label="6">

![盘古开发框架 Admin](/resources/doc/43-pangu-admin.png)
</TabItem>
<TabItem value="7" label="7">

![盘古开发框架 Admin](/resources/doc/44-pangu-admin.png)
</TabItem>
<TabItem value="8" label="8">

![盘古开发框架 Admin](/resources/doc/45-pangu-admin.png)
</TabItem>
<TabItem value="9" label="9">

![盘古开发框架 Admin](/resources/doc/46-pangu-admin.png)
</TabItem>
<TabItem value="10" label="10">

![盘古开发框架 Admin](/resources/doc/47-pangu-admin.png)
</TabItem>
<TabItem value="11" label="11">

![盘古开发框架 Admin](/resources/doc/48-pangu-admin.png)
</TabItem>
<TabItem value="12" label="12">

![盘古开发框架 Admin](/resources/doc/51-pangu-admin.png)
</TabItem>
<TabItem value="13" label="13">

![盘古开发框架 Admin](/resources/doc/50-pangu-admin.png)
</TabItem>
<TabItem value="14" label="14">

![盘古开发框架 Admin](/resources/doc/49-pangu-admin.png)
</TabItem>
</Tabs>

完整体验请访问：[在线演示系统](/online-demo)。

<details>
  <summary><b>快速 QA：</b>可以将盘古 Admin 后端改为单体应用吗？</summary>
  <div>
  必须可以。只需要自己做一些简单的代码合并即可将 RPC 微服务调用改为本地服务调用。如果连配置中心都不想搭建的话，可以将配置直接改为本地配置文件。
  </div>
</details>

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/community) 寻求更多帮助。
