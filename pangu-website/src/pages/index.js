import React from 'react';
import clsx from 'clsx';
import Layout from '@theme/Layout';
import Link from '@docusaurus/Link';
import useDocusaurusContext from '@docusaurus/useDocusaurusContext';
import styles from './index.module.css';
import HomepageFeatures from '../components/HomepageFeatures';

function HomepageHeader() {
  const { siteConfig } = useDocusaurusContext();
  return (
    <header className={clsx('hero hero--primary', styles.heroBanner)}>
      <div className="container">
        <h1 className="hero__title"><span className={styles.hero__title2}>盘古开发框架</span></h1>
        <p className="hero__subtitle">一套轻量稳健的工业级<b> Web 接口服务</b>和<b>中后台业务系统</b>开发框架</p>
        <div className="btn-group">
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
  const { siteConfig } = useDocusaurusContext();
  return (
    <Layout
      description={`${siteConfig.tagline}`}>
      <HomepageHeader />
      <main>
        <HomepageFeatures />
      </main>
    </Layout>
  );
}