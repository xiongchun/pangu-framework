// @ts-check
// Note: type annotations allow type checking and IDEs autocompletion

const lightCodeTheme = require('prism-react-renderer/themes/github');
const darkCodeTheme = require('prism-react-renderer/themes/dracula');

/** @type {import('@docusaurus/types').Config} */
const config = {
	title: '盘古开发框架项目官网',
	tagline: '一套轻量稳健的工业级移动端应用和中后台业务系统开发框架',
	url: 'https://pulanos.gitee.io',
	onBrokenLinks: 'throw',
	onBrokenMarkdownLinks: 'warn',
	favicon: 'img/favicon2.png',
	organizationName: '盘古开发框架,普蓝开源社区', // Usually your GitHub org/user name.
	projectName: 'pangu-framework', // Usually your repo name.
	//plugins: [require.resolve("docusaurus-plugin-image-zoom")],
	//baseUrl: '/',
	baseUrl: '/pangu-framework/',
	// 百度统计 暂停使用
	scripts: [
		//https://pulanos.gitee.io/pangu-framework/
		//{ src: 'https://hm.baidu.com/hm.js?8a2c2aae78c4983e3cf661fea34e6353', async: true },
		//https://pangu.pulanit.com/
		//{src: 'https://hm.baidu.com/hm.js?abe6bd08ebb4621f70496f015defa76b',  async: true},
	],
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
				},
				blog: {
					blogTitle: '博客',
					showReadingTime: true,
					blogSidebarCount: 0,
					blogSidebarTitle: '最新发布博客',
					postsPerPage: 10,
					// Please change this to your repo.
					editUrl: 'https://gitee.com/pulanos/pangu-framework/tree/master/pangu-website/',
				},
				theme: {
					customCss: require.resolve('./src/css/custom.css'),
				},
			}),
		],
	],
	plugins: [
		[
			'@docusaurus/plugin-content-docs',
			{
				id: 'faq',
				path: 'faq',
				routeBasePath: 'faq',
				sidebarPath: require.resolve('./sidebarsFaq.js'),
				// ... other options
			},
		]
	],
	themeConfig:
		/** @type {import('@docusaurus/preset-classic').ThemeConfig} */
		({
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
					label: '开发文档',
				},
				{
					to: '/faq/index',
					label: '常见问答',
					position: 'left'
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
					href: '/online-demo',
					label: '演示系统',
					position: 'left',
				},
				{
					to: '/blog',
					label: '博客',
					position: 'left'
				},
				{
					href: 'https://github.com/xiongchun/pangu-framework',
					label: 'GitHub',
					position: 'right',
				},
				{
					href: 'https://gitee.com/pulanos/pangu-framework',
					label: 'Gitee',
					position: 'right',
				},
				],
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
						to: '/blog',
					}
						, {
						label: '常见问答',
						to: '/docs/faq',
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
						label: 'GitHub PanGu Framework',
						href: 'https://github.com/xiongchun/pangu-framework',
					}, {
						label: 'GitCode PanGu Framework',
						href: 'https://gitcode.net/pulanos/pangu-framework',
					}
					],
				},
				{
					title: '更多',
					items: [{
						label: '致敬',
						to: '/docs/thanks',
					}, {
						label: '开源中国',
						href: 'https://www.oschina.net/',
					},
					{
						label: 'Apache Software Foundation',
						href: 'https://www.apache.org/',
					}
					],
				}
				],
				copyright: `PanGu Dev Framework is Open Source and freely available under the <a target="_blank" class="ghostwhite" href="https://www.apache.org/licenses/LICENSE-2.0">Apache v2 License.</a> 
<br>Copyright © ${new Date().getFullYear()} <a target="_blank" class="ghostwhite" href="https://www.pulanit.com">PuLan Open Source Community</a><br><img src="./img/dashi.gif" />`,
			},
			zoom: {
				selector: '.markdown :not(em) > img,.markdown > img',
				config: {
					// options you can specify via https://github.com/francoischalifour/medium-zoom#usage
					background: {
						light: 'rgb(255, 255, 255)',
						dark: 'rgb(50, 50, 50)'
					}
				}
			},
			prism: {
				theme: lightCodeTheme,
				darkTheme: darkCodeTheme,
			},
			metadata: [
				{ name: 'author', content: '普蓝开源社区' },
				{ name: 'keywords', content: '盘古开发框架 分布式微服务架构 垂直单体分层架构 普蓝开源社区' },
				// 百度站点收录验证
				{ name: 'baidu-site-verification', content: 'code-FsdXztrzOo' }
			]
		}),
};

module.exports = config;
