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
        <p className="hero__subtitle">{siteConfig.customFields.subTitle}</p>
		<div class="btn-group">
        <div className={styles.buttons}>
          <Link
            className={styles.xcbutton}
            to="/docs/intro">
            快速开始
          </Link>
		  <Link
		    className={styles.xcbutton2}
		    to="https://gitee.com/pulanos/pangu-framework">
		    下载代码
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
      title={`${siteConfig.title}：${siteConfig.tagline} powered by 普蓝开源社区`}
      description="「盘古开发框架」是完全独立于 Spring Cloud 生态的一套轻量灵活、成熟可靠的工业级分布式微服务开发和治理框架（兼容垂直单体分层架构)。它基于 Apache-2.0 LICENSE 协议开源发布，且是免费的。我们希望不仅是开源的受益者，也能成为开源的贡献者，与开源社区一起「共建共享开源生态」。">
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}