---
slug: caddy-vs-nginx
title: 使用 Caddy 部署盘古项目官网
authors: [xiongchun]
tags: [Caddy,Nginx,网关,反向代理, WebServer]
date: 2022-01-30
description: Caddy VS Nginx & 盘古开发框架最佳实践
hide_table_of_contents: false
---

> Caddy 2 is a powerful, enterprise-ready, open source web server with automatic HTTPS written in Go.

<p align="right"> — 摘自 <a href="https://caddyserver.com/">Caddy 官网</a></p>

<!--truncate-->

## Caddy 特性
- 缺省启用HTTP/2 协议，无需任何配置。
- 缺省全站HTTPS，无需任何配置。（自动申请和续期证书）
- 简单友好的配置文件，支持在线配置 API。
- golang 开发，几乎无依赖，部署简单。
- 充当 API Gateway, 反向代理后端多个 Web 节点。
- 天生插件架构，社区插件丰富，且自定义插件简单（写个插件顺便蹭一下 golang 的热度）。

## Caddy 实战
> Web Server 托管静态资源，以部署盘古开发框架项目官网为例。[https://pangu.pulanit.com](https://pangu.pulanit.com)

### 安装
#### Fedora, RHEL/CentOS 8
```
$ dnf install 'dnf-command(copr)'
$ dnf copr enable @caddy/caddy
$ dnf install caddy
```
#### RHEL/CentOS 7
```
$ yum install yum-plugin-copr
$ yum copr enable @caddy/caddy
$ yum install caddy
```

### 常用命令
```jsx
$ systemctl start[stop|restart] caddy
$ systemctl reload caddy //重新加载配置文件
$ systemctl status caddy //查看运行状态
```

### 修改配置文件
```
# vi /etc/caddy/Caddyfile
pangu.pulanit.com {
        # Set this path to your site's directory.
        root * /var/www/pangu.pulanit.com
        encode gzip
        # Enable the static file server.
        file_server
}
```
- 静态资源文件上传到目录：`/var/www/pangu.pulanit.com`。

### 域名解析
域名解析地址必须和上述配置文件中的域名保持一致即可。尝试访问：[https://pangu.pulanit.com](https://pangu.pulanit.com)。可见，**网站自动开启了HTTPS**。

