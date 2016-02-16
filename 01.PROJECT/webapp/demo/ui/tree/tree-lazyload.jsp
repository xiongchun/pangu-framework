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
		<aos:treepanel id="mytree" url="listTreeNodes.jhtml" nodeParam="az02a3" />
	</aos:window>
	<script type="text/javascript">
		//一些参考代码，不是操作本页面的树的
		function _t_catalog_refresh() {
			//var refreshnode = _t_module_store.getById(data.nodeid);
			var refreshnode = AOS.selectone(_t_catalog);
			if (refreshnode.isLeaf()) {
				refreshnode = refreshnode.parentNode;
			}
			_t_catalog_store.load({
				node : refreshnode,
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand(true);
				}
			});
		}

		/* 	_parent_id__store.on('beforeload',function(store, operation, eOpts){
		 var params = {
		 aa05b1: _aa05b1.getValue()
		 }; 
		 _parent_id__store.getProxy().extraParams = params;
		 }); */
	</script>
</aos:onready>
</aos:html>