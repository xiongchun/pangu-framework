<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="容器组件" base="http" lib="ext">
<style type="text/css">
#id_info {
	color: #31708F;
	background: #D9EDF7;
	line-height: 25px;
	text-indent: 2em
}
</style>
<aos:body>
	<div id="id_info" class="x-hidden">（这是一个最简单的容器）AOSuite开发套件基于JavaEE技术体系，以“标准功能可复用、通用模块可配置、行业需求快速开发、异构系统无缝集成”为目标，
		帮助企业落实IT策略、屏蔽技术壁垒，快速实现可水平扩展的7*24小时高可用业务愿景。
		为传统软件企业和互联网企业研发团队提供高效可控、随需应变、快速实现业务需求的全栈式技术解决方案，使其以最低成本和最低风险获得更高质量、更快交付业务和运维支持的核心技术竞争力。</div>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:tabpanel id="id_tabs" region="center" tabPosition="bottom" bodyBorder="0 0 0 0" margin="0 0 2 0">

			<aos:tab title="容器组件" layout="anchor">

				<aos:container anchor="100%" height="80" margin="10" contentEl="id_info">
				</aos:container>

				<aos:panel anchor="100% 20%" margin="10" title="这是一个面板容器" border="true" collapsible="true"
					bodyStyle="padding:'10px'" html="勇闯天下，超级飞侠……">
					<aos:tool type="pin" onclick="call()" />
				</aos:panel>

				<aos:tabpanel id="id_tabs2" anchor="100% 35%" margin="10" plain="true">
					<aos:tab title="选项卡一">
						<aos:panel html="上海" bodyBorder="0 1 1 1">
						</aos:panel>
					</aos:tab>
					<aos:tab title="选项卡二" closable="true">
						<aos:panel html="昆明" bodyBorder="0 1 1 1">
						</aos:panel>
					</aos:tab>
					<aos:tab title="选项卡三" id="id_tab3">
						<aos:panel html="苏州" bodyBorder="0 1 1 1">
						</aos:panel>
					</aos:tab>
				</aos:tabpanel>

			</aos:tab>

			<aos:tab title="窗口组件" onactivate="showWindow">
				<aos:window id="id_w1" title="这是一个模态窗口容器" width="800" height="500" collapsible="true" maximizable="true">
					<aos:docked dock="bottom" ui="footer">
						<aos:dockeditem xtype="tbfill" />
						<aos:dockeditem onclick="#id_w1.hide();" text="关闭" icon="close.png" />
					</aos:docked>
				</aos:window>
			</aos:tab>

			<aos:tab title="IFrame组件">
				<aos:docked forceBoder="0 0 1 0">
					<aos:dockeditem text="主页" onclick="loadMain" icon="home.png" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:textfield id="id_url" emptyText="请输入URL..." value="https://segmentfault.com" width="550" />
					<aos:dockeditem text="访问" onclick="load" icon="go.png" />
					<aos:dockeditem xtype="tbseparator" />
					<aos:dockeditem text="刷新" onclick="load" icon="refresh.png" />
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem icon="icon141.png">
						<aos:menu>
							<aos:menuitem text="打开新的标签页" icon="icon75.png" />
							<aos:menuitem text="打开新的窗口" icon="layout2.png" />
							<aos:menuitem text="打开新的隐身窗口" icon="own.png" />
						</aos:menu>
					</aos:dockeditem>
				</aos:docked>
				<aos:iframe id="id_frame" src="https://segmentfault.com" />
			</aos:tab>

			<aos:tab title="Absolute布局">
				<aos:panel layout="absolute" margin="10" title="Absolute布局：绝对定位布局" border="true">
					<aos:panel title="上海" html="上海" width="100" height="100" x="20" y="5" border="true">
					</aos:panel>
					<aos:panel title="昆明" html="昆明" width="500" height="120" x="180" y="20" border="true">
					</aos:panel>
					<aos:panel title="深圳" html="深圳" width="200" height="120" x="820" y="5" border="true">
					</aos:panel>
					<aos:panel title="苏州" html="苏州" anchor="-20 -10" x="20" y="150" border="true">
					</aos:panel>
				</aos:panel>
			</aos:tab>

			<aos:tab title="Accordion布局">
				<aos:panel margin="5" layout="accordion" title="Accordion布局：手风琴布局" border="true">
					<%-- <aos:layout type="accordion" activeOnTop="false" hideCollapseTool="true"/> --%>
					<aos:panel title="第一栏：系统管理">

					</aos:panel>
					<aos:panel title="第二栏：账户系统">

					</aos:panel>
					<aos:panel title="第三栏：清结算系统">

					</aos:panel>
				</aos:panel>
			</aos:tab>

			<aos:tab title="Border布局">
				<aos:panel margin="5" layout="border" title="Border布局：边框区域布局" border="true">

					<aos:panel region="north" title="North区域" html="这是North区域" height="100" bodyBorder="1 0 1 0">

					</aos:panel>

					<%-- Center区域为必选的一个区域，不能省略。 --%>
					<aos:panel region="center" headerBorder="0 0 0 1" bodyBorder="0 0 0 1" title="Center区域" html="这是Center区域">

					</aos:panel>

					<aos:panel region="west" headerBorder="0 1 1 0" bodyBorder="0 1 0 0" collapsible="true" collapseMode="mini"
						split="true" html="这是West区域" title="West区域" width="200" maxWidth="500">

					</aos:panel>
					<aos:panel region="south" title="South区域" html="这是South区域" height="80" headerBorder="1 0 0 0">

					</aos:panel>
				</aos:panel>

			</aos:tab>

			<aos:tab title="Anchor布局">
				<aos:panel margin="5" layout="anchor" title="Anchor布局：百分比布局" border="true">
					<aos:panel margin="5" title="上海" html="上海" anchor="40% 30%" collapsible="true" border="true">
					</aos:panel>
					<aos:panel title="昆明" html="昆明" anchor="80% 20%" margin="5" border="true">
					</aos:panel>
					<aos:panel title="苏州" html="苏州" anchor="100% 40%" collapsible="true" margin="5" border="true">
					</aos:panel>
					<aos:panel title="大理" html="大理" anchor="100% 10%" margin="5" border="true">
					</aos:panel>
				</aos:panel>
			</aos:tab>

			<aos:tab title="Column布局">
				<aos:panel margin="5" layout="column" title="Column布局：列布局" border="true">
					<aos:panel title="第一列" html="固定宽度的列" width="150" height="400" border="true" margin="5">
					</aos:panel>
					<aos:panel title="第二列" html="第二列(30%)" columnWidth="0.3" height="400" border="true" margin="5">
					</aos:panel>
					<aos:panel title="第三列" html="第三列(70%)" columnWidth="0.7" height="400" border="true" margin="5">
					</aos:panel>
				</aos:panel>
			</aos:tab>

			<aos:tab title="Hbox布局">
				<aos:panel margin="5" title="Hbox布局：水平盒子布局" border="true">
					<aos:layout type="hbox" align="stretch" />
					<%-- 宽度占比为：1/1+2+3+1 --%>
					<aos:panel title="上海" html="上海" flex="1" border="true" margin="5">
					</aos:panel>
					<aos:panel title="深圳" html="深圳" flex="2" border="true" margin="5">
					</aos:panel>
					<aos:panel title="苏州" html="苏州" flex="3" border="true" margin="5">
					</aos:panel>
					<aos:panel title="昆明" html="昆明" flex="1" border="true" margin="5">
					</aos:panel>
				</aos:panel>
			</aos:tab>

			<aos:tab title="Vbox布局">
				<aos:panel margin="5" title="Vbox布局：垂直盒子布局" border="true">
					<aos:layout type="vbox" align="stretch" />
					<%-- 宽度占比为：1/1+2+3+1 --%>
					<aos:panel title="上海" html="上海" flex="1" border="true" margin="5">
					</aos:panel>
					<aos:panel title="深圳" html="深圳" flex="2" border="true" margin="5">
					</aos:panel>
					<aos:panel title="苏州" html="苏州" flex="3" border="true" margin="5">
					</aos:panel>
					<aos:panel title="昆明" html="昆明" flex="1" border="true" margin="5">
					</aos:panel>
				</aos:panel>
			</aos:tab>

			<aos:tab title="Fit布局">
				<aos:panel margin="50" layout="fit" title="Fit布局：自适应拉伸布局" border="true">
					<aos:panel title="自适应拉伸布局" html="拉伸并填充父容器全部区域"  border="true" margin="5">
					</aos:panel>
				</aos:panel>
			</aos:tab>

		</aos:tabpanel>
	</aos:viewport>

	<script type="text/javascript">
	
		function call() {
			AOS.tip('响应事件。');
		}
		
		function showWindow(){
			//本不应该要延时，但不延时的话由于渲染先后顺序导致弹出窗口不能居中定位的问题
			AOS.job(function(){
				id_w1.show();
			},100);
		}
		
		function loadMain() {
			id_frame.load('https://segmentfault.com');
		}
		
		function load() {
			var url = id_url.getValue();
			if(url.indexOf("http") == -1){
				AOS.err('url地址不合法，请以http或https开头!');
				return;
			}
			id_frame.load(url);
		}

	</script>
</aos:onready>