---
title: 基于 Caddy 部署盘古 Admin
authors: [xiongchun]
tags: [Caddy,部署]
date: 2022-10-02
hide_table_of_contents: false
slug: deploy-pangu-admin-by-caddy
---

本文以部署盘古 Admin 在线演示系统为例讲解如何基于 Caddy 部署盘古 Admin 的静态资源和 Web 节点（业务网关）。  
部署效果：[https://pangu-admin.pulanit.com](https://pangu-admin.pulanit.com/)
- 充当 WebServer 部署项目静态网站。
- 充当流量网关方向代理后端的 Web 节点（业务网关）。
- 全站自动 SSL。包含静态网站和 API 请求。
- 解决跨域请求；解决前端 https 后端 http 的协议适配问题。

> nginx 也可以做同样的事情。

<!--truncate-->

### 解析二级域名
登录域名服务商控制台，添加一条二级域名 `pangu-admin.pulanit.com` 的解析记录。

### 修改配置文件
```shell
# vi /etc/caddy/Caddyfile
pangu-admin.pulanit.com {
        # Set this path to your site's directory.
        root * /var/www/pangu-admin
        encode gzip
        # Enable the static file server.
        file_server

        # Another common task is to set up a reverse proxy:
        reverse_proxy /api/* {
          # 可以指定多个后端业务网关 WEB 节点
          to localhost:8080
        }
}
```
- 静态资源文件上传到目录：`/var/www/pangu-admin`。
- 后端 Dubbo 微服务集群的部署不在本文讨论范围，本文仅通过 Caddy 方向道理后端业务网关。
- 通过如上配置，网站和 API 自动都拥有了 https 的能力。

:::tip 提示
上述部署结构，使得静态网站和 API 处于同一域名下，解决了跨域的问题。但如果 API 需要反向代理到不同的端口下或者域名下，则可以设置业务网关的参数开启跨域支持，也可以在 Caddy 配置文件配置响应头参数以支持跨域访问。
:::

> 关于 [Caddy](https://caddyserver.com/) 中间件的介绍和基础使用，可以参考我的另外一篇文章。[使用 Caddy 部署盘古项目官网](deploy-pangu-website-by-caddy)

