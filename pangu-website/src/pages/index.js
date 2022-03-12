import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import styles from './index.module.css';
import HomepageFeatures from '../components/HomepageFeatures';

function HomepageHeader() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <h1 class="hero__title"><span className={styles.hero__title2}>{siteConfig.title}</span></h1>
        <p className="hero__subtitle">{siteConfig.tagline}</p>
		<div class="btn-group">
        <div className={styles.buttons}>
          <Link
            className={styles.xcbutton}
            to="/docs/intro">
            快速开始
          </Link>
        </div>
		</div>

      </div>
    </header>
  );
}

export default function Home() {
  const {siteConfig} = useDocusaurusContext();
  return (
    <Layout
      title={`${siteConfig.title}：一套轻量灵活的 Java 开源企业级单体开发 & 微服务分布式开发治理框架 powered by 普蓝开源社区`}
      description="盘古开发框架：开箱即用的技术组件库、搭配自定义 SpringBoot 启动器和轻巧的代码生成 Maven 插件，可随意组合、自动装配、灵活插拔。 既能构建支持大并发高可用的互联网分布式架构也能快速搭建垂直单体分层架构；盘古技术栈融合云原生思想，在微服务、容器化、DevOps 等方面完美支持和适配。可在云原生时代构建以「服务」为中心的现代应用架构，帮助用户在云环境中更好的构建、交付和管理自己的微服务平台；聚焦面向（移动）互联网的电商、金融、云端 SAAS 服务等大并发高可用可扩展的业务场景。 同时也能满足诸如 ERP 、CRM 等各种企业数字化和各级电子政务系统的中小规模应用需求，全栈百搭适配各类业务场景。">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}