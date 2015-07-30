<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="欢迎">
	<aos:include lib="ext" />
	<aos:base href="system/portal"/>
	<c:if test="${welcome_mac_on == '1' }">
		<aos:include js="${cxt}/static/weblib/macdock/macdock.js" />
	</c:if>
	<style>
	body {
	 	background-color: #FFFFFF !important;
		background-attachment:fixed !important;
		background-position:bottom center !important;
		background-repeat: repeat-x !important;
	}
	#_div_mac {text-align:center; position:absolute; bottom:10px; width:100%;}
	#_div_mac img {border:none;margin:5px;cursor: pointer;}
	</style>
</aos:head>
<aos:body>
	<c:if test="${welcome_mac_on == '1' }">
		<div id="_div_mac" class="x-hidden">
			<c:forEach var="menu" items="${macList}">
				<img id="${menu.id_}" width="45" onclick="_fn_mac_click(this, '${menu.url_}', '${menu.name_}');"
					onmouseover="_fn_mac_over(this, '${menu.name_}');" src="${cxt}/static/icon/big64/${menu.nav_icon_}" />
			</c:forEach>
		</div>
	</c:if>
</aos:body>
<aos:onready elAuth="false">
	<script type="text/javascript">
		<c:if test="${welcome_mac_on == '1' }">
		Ext.get('_div_mac').removeCls('x-hidden');
		</c:if>
		//这个页面的背景图片需要延时设置，不能使用body标签的backGround属性
		Ext.util.CSS.createStyleSheet(
						'body {background-image:url("${cxt}/static/image/background/main/${curSkin}.png") !important; ',
						'_id_css_01');
	</script>
</aos:onready>
<script type="text/javascript">
	//Mac菜单提示信息
	var mac_tip = Ext.create('Ext.tip.ToolTip', {
		anchor : 'top',
		anchorOffset : 10,
		hideDelay : 0,
		showDelay : 0,
		html : ''
	});

	//Mac菜单图片单击监听
	function _fn_mac_click(me, url, title) {
		parent.fnaddtab(me.id, title, url);
	}

	//Mac菜单图片焦点监听
	function _fn_mac_over(me, tipmsg) {
		mac_tip.setTarget(me);
		mac_tip.update(tipmsg);
		mac_tip.show();
	}
</script>
</aos:html>