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
      title={`${siteConfig.title}:一套轻量灵活的Java开源企业级单体开发 & 微服务分布式开发治理框架 普蓝开源社区出品`}
      description="一套轻量灵活的Java开源企业级单体开发 & 微服务分布式开发治理框架">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}