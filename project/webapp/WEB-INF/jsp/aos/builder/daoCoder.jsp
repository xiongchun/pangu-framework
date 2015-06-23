<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head title="Dao代码生成">
	<aos:include lib="ext" />
	<aos:base href="system/daoCoder/" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">
		<aos:treepanel id="_t_project" region="west" bodyBorder="0 1 0 0" width="260" singleClick="false"
			onitemclick="fnBuilderStatus" url="listProjectTree.jhtml" nodeParam="path" rootId="_aosroot" rootText="AOS Project"
			rootIcon="icon25.gif" header="false" collapsible="true" collapseMode="mini" split="true">
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="项目结构视图" />
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem id="_btn_builder" text="生成代码" onclick="_w_builder_show" disabled="true" icon="go.gif" />
			</aos:docked>
			<aos:menu onshow="fnBuilderStatus">
				<aos:menuitem id="_mi_builder" text="生成代码" onclick="_w_builder_show" disabled="true" icon="go.gif" />
				<aos:menuitem text="刷新" onclick="_t_project_refresh" icon="refresh.png" />
			</aos:menu>
		</aos:treepanel>
		<aos:gridpanel id="_g_tables" region="center" url="listTables.jhtml" hidePagebar="true" autoLoad="true"
			bodyBorder="1 0 0 1" onrender="_g_tables_query" >
			<aos:docked forceBoder="0 0 1 1">
				<aos:triggerfield emptyText="${table_emptytext}" name="tablename" id="_tablename" onenterkey="_g_tables_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_tables_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="刷新" onclick="#_g_tables_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="simple" />
			<aos:column type="rowno" />
			<aos:column header="数据表" dataIndex="name_comment" width="250" celltip="true" />
			<aos:column header="隐藏参数" dataIndex="name" hidden="true" hideable="false" />
			<aos:column header="Dao对象前缀名" dataIndex="alias" width="200" />
			<aos:column header="目标源文件" type="template" tpl="{alias}PO.java | {alias}Mapper.java | {alias}Mapper.xml" flex="1" />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="_w_builder" title="Dao代码生成">
		<aos:formpanel id="_f_builder" width="500" layout="anchor" labelWidth="115">
			<aos:hiddenfield name="outPath" fieldLabel="隐藏变量" />
			<aos:textfield name="basepath" fieldLabel="主路径" readOnly="true" />
			<aos:textfield name="mapperpath" fieldLabel="数据访问接口包路径" readOnly="true" />
			<aos:textfield name="xmlmapperpath" fieldLabel="SQL映射文件包路径" readOnly="true" />
			<aos:textfield name="popath" fieldLabel="持久化对象包路径" readOnly="true" />
			<aos:textfield name="author" fieldLabel="注释签名" value="XiongChun" allowBlank="false" maxLength="20" />
			<aos:fieldset title="提示" checkboxToggle="false" padding="3 0 0 5"
				html="每张数据表生成1个持久化对象*PO.java、1个数据访问接口*Mapper.java、1个SQL映射文件*Mapper.xml。(同一包路径下重复生成则覆盖原文件)" border="false" />
			<aos:fieldset title="建议" checkboxToggle="false" padding="3 0 0 5"
				html="Dao代码建议以子系统或系统全局为单位统一存放。Dao代码生成后不能手工修改，数据表变更请重新生成代码。" border="false" />
			<aos:fieldset title="警告" checkboxToggle="false" padding="3 0 0 5"
				html="系统表已经生成Dao代码，无需再次生成。勿将同一张数据表在不同包路径下生成Dao代码，这会导致重启服务失败。可尝试删除多余代码后再启动。" border="false" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem text="执行" onclick="_f_builder_submit" icon="go.gif" />
			<aos:dockeditem onclick="#_w_builder.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
			//_p_out.collapse();

			//查询待选列表
			function _g_tables_query() {
				var params = {
					tablename : _tablename.getValue()
				};
				_g_tables_store.getProxy().extraParams = params;
				_g_tables_store.load();
			}
			
			//刷新工程结构树
			function _t_project_refresh() {
				var refreshnode = App.selectone(_t_project);
				if (!refreshnode) {
					refreshnode = _t_project.getRootNode();
				}
				if (refreshnode.isLeaf()) {
					refreshnode = refreshnode.parentNode;
				}
				var params = {
				};
				_t_project_store.getProxy().extraParams = params;
				_t_project_store.load({
					node : refreshnode,
					callback : function() {
						//refreshnode.collapse();
						refreshnode.expand();
					}
				});
			}
			
			//生成代码按钮状态控制
			function fnBuilderStatus(){
				var record = App.selectone(_t_project);
				if(record.raw.dtype === '1'){
					Ext.getCmp('_mi_builder').enable();
					Ext.getCmp('_btn_builder').enable();
				}else{
					Ext.getCmp('_mi_builder').disable();
					Ext.getCmp('_btn_builder').disable();
				}
			}
			
			//弹出
			function _w_builder_show(){
				if(App.rows(_g_tables) === 0){
					App.tip('请先选择数据表。');
					return ;
				}
				_w_builder.show();
				App.reset(_f_builder);
				var record = App.selectone(_t_project);
				var basepath = record.raw.pkgpath;
				_f_builder.down('[name=basepath]').setValue(basepath);
				_f_builder.down('[name=mapperpath]').setValue(basepath);
				_f_builder.down('[name=popath]').setValue(basepath + ".sqlmap.po");
				_f_builder.down('[name=xmlmapperpath]').setValue(basepath + ".sqlmap");
				_f_builder.down('[name=outPath]').setValue(record.raw.id);
			}
			
			 //生成代码
			function _f_builder_submit(){
 				App.ajax({
					forms : _f_builder,
					params:{
						_selection: App.selection(_g_tables, 'name')
					},
					url : 'saveCode.jhtml',
					ok : function(data) {
						_w_builder.hide();
						_g_tables_store.reload();
						App.info(data.appmsg);
						_t_project_refresh();
					}
				}); 
			}
		</script>
</aos:onready>
</aos:html>