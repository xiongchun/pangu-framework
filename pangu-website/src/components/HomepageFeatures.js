import React from 'react';
import clsx from 'clsx';
import styles from './HomepageFeatures.module.css';

const FeatureList = [
  {
    title: '免费开源、自主可控',
    Svg: require('../../static/img/plugins.svg').default,
    description: (
      <>
        「盘古开发框架」基于 <a href='https://www.apache.org/licenses/LICENSE-2.0' target='_blank'>Apache-2.0</a> 开源协议<b>免费开源</b>发布。始终坚持分享经验传递价值成就你我的初心，与开源社区一起共建共享开源生态。
      </>
    ),
  },
  {
    title: '成熟生态、快速开发',
    Svg: require('../../static/img/feat_coming.svg').default,
    description: (
      <>
        「盘古开发框架」支持前、中、后台三维多端行业数字化赋能开发。可构建以服务为中心的现代应用、中后台业务系统、小程序及移动端APP。
      </>
    ),
  },
  {
    title: '全栈百搭适配各类业务场景',
    Svg: require('../../static/img/feat_vault.svg').default,
    description: (
      <>
       「盘古开发框架」聚焦面向电商、金融、云端 SAAS 平台等大并发高可用可扩展的互联网应用场景。同时也满足各类中小规模业务系统的数字化需求。
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
