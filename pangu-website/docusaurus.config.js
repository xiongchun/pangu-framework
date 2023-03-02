// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
	title: '盘古开发框架项目官网:一套轻量稳健的工业级 Web 接口服务应用和中后台业务系统开发框架',
	tagline: '一套轻量稳健的工业级 Web 接口服务应用和中后台业务系统开发框架',
	url: 'https://pangu.pulanit.com',
	onBrokenLinks: 'throw',
	onBrokenMarkdownLinks: 'throw',
	favicon: 'img/favicon.ico',
	organizationName: 'xiongchun', // Usually your GitHub org/user name.
	projectName: 'pangu-framework', // Usually your repo name.
	//baseUrl: '/',
	baseUrl: '/pangu-framework/',
	scripts: [
		// GiteEE托管的百度统计 暂停使用
		//https://pulanos.gitee.io/pangu-framework/
		//{ src: 'https://hm.baidu.com/hm.js?8a2c2aae78c4983e3cf661fea34e6353', async: true },
		//https://pangu.pulanit.com/
		{src: 'https://hm.baidu.com/hm.js?abe6bd08ebb4621f70496f015defa76b',  async: true},
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
					showLastUpdateTime: true,
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
				showLastUpdateTime: true,
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
				showLastUpdateTime: true,
				breadcrumbs: true,
			}
		]
	],
	themes:[
		[
			require.resolve("@easyops-cn/docusaurus-search-local"),
			({
				hashed: true,
				language: ["en", "zh"],
				highlightSearchTermsOnTargetPage:true,
				indexPages:true,
				searchResultLimits:10
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
					type: 'doc',
					docId: 'intro',
					position: 'left',
					label: '服务开发',
				},
				{
					to: '/admin/intro',
					label: 'Admin 开发',
					position: 'left'
				},
				{
					to: '/app/misc',
					label: 'APP 开发',
					position: 'left'
				},
				{
					href: '/online-demo',
					label: '在线演示',
					position: 'left',
				},
				{
					href: '/faq',
					label: '常见问答',
					position: 'left',
				},
				{
					to: '/thanks',
					label: '致敬',
					position: 'left'
				},
				{
					href: '/community',
					label: '社区',
					position: 'left',
				},
				{
					to: 'https://xiongchun.pulanit.com/blog/tags/%E7%9B%98%E5%8F%A4%E5%BC%80%E5%8F%91%E6%A1%86%E6%9E%B6',
					label: '博客',
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
						label: '用户指南',
						to: '/docs/intro',
					}, {
						label: '博客专栏',
						to: 'https://xiongchun.pulanit.com/blog/tags/%E7%9B%98%E5%8F%A4%E5%BC%80%E5%8F%91%E6%A1%86%E6%9E%B6',
					}
						, {
						label: '常见问答',
						to: '/faq/misc',
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
					}, {
						label: '在线演示',
						to: '/online-demo',
					},
					{
						label: 'Apache Software Foundation',
						href: 'https://www.apache.org/',
					}
					],
				}
				],
				copyright: `PanGu Dev Framework is Open Source and freely available under the <a target="_blank" class="ghostwhite" href="https://www.apache.org/licenses/LICENSE-2.0">Apache v2 License.</a> 
<br>Copyright © ${new Date().getFullYear()} <a target="_blank" class="ghostwhite" href="https://www.pulanit.com">PuLan Open Source Community</a><br>滇ICP备 2022001611 号<br><img src="https://pangu.pulanit.com/img/dashi.gif" />`,
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
