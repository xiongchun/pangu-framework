import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: '开箱即用、轻量灵活',
    Svg: require('../../static/img/undraw_product_teardown.svg').default,
    description: (
      <>
        开箱即用的技术组件库、搭配自定义SpringBoot启动器和轻巧的代码生成Maven插件，可实现随意组合、自动装配、灵活插拔。
		框架还配有详尽丰富的文档、视频教程和范例模版，新手入门零成本。
      </>
    ),
  },
  {
    title: '成熟架构、稳定可靠',
    Svg: require('../../static/img/feat_coming.svg').default,
    description: (
      <>既能构建支持大并发高可用的互联网分布式架构也能搭建小而美的传统单体分层架构。
	  盘古技术栈融合云原生思想，在微服务、容器化、DevOps等方面完美支持和兼容适配，保障应用的快速开发和持续交付。
      </>
    ),
  },
  {
    title: '全栈百搭适配各类业务场景',
    Svg: require('../../static/img/feat_vault.svg').default,
    description: (
      <>
        擅长面向（移动）互联网的电商、金融、云端SAAS服务等大并发高可用可扩展的业务场景。
		同时也能满足诸如ERP、CRM之类的各种企业数字化和各级电子政务系统等中小规模应用。
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
