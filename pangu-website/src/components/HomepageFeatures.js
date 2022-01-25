import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: '开箱即用、轻量灵活',
    Svg: require('../../static/img/plugins.svg').default,
    description: (
      <>
        开箱即用的技术组件库、搭配自定义SpringBoot启动器和轻巧的代码生成Maven插件，可随意组合、自动装配、灵活插拔。
		既能构建支持大并发高可用的互联网分布式架构也能快速搭建垂直单体分层架构。
      </>
    ),
  },
  {
    title: '成熟架构、稳定可靠',
    Svg: require('../../static/img/feat_coming.svg').default,
    description: (
      <>盘古技术栈融合云原生思想，在微服务、容器化、DevOps等方面完美支持和适配。在云原生时代构建以"服务"为中心的现代应用架构，帮助用户在各种云环境中更好的构建、交付和管理自己的微服务平台。
      </>
    ),
  },
  {
    title: '全栈百搭适配各类业务场景',
    Svg: require('../../static/img/feat_vault.svg').default,
    description: (
      <>
        聚焦面向（移动）互联网的电商、金融、云端SAAS服务等大并发高可用可扩展的业务场景。
		同时也能满足诸如ERP、CRM等各种企业数字化和各级电子政务系统的中小规模应用需求。
      </>
    ),
  },
  
];

function Feature({Svg, title, description}) {
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
