---
title: Admin 开发常见问答
tags: [FAQ]
hide_table_of_contents: true
sidebar_position: 10
slug: /faq-admin
---
<head>
  <title>常见问答 | 盘古 Admin</title>
</head>

> 本文将重点关注 Admin 前端开发问题的收集汇总。后端开发相关问题请查阅 [服务开发常见问答](/docs/faq-service)

#### 1. 可以将盘古 Admin 的后端改为单体应用吗？ 
必须可以。只需要将 pangu-admin-web 网关模块和 pangu-admin-system 权限模块做一些简单的合并即可。合并后就能将跨进程的 RPC 服务调用转变为 jvm 进程内本地服务调用。如果连配置中心都不想搭建的话，可以将配置直接改为本地配置文件。如此，就能使用传统的单体开发模式，将业务系统代码作为子包模块写入合并后的工程即可。

## 下一步
继续阅读其它章节获取你想要的答案或通过我们的 [开发者社区](/community) 寻求更多帮助。