<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="个人设置">
	<aos:include lib="ext" />
	<aos:base href="system/preference" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:panel region="west" width="180" border="false" layout="auto" >
			<aos:docked forceBoder="${bodyBorder}">
				<aos:dockeditem xtype="button" icon="icon140.png"/>
				<aos:dockeditem xtype="tbtext" text="首选项导航"/>				
			</aos:docked>
			<aos:menu floating="false" >
				<c:forEach var="page" items="${mdpm.subPages}">
					<c:if test="${page.type_ == '2' }">
						<aos:menuitem id="_id_${page.id_}" text="${page.name_}"
							onclick="_fn_load('${page.url_}?aos_module_id_=${page.module_id_}&aos_page_id_=${page.id_}')"
							icon="${page.icon_}" />
					</c:if>
					<c:if test="${page.type_ == '4' }">
						<aos:menuitem xtype="menuseparator" />
					</c:if>
				</c:forEach>
			</aos:menu>
		</aos:panel>
		<aos:panel region="center" layout="fit" bodyBorder="0 0 0 1">
			<aos:iframe id="_iframe" loadMask="${page_load_msg_ }"
				src="${mdpm.defaultPage.url_}?aos_module_id_=${mdpm.defaultPage.module_id_}&aos_page_id_=${mdpm.defaultPage.id_}" />
		</aos:panel>
	</aos:viewport>
	<script type="text/javascript">
	   //加载子页面
		function _fn_load(url) {
			if (url.substring(0,1) !== '?') {
				_iframe.load(url);
			}else{
				AOS.tip('没有配置菜单的请求地址。');
			}
		}
	</script>
</aos:onready>
</aos:html>