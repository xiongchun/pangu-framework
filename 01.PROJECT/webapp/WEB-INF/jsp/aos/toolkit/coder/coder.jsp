<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="代码生成器">
	<aos:include lib="ext" />
	<aos:base href="system/coder" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_project" region="west" bodyBorder="0 1 0 0" width="300" singleClick="true"
			url="listProjectTree.jhtml" nodeParam="path" rootId="aosroot_" rootText="${app_name_ }" rootIcon="icon25.gif"
			header="false" collapsible="true" collapseMode="mini" split="true">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="项目结构视图" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="新建JSP视图" disabled="true" icon="bullet_blue.png" />
				<aos:menuitem text="新建Controller控制器类" disabled="true" icon="bullet_blue.png" />
				<aos:menuitem text="新建Service服务类" disabled="true" icon="bullet_blue.png" />
				<aos:menuitem text="新增模块向导" disabled="true" icon="modules_wizard.gif" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="新建SQL VarMapper映射" disabled="true" icon="bullet_red.png" />
				<aos:menuitem text="新建VO值对象类" disabled="true" icon="bullet_red.png" />
				<aos:menuitem text="批量生成Dao层代码" onclick="_w_dao_show" icon="bullet_group.gif" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="刷新" onclick="_t_project_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>

		<aos:iframe region="center" loadMask="${page_load_msg_ }" src="fileInit.jhtml" />

		<aos:window id="_w_dao" title="批量生成Dao层代码" width="850" height="-10" layout="fit" onshow="_w_dao_onshow">
			<aos:gridpanel id="_g_dao" bodyBorder="1 0 0 0" url="listTables.jhtml" hidePagebar="true"
				onselectionchange="_g_dao_sc">
				<aos:docked forceBoder="0 0 1 0">
					<aos:textfield id="_name" width="150" emptyText="数据表名称" onenterkey="_g_dao_query" />
					<aos:dockeditem xtype="tbtext" text="Dao包路径:" />
					<aos:textfield id="_dao_pkg" width="410" readOnly="true" />
					<aos:dockeditem xtype="tbtext" text="已选表: " />
					<aos:textfield id="_selection" value="0" width="40" readOnly="true" />
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem text="生成代码" icon="go.gif" onclick="fn_build_dao" />
				</aos:docked>
				<aos:selmodel type="checkbox" mode="simple" />
				<aos:column type="rowno" />
				<aos:column header="表名" dataIndex="name" width="220" />
				<aos:column header="表注释" dataIndex="comment" flex="1" />
				<aos:column header="宿主" dataIndex="owner" width="120" />
			</aos:gridpanel>
			<aos:docked dock="bottom" ui="footer">
                <aos:dockeditem xtype="tbtext" iconVec="fa-hand-o-right " text=" 提示：请先到[字典参数->平台配置]模块中配置数据库的连接参数：websql_jdbc_。" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#_w_dao.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>

	</aos:viewport>
	<script type="text/javascript">
	  //弹出Dao代码生成器窗口
	  function _w_dao_show(){
		  var record = AOS.selectone(_t_project, false);
		  if(!AOS.empty(record.raw.b) || record.raw.b == '1'){
			  _w_dao.show();
		  }else{
			  AOS.tip('选中节点不合法，请重新选择。');
		  }
	  }
	  
	   //监听代码生成器窗口弹出事件
	   function _w_dao_onshow(){
		   var record = AOS.selectone(_t_project, false);
		   _dao_pkg.setValue(record.raw.c);
		   _g_dao_query();
	   }
	
		//查询数据表
		function _g_dao_query() {
			var params = {
					name_ : _name.getValue()
				};
			 _g_dao_store.getProxy().extraParams = params;
			 _g_dao_store.loadPage(1);
		}
		
		//数据表的selectionchange事件
		function _g_dao_sc(){
			_selection.setValue(AOS.rows(_g_dao));
		}

		//刷新工程结构树
		function _t_project_refresh() {
			var refreshnode = AOS.selectone(_t_project);
			if (!refreshnode) {
				refreshnode = _t_project.getRootNode();
			}
			if (refreshnode.isLeaf()) {
				refreshnode = refreshnode.parentNode;
			}
			var params = {};
			_t_project_store.getProxy().extraParams = params;
			_t_project_store.load({
				node : refreshnode,
				callback : function() {
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
		
		 //生成Dao代码
		function fn_build_dao(){
			 var rows = AOS.rows(_g_dao);
			 if(rows === 0){
				 AOS.tip('请先选择数据表。');
				 return;
			 }
             var msg = AOS.merge('提示：确认生成选中的[{0}]张数据表对应的Dao层代码吗？', rows);
             AOS.confirm(msg, function (btn) {
                 if (btn === 'cancel') {
                     AOS.tip('操作被取消。');
                     return;
                 }
	  			   var record = AOS.selectone(_t_project, false);
					AOS.ajax({
					params:{
						aos_rows_: AOS.selection(_g_dao, 'name'),
						outPath : record.data.id,
						package_: record.raw.c
					},
					url : 'buildDaoCode.jhtml',
					ok : function(data) {
						AOS.tip(data.appmsg);
						_w_dao.hide();
						_t_project_refresh();
					}
				});
             });
			 
		}
	</script>
</aos:onready>
</aos:html>