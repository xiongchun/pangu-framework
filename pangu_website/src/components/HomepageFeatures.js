import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: '开箱即用、轻量灵活',
    Svg: require('../../static/img/undraw_product_teardown.svg').default,
    description: (
      <>
        基于SpringBoot Starter机制，封装的成熟技术组件。以及轻巧的代码生成器Maven插件。任意插拔、随意组合，可进行传统单体应用开发，也可以进行微服务分布式开发和服务治理。大量的范例工程、文档、视频教程，一直伴你“从入门到大神”。
      </>
    ),
  },
  {
    title: '轻量灵活',
    Svg: require('../../static/img/feat_coming.svg').default,
    description: (
      <>
        Docusaurus lets you focus on your docs, and we&apos;ll do the chores. Go
        ahead and move your docs into the <code>docs</code> directory.
      </>
    ),
  },
  {
    title: '稳定可靠',
    Svg: require('../../static/img/feat_vault.svg').default,
    description: (
      <>
        Extend or customize your website layout by reusing React. Docusaurus can
        be extended while reusing the same header and footer.
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
