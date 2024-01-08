// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
	title: '盘古开发框架开源项目官网:企业级数字化赋能开发基座',
	tagline: '一套轻量稳健的企业级数字化赋能开发基座',
	url: 'https://pangu.pulanit.com',
	onBrokenLinks: 'throw',
	onBrokenMarkdownLinks: 'throw',
	favicon: 'img/favicon.ico',
	organizationName: 'xiongchun', // Usually your GitHub org/user name.
	projectName: 'pangu-framework', // Usually your repo name.
	//baseUrl: '/',
	baseUrl: '/pangu-framework',
	scripts: [
		//https://pangu.pulanit.com/
		{ src: 'https://hm.baidu.com/hm.js?abe6bd08ebb4621f70496f015defa76b', async: true },
	],
	i18n: {
		defaultLocale: "zh-Hans",
		locales: ["zh-Hans"],
	},
	presets: [
		[
			'classic',
			/** @type {import('@docusaurus/preset-classic').Options} */
			({
				docs: {
					path: 'docs',
					sidebarPath: require.resolve('./sidebars.js'),
					// Please change this to your repo.
					editUrl: 'https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/',
					showLastUpdateAuthor: true,
					showLastUpdateTime: false,
					breadcrumbs: true,
				},
				// blog: {
				// 	blogTitle: '博客',
				// 	showReadingTime: true,
				// 	blogSidebarCount: 0,
				// 	blogSidebarTitle: '最新发布博客',
				// 	postsPerPage: 10,
				// 	// Please change this to your repo.
				// 	editUrl: 'https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/',
				// },
				theme: {
					customCss: require.resolve('./src/css/custom.css'),
				},
			}),
		],
	],
	plugins: [
		require.resolve('docusaurus-plugin-image-zoom'),
		[
			'@docusaurus/plugin-content-docs',
			{
				id: 'app',
				path: 'app',
				routeBasePath: 'app',
				sidebarPath: require.resolve('./sidebarsApp.js'),
				// ... other options
				showLastUpdateAuthor: true,
				showLastUpdateTime: false,
				breadcrumbs: true,
			}
		],
		[
			'@docusaurus/plugin-content-docs',
			{
				id: 'admin',
				path: 'admin',
				routeBasePath: 'admin',
				sidebarPath: require.resolve('./sidebarsAdmin.js'),
				// ... other options
				showLastUpdateAuthor: true,
				showLastUpdateTime: false,
				breadcrumbs: true,
			}
		]
	],
	themes: [
		[
			require.resolve("@easyops-cn/docusaurus-search-local"),
			({
				hashed: true,
				language: ["en", "zh"],
				highlightSearchTermsOnTargetPage: true,
				indexPages: true,
				searchResultLimits: 10
			})
		]
	],
	themeConfig:
		/** @type {import('@docusaurus/preset-classic').ThemeConfig} */
		({
			zoom: {
				selector: '.markdown :not(em) > img,.markdown > img, article img[loading]',
				background: {
					light: 'rgb(255, 255, 255)',
					dark: 'rgb(50, 50, 50)'
				},
				// options you can specify via https://github.com/francoischalifour/medium-zoom#usage
				config: {}
			},
			docs: {
				sidebar: {
					hideable: true,
				}
			},
			navbar: {
				title: '盘古开发框架®',
				hideOnScroll: true,
				logo: {
					alt: '盘古开发框架',
					src: 'img/logo.svg',
				},
				items: [{
					to: '/intro',
					label: '简介',
					position: 'left'
				}, {
					type: 'doc',
					docId: 'intro',
					position: 'left',
					label: '微服务开发',
				},
				{
					to: '/admin/intro',
					label: 'Admin 开发',
					position: 'left'
				},
				{
					to: '/app/intro',
					label: 'APP 开发',
					position: 'left'
				},
				{
					type: 'dropdown',
					label: '在线体验',
					position: 'left',
					items: [
						{
							label: '「盘古 Admin」中后台业务系统二次开发脚手架',
							href: '/online-demo',
						},
						{
							label: '「盘古 APP」移动端多平台快速开发脚手架',
							href: '/online-demo-app',
						}
					],
				},
				{
					to: '/thanks',
					label: '致敬',
					position: 'left'
				},
				/* {
					href: '/community',
					label: '社区',
					position: 'left',
				}, */
				 {
					to: 'https://xiong-chun.gitee.io/home',
					label: '作者博客',
					position: 'left'
				}, 
				{
					href: 'https://gitee.com/pulanos/pangu-framework',
					position: 'right',
					className: 'header-gitee-link'
				},
				{
					href: 'https://github.com/xiongchun/pangu-framework',
					position: 'right',
					className: 'header-github-link'
				}
				]
			},
			footer: {
				style: 'dark',
				links: [{
					title: '文档',
					items: [{
						label: '盘古微服务开发',
						to: '/docs/intro',
					}, {
						label: '盘古 Admin 开发',
						to: '/admin/intro',
					}, {
						label: '盘古 APP 开发',
						to: '/app/intro',
					}
					],
				},
				{
					title: '源码',
					items: [{
						label: 'Gitee PanGu Framework',
						href: 'https://gitee.com/pulanos/pangu-framework',
					},
					{
						label: 'GitCode PanGu Framework',
						href: 'https://gitcode.net/pulanos/pangu-framework',
					}, {
						label: 'GitHub PanGu Framework',
						href: 'https://github.com/xiongchun/pangu-framework',
					}
					],
				},
				{
					title: '更多',
					items: [{
						label: '致敬',
						to: '/thanks',
					},
					/*  {
						label: '博客',
						to: 'https://xiongchun.pulanit.com/blog/tags/%E7%9B%98%E5%8F%A4%E5%BC%80%E5%8F%91%E6%A1%86%E6%9E%B6',
					}, */
					/* {
						label: 'Apache Software Foundation',
						href: 'https://www.apache.org/',
					} */
					{
						label: '盘古 Admin 在线体验',
						to:'/online-demo'
					},
					{
						label: '盘古 App 在线体验',
						to:'/online-demo-app'
					}

					],
				}
				],
				copyright: `PanGu Dev Framework is Open Source and freely available under the <a target="_blank" class="ghostwhite" href="https://www.apache.org/licenses/LICENSE-2.0">Apache v2 License.</a> 
<br>Copyright © ${new Date().getFullYear()} <a target="_blank" class="ghostwhite" href="https://xiongchun.pulanit.com">程序员大熊</a> <a class="ghostwhite" href="https://beian.miit.gov.cn/" target="_blank">滇ICP备2022001611号-1</a><br><img src="https://pangu.pulanit.com/img/dashi.gif" />`,
			},
			prism: {
				theme: lightCodeTheme,
				darkTheme: darkCodeTheme,
			},
			metadata: [
				{ name: 'author', content: '码农大熊' },
				{ name: 'keywords', content: '盘古开发框架 盘古通用权限系统 盘古开源中后台业务脚手架 pangu-admin 分布式微服务架构 垂直单体分层架构 码农大熊' },
				// 百度站点收录验证
				{ name: 'baidu-site-verification', content: 'code-FsdXztrzOo' }
			]
		}),
};

module.exports = config;
