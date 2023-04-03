import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: '免费开源、自主可控',
    Svg: require('../../static/img/plugins.svg').default,
    description: (
      <>
        「盘古开发框架」基于商业友好的 <a href='https://www.apache.org/licenses/LICENSE-2.0' target='_blank'>Apache-2.0</a> 开源协议<b>免费开源</b>发布。希望能为业界持续输出正向、积极的力量，不仅做开源的受益者也能成为开源贡献者，与开源社区一起共建共享开源生态。
      </>
    ),
  },
  {
    title: '成熟生态、快速开发',
    Svg: require('../../static/img/feat_coming.svg').default,
    description: (
      <>
        由盘古「服务开发框架」、「中后台系统开发脚手架」、「移动端多平台开发脚手架」组成前、中、后台三维多端行业数字化赋能开发框架。可在云原生时代构建以「服务」为中心的现代应用架构，帮助用户在云环境中更好的构建和交付数字化开发任务。
      </>
    ),
  },
  {
    title: '全栈百搭适配各类业务场景',
    Svg: require('../../static/img/feat_vault.svg').default,
    description: (
      <>
        聚焦面向（移动）互联网的电商、金融、云端 SAAS 服务等大并发高可用可扩展的互联网应用场景。
        同时也能满足诸如 ERP 、CRM 等各种企业数字化和各级电子政务系统的中小规模业务需求。
      </>
    ),
  }

];

function Feature({ Svg, title, description }) {
  return (
    <div className={clsx('col col--4')}>
      <div className="text--center">
        <Svg className={styles.featureSvg} alt={title} />
      </div>
      <div className="text--center padding-horiz--md">
        <h3>{title}</h3>
        <p>{description}</p>
      </div>
    </div>
  );
}

export default function HomepageFeatures() {
  return (
    <section className={styles.features}>
      <div className="container">
        <div className="row">
          {FeatureList.map((props, idx) => (
            <Feature key={idx} {...props} />
          ))}
        </div>
      </div>
    </section>
  );
}
