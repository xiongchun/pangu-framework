<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="欢迎" base="http" lib="ext">
<style type="text/css">
#div_content {
	line-height: 23px;
	font-family: tahoma, arial, verdana, sans-serif;
	font-size: 13px;
	letter-spacing: 1px;
	text-indent: 2em;
	padding: 5px;
}
</style>
<aos:body backGround="true">
<c:if test="${run_mode == '2'}">
	<div id="div_content" class="x-hidden">AOS开发套件基于JavaEE技术体系，以“标准功能可复用、通用模块可配置、行业需求快速开发、异构系统无缝集成”为目标，
		帮助企业落实IT策略、屏蔽技术壁垒，快速实现可水平扩展的7*24小时高可用业务愿景。
		为传统软件企业和互联网企业研发团队提供高效可控、随需应变、快速实现业务需求的全栈式技术解决方案，使其以最低成本和最低风险获得更高质量、更快交付业务和运维支持的核心技术竞争力。
	</div>
</c:if>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport>
		<c:if test="${run_mode == '2'}">
			<aos:panel iconVec="fa-bullhorn" iconVecSize="16" contentEl="div_content" width="600" y="40" x="40"
				title="关于AOS开发套件[100%无死角免费又开源]">
				<aos:docked dock="bottom">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem onclick="fn_download" text="下载源代码" icon="icon150.png" />
				</aos:docked>
			</aos:panel>
		</c:if>
	</aos:viewport>
	<script type="text/javascript">
		//下载源代码
		function fn_download() {
			window.open("http://git.oschina.net/osworks/AOS");
		}
	</script>
</aos:onready>