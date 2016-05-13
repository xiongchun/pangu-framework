<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="ID管理">
	<aos:include lib="ext" />
	<aos:base href="system/idMgr" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:gridpanel id="_g_id" url="listIds.jhtml" onrender="_g_id_query" onitemdblclick="_w_id_u_show">
			<aos:docked>
				<aos:dockeditem onclick="_w_id_show" text="新增" icon="add.png" />
				<aos:dockeditem onclick="_w_id_u_show" text="修改" icon="edit.png" />
				<aos:dockeditem onclick="_g_id_del" text="删除" icon="del.png" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:triggerfield emptyText="ID名称" name="name_" id="_name_" onenterkey="_g_id_query"
					trigger1Cls="x-form-search-trigger" onTrigger1Click="_g_id_query" width="180" />
			</aos:docked>
			<aos:menu>
				<aos:menuitem text="计算" onclick="fnCalc" icon="go.gif" />
				<aos:menuitem xtype="menuseparator" />
				<aos:menuitem text="新增" onclick="_w_id_show" icon="add.png" />
				<aos:menuitem text="修改" onclick="_w_id_u_show" icon="edit.png" />
				<aos:menuitem text="删除" onclick="_g_id_del" icon="del.png" />
				<aos:menuitem text="刷新" onclick="#_g_id_store.reload();" icon="refresh.png" />
			</aos:menu>
			<aos:selmodel type="checkbox" mode="multi" />
			<aos:column type="rowno" />
			<aos:column header="流水号" dataIndex="id_" hidden="true" />
			<aos:column header="ID名称" dataIndex="name_" width="120" locked="true" />
			<aos:column header="ID类型" dataIndex="type_" rendererField="sequence_type_" locked="true" />
			<aos:column header="计算" type="action" width="40" locked="true">
				<aos:action handler="fnCalc" icon="go.gif" tooltip="计算下一ID值" />
			</aos:column>
			<aos:column header="当前值" dataIndex="cur_value_" width="160" celltip="true" />
			<aos:column header="当前格式化值" dataIndex="format_value_" width="180" celltip="true" />
			<aos:column header="递增" dataIndex="step_" width="50" />
			<aos:column header="最小值" dataIndex="min_value_" />
			<aos:column header="最大值" dataIndex="max_value_" width="160" />
			<aos:column header="循环" dataIndex="is_circul_" rendererField="bool_" width="60" />
			<aos:column header="零补足" dataIndex="is_leftpad_" rendererField="bool_" width="60" />
			<aos:column header="前缀" dataIndex="prefix_" width="150" />
			<aos:column header="后缀" dataIndex="suffix_" width="150" />
			<aos:column header="连接符" dataIndex="connector_" width="60" />
			<aos:column header="DB序列名称" dataIndex="db_seq_name_" />
			<aos:column header="备注" dataIndex="remark_" flex="1" minWidth="150" celltip="true" />
		</aos:gridpanel>
	</aos:viewport>
	<aos:window id="_w_id" title="新增ID">
		<aos:formpanel id="_f_id" width="400" layout="anchor" labelWidth="70">
			<aos:hiddenfield name="id_" fieldLabel="ID流水号" />
			<aos:combobox name="type_" fieldLabel="ID类型" allowBlank="false" editable="false" onselect="fn_type_select" value="1"
				columnWidth="1" dicField="sequence_type_" />
			<aos:textfield name="name_" fieldLabel="ID名称" allowBlank="false" maxLength="20" />
			<aos:textfield name="db_seq_name_" fieldLabel="序列名称" allowBlank="false" maxLength="50" />
			<aos:textfield name="min_value_" fieldLabel="最小值" allowBlank="false" maxLength="19" value="1" />
			<%--(0表示初始化, nextValue=初始值+1) --%>
			<aos:textfield name="cur_value_" fieldLabel="当前值" allowBlank="false" value="0" maxLength="19" />
			<aos:numberfield name="step_" fieldLabel="递增" allowBlank="false" value="1" minValue="1" maxValue="1000" />
			<aos:textfield name="max_value_" fieldLabel="最大值" allowBlank="false" value="9223372036854775807" maxLength="19" />
			<aos:rowset rowSpace="5">
				<aos:combobox name="is_circul_" fieldLabel="是否循环" value="0" editable="false" dicField="bool_" columnWidth="0.45"
					padding="0 5 0 0" />
				<aos:displayfield name="is_circul_a" value="(号源用尽后自动从最小值开始循环)" columnWidth="0.55" />
			</aos:rowset>
			<aos:rowset rowSpace="5">
				<aos:combobox name="is_leftpad_" fieldLabel="是否补足" value="0" editable="false" dicField="bool_" columnWidth="0.45"
					padding="0 5 0 0" />
				<aos:displayfield name="is_leftpad_a" value="(左边0补足位数到最大值长度)" columnWidth="0.55" />
			</aos:rowset>
			<aos:textfield name="prefix_" fieldLabel="前缀" maxLength="50" />
			<aos:textfield name="suffix_" fieldLabel="后缀" maxLength="50" />
			<aos:textfield name="connector_" fieldLabel="连接符" maxLength="2" />
			<aos:textareafield name="remark_" fieldLabel="备注" maxLength="500" height="80" />
		</aos:formpanel>
		<aos:docked dock="bottom" ui="footer">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem onclick="_f_id_save" text="保存" icon="ok.png" />
			<aos:dockeditem onclick="#_w_id.hide();" text="关闭" icon="close.png" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
		//显示ID新增窗口
		function _w_id_show(){
			//新增
			AOS.reset(_f_id);
			AOS.hides(_f_id, 'db_seq_name_');
			AOS.disables(_f_id, 'db_seq_name_');
			AOS.edits(_f_id, 'name_,type_');
			_f_id_init('1');
			_w_id.setTitle(AOS.title('新增ID'));
			_w_id.show();
		}
		
	  //显示ID修改窗口
	  function _w_id_u_show(){
	  	 record = AOS.selectone(_g_id);
	  	 if(record){
		  	 AOS.reads(_f_id, 'name_,type_');
		  	 _w_id.setTitle(AOS.title('修改ID'));
		  	 var type_ = record.data.type_;
		  	 _f_id_init(type_);
		     _f_id.loadRecord(record);
		  	 _w_id.show();
	  	 }
	  }
	  
        //修改ID保存
		function _f_id_update(){
				AOS.ajax({
				forms : _f_id,
				url : 'updateId.jhtml',
				ok : function(data) {
					_w_id.hide();
					_g_id_store.reload();
					AOS.tip(data.appmsg);
				}
			}); 
		}
      
       //保存
	  function _f_id_save(){
			var id_ = _f_id.form.findField('id_').getValue();
			if(AOS.empty(id_)){
				//新增
				_f_id_submit();
			}else{
				//修改
				_f_id_update();
			}
		}
	  
	  //初始化表单元素
	  function _f_id_init(type_){
			if(type_ === '1'){
				AOS.enables(_f_id, 'min_value_,cur_value_,step_,max_value_,is_circul_,is_circul_a,db_seq_name_,is_leftpad_,is_leftpad_a');
				AOS.shows(_f_id, 'min_value_,cur_value_,step_,max_value_,is_circul_,is_circul_a,db_seq_name_,is_leftpad_,is_leftpad_a');
				AOS.hides(_f_id, 'db_seq_name_');
				AOS.disables(_f_id, 'db_seq_name_');
			}
			if(type_ === '2'){
				AOS.disables(_f_id, 'min_value_,cur_value_,step_,max_value_,is_circul_,is_leftpad_a,db_seq_name_,is_leftpad_,is_leftpad_a');
				AOS.hides(_f_id, 'min_value_,cur_value_,step_,max_value_,is_circul_,is_circul_a,db_seq_name_,is_leftpad_,is_leftpad_a');
			}
			if(type_ === '3'){
				AOS.disables(_f_id, 'min_value_,cur_value_,step_,max_value_,is_circul_,is_circul_a,is_leftpad_,is_leftpad_a');
				AOS.hides(_f_id, 'min_value_,cur_value_,step_,max_value_,is_circul_,is_circul_a,is_leftpad_,is_leftpad_a');
				AOS.shows(_f_id, 'db_seq_name_');
				AOS.enables(_f_id, 'db_seq_name_');
			}
	  }
		
		//ID类型type_选择事件
		function fn_type_select(combo, records, eOpts){
			var type_ = combo.getValue();
			_f_id_init(type_);
		}
		
        //查询ID列表
		function _g_id_query(){
			var params = {
					name_ : _name_.getValue()
			};
			_g_id_store.getProxy().extraParams = params;
			_g_id_store.loadPage(1);
		 }
        
        //新增ID保存
		function _f_id_submit(){
				AOS.ajax({
				forms : _f_id,
				url : 'saveId.jhtml',
				ok : function(data) {
					if(data.appcode != -1){
						_w_id.hide();
						_g_id_store.reload();
					}
					AOS.tip(data.appmsg);
				}
			}); 
		 }
        
        //删除ID
		function _g_id_del(){
			var selection = AOS.selection(_g_id, 'id_');
			if(AOS.empty(selection)){
				AOS.tip('删除前请先选中数据。');
				return;
			}
			var rows = AOS.rows(_g_id);
			var msg =  AOS.merge('确认要删除选中的[{0}]条数据吗？', rows);
			AOS.confirm(msg, function(btn){
				if(btn === 'cancel'){
					AOS.tip('删除操作被取消。');
					return;
				}
				AOS.ajax({
					url : 'deleteId.jhtml',
					params:{
						aos_rows_: selection
					},
					ok : function(data) {
						AOS.tip(data.appmsg);
						_g_id_store.reload();
					}
				});
			});
		}
        
        //计算ID值
		function fnCalc() {
			var record = AOS.selectone(_g_id);
			AOS.ajax({
				wait:false,
				url : 'calcId.jhtml',
				params:{
					name_: record.data.name_
				},
				ok : function(data) {
					AOS.tip(data.appmsg);
					_g_id_store.reload();
				}
			});
		}
		</script>
</aos:onready>
</aos:html>