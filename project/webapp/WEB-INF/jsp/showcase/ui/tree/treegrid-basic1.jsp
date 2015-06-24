<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="/showcase/tag/" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="银行组织机构" autoShow="true" maximized="true" layout="fit" width="1024" height="600" maximizable="true">
		<aos:treepanel id="mytree" url="listTreeGridNodes.jhtml" nodeParam="az02a3" rootVisible="false">
			<aos:column type="tree" header="机构名称" dataIndex="az02a2" width="300" align="left" locked="true" />
			<aos:column header="机构编码" dataIndex="az02a1" />
			<aos:column header="联系电话" dataIndex="az02a5" width="150" />
			<aos:column header="地址" dataIndex="az02a4" flex="1" />
		</aos:treepanel>
	</aos:window>
	<script type="text/javascript">
		//监听
		/* 		_t_dataobjs_store.on('load',function(){
		 var node = _t_dataobjs.getRootNode();
		 var text = node.data.text;
		 text = text + '(' + node.childNodes.length + ')';
		 node.data.text = text;
		 }); */
	</script>
</aos:onready>
</aos:html>