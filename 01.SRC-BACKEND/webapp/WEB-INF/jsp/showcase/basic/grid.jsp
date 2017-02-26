<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="表格组件" base="http" lib="ext">
<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">
		<aos:tabpanel id="_id_tabs" region="center" tabPosition="bottom" bodyBorder="0 0 0 0" margin="0 0 2 0">

			<aos:tab title="表格基本特性" layout="anchor" border="false" autoScroll="true">

				<aos:gridpanel id="_grid1" url="demoService.listAccounts" onrender="_grid1_query" title="表格1(基本表格、行双击事件、获取当前选中行)" pageSize="5" anchor="100%" height="260" border="true"
					margin="5" onitemdblclick="_grid_click">
					<aos:docked>
						<aos:dockeditem text="获取当前行" onclick="_grid1_cur_row" icon="ok.png" />
						<aos:dockeditem text="刷新" onclick="_grid1_refresh" icon="refresh.png" />
					</aos:docked>
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id_" rendererFn="fn_link_render" fixedWidth="80" />
					<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
					<aos:column header="身份证号" dataIndex="id_no_" width="140" />
					<aos:column header="持卡人" dataIndex="name_" width="80" />
					<aos:column header="信用额度" dataIndex="credit_line_" type="number" width="100" />
					<aos:column header="可用余额" dataIndex="balance_" type="number" width="100" />
					<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
					<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" width="100" />
					<aos:column header="年龄" dataIndex="age_" width="60" />
					<aos:column header="创建时间" dataIndex="create_time_" width="160" />
					<aos:column header="持卡人住址" dataIndex="address_" celltip="true" width="180" />
				</aos:gridpanel>

				<aos:gridpanel id="_grid2" url="demoService.listAccounts" autoLoad="true" title="表格2(复选、按钮、渲染等)" pageSize="10" collapsible="true" anchor="100%" height="350" border="true"
					margin="5">
					<aos:docked>
						<aos:dockeditem text="获取当前选中行" onclick="_grid2_selected" icon="ok.png" />
						<aos:dockeditem text="获取当前选中行2" onclick="_grid2_selected2" icon="ok.png" />
						<aos:dockeditem text="选中行数" onclick="_grid2_rows" icon="ok.png" />
					</aos:docked>
					<aos:column type="rowno" />
					<aos:selmodel type="checkbox" mode="multi" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
					<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
					<aos:column header="身份证号" dataIndex="id_no_" width="140" />
					<aos:column header="持卡人" dataIndex="name_" width="80" />
					<aos:column header="信用额度" dataIndex="credit_line_" type="number" width="100" />
					<aos:column header="可用余额" dataIndex="balance_" rendererFn="fn_balance_render" type="number" width="100" />
					<aos:column header="性别" dataIndex="sex_" rendererFn="fn_sex_render" align="center" fixedWidth="60" />
					<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" width="100" />
					<aos:column header="操作" type="action" fixedWidth="60" align="center">
						<aos:action handler="fn_do" icon="edit.png" tooltip="审批" disabledFn="fn_disabled" />
						<aos:action handler="fn_do" icon="del.png" tooltip="删除" />
					</aos:column>
					<aos:column header="审核" rendererFn="fn_button_render" align="center" width="50" minWidth="50" maxWidth="50" />
					<aos:column header="流程跟踪" rendererFn="fn_button_render2" align="center" width="70" minWidth="70" maxWidth="70" />
					<aos:column header="删除" rendererFn="fn_button_render3" align="center" width="60" minWidth="50" maxWidth="50" />

				</aos:gridpanel>

				<%-- forceFit设置为false，则当数据溢出时将会出现横向滚动条，反之则会自动压缩或拉升达到宽度自适应效果。（注：纵向的滚动条始终都会按需自动出现的。） --%>
				<aos:gridpanel id="_grid3" url="demoService.listAccounts" autoLoad="true" forceFit="false" title="表格3(表格内部横向滚动条、行单击事件)" pageSize="5" anchor="100%" height="240" border="true"
					margin="5" onitemclick="_grid_click">
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id_" />
					<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" />
					<aos:column header="身份证号" dataIndex="id_no_" fixedWidth="200" />
					<aos:column header="持卡人" dataIndex="name_" />
					<%-- type="number" 属性可以进行格式化和数值列自动右对齐 --%>
					<aos:column header="信用额度" dataIndex="credit_line_" type="number" width="120" />
					<aos:column header="可用余额" dataIndex="balance_" rendererFn="fn_bgcolor_render" type="number" width="130" />
					<aos:column header="性别" dataIndex="sex_" rendererField="sex_" />
					<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" fixedWidth="150" />
					<%-- fixedWidth和width的区别为fixedWidth为固定列宽。列的宽度不会随着屏幕的变化而变化。 --%>
					<aos:column header="年龄" dataIndex="age_" fixedWidth="100" />
					<aos:column header="创建时间" dataIndex="create_time_" fixedWidth="150" />
					<aos:column header="持卡人住址" dataIndex="address_" celltip="true" fixedWidth="600" />
				</aos:gridpanel>

				<%-- 列锁定 --%>
				<aos:gridpanel id="_grid4" url="demoService.listAccounts" autoLoad="true" forceFit="false" title="表格4(列锁定)" pageSize="5" anchor="100%" height="235" border="true" margin="5">
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id_" locked="true" />
					<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" locked="true" />
					<aos:column header="持卡人" dataIndex="name_" locked="true" />
					<aos:column header="身份证号" dataIndex="id_no_" fixedWidth="200" />
					<aos:column header="信用额度" dataIndex="credit_line_" type="number" width="120" />
					<aos:column header="可用余额" dataIndex="balance_" type="number" width="130" />
					<aos:column header="性别" dataIndex="sex_" rendererField="sex_" />
					<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" fixedWidth="150" />
					<aos:column header="年龄" dataIndex="age_" fixedWidth="100" />
					<aos:column header="创建时间" dataIndex="create_time_" fixedWidth="150" />
					<aos:column header="持卡人住址" dataIndex="address_" celltip="true" fixedWidth="600" />
				</aos:gridpanel>
			</aos:tab>

			<aos:tab title="可编辑表格" layout="anchor" border="false" autoScroll="true">
				<aos:gridpanel id="_grid5" title="表格5 (行编辑模式)" url="demoService.listAccounts" autoLoad="true" pageSize="20" anchor="100% 50%" border="true" margin="5">
					<aos:docked>
						<aos:dockeditem text="新增一行" icon="add.png" onclick="fn_add_row" />
						<aos:dockeditem text="客户端删除" icon="del.png" onclick="fn_remove_row" />
						<aos:dockeditem xtype="tbfill" />
						<aos:triggerfield emptyText="姓名" id="_name_" trigger1Cls="x-form-search-trigger" width="200" />
					</aos:docked>
					<aos:plugins>
						<%-- clicksToEdit可以控制是单击还是双击进入编辑模式 --%>
						<aos:editing id="id_plugin" clicksToEdit="1" onedit="fn_edit" autoCancel="false" onbeforeedit="fn_beforeedit" />
					</aos:plugins>
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
					<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60">
						<%-- 字典数据源 --%>
						<aos:combobox dicField="card_type_" />
					</aos:column>
					<aos:column header="身份证号" dataIndex="id_no_" fixedWidth="150" />
					<aos:column header="持卡人" dataIndex="name_" width="80">
						<aos:textfield allowBlank="false" />
					</aos:column>
					<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
					<aos:column header="可用余额" dataIndex="balance_" type="number">
						<aos:numberfield allowBlank="false" minValue="0" />
					</aos:column>
					<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60">
						<aos:combobox>
							<%-- 客户端数据源 --%>
							<aos:option value="1" display="男" />
							<aos:option value="2" display="女" />
							<aos:option value="3" display="人妖" />
						</aos:combobox>
					</aos:column>
					<%-- 自定义服务器数据源
					<aos:column header="性别2" dataIndex="sex_" rendererField="sex_" width="60">				
					   <aos:combobox id="cb_sex" url="listComboBoxData.jhtml"  />
					</aos:column>
					--%>
					<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y年m月d日" width="120">
						<aos:datefield format="Y年m月d日" />
					</aos:column>
					<aos:column header="年龄" dataIndex="age_" width="60">
						<aos:numberfield allowBlank="false" maxValue="100" minValue="1" />
					</aos:column>
					<aos:column header="创建时间" dataIndex="create_time_" type="date" format="Y-m-d H:i:s" width="160" />
				</aos:gridpanel>

				<aos:gridpanel id="_grid6" title="表格6 (单元格编辑模式)" url="demoService.listAccounts" autoLoad="true" pageSize="20" anchor="100% 50%" border="true" margin="5">
					<aos:docked>
						<aos:dockeditem text="新增一行" icon="add.png" onclick="fn_add_row2" />
						<aos:dockeditem text="保存数据" icon="save.png" onclick="fn_edit2" />
					</aos:docked>
					<aos:plugins>
						<aos:editing id="id_plugin" ptype="cellediting" clicksToEdit="2" />
					</aos:plugins>
					<aos:column type="rowno" />
					<aos:column header="流水号" dataIndex="id_" hidden="true" />
					<aos:column header="信用卡号" dataIndex="card_id_" width="100" />
					<aos:column header="身份证号" dataIndex="id_no_" fixedWidth="150" />
					<aos:column header="卡类型(可编辑)" dataIndex="card_type_" rendererField="card_type_" width="60">
						<aos:combobox dicField="card_type_">
						    <%-- 可编辑表格的表单项的监听事件只能通过这样的方法来实现监听 --%>
							<aos:on fn="card_type_onselect" event="select" />
						</aos:combobox>
					</aos:column>
					<aos:column header="持卡人(可编辑)" dataIndex="name_" width="80">
						<aos:textfield allowBlank="false" />
					</aos:column>
					<aos:column header="余额(可编辑)" dataIndex="balance_" type="number" fixedWidth="100">
						<aos:numberfield allowBlank="false" maxValue="80000" minValue="0" />
					</aos:column>
					<aos:column header="出生日期(可编辑)" dataIndex="birthday_" type="date" format="Y年m月d日" width="120">
						<aos:datefield format="Y年m月d日" />
					</aos:column>
					<aos:column header="持卡人住址" dataIndex="address_" celltip="true"  width="200"/>
				</aos:gridpanel>

			</aos:tab>
		</aos:tabpanel>
	</aos:viewport>

	<script type="text/javascript">
		//客户端新增记录
		function fn_add_row2() {
			editing = _grid6.getPlugin('id_plugin');
			_grid6_store.insert(0, {
				card_id_:'99999999',
				id_no_:'532925198211170658'
			});
			//在第0行第3列的位置开始编辑
			editing.startEdit(0, 3);
		}
	
	    //监听选择事件
	    function card_type_onselect(me){
	    	AOS.tip('选中值：' + me.getValue());
	    }
	    
		//客户端删除行记录
		function fn_remove_row() {
			//批量辅选删除
			/* 			var records = AOS.select(_grid5);
			 Ext.Array.each(records, function(record) {
			 _g_account_store.remove(record);
			 }); */
			//删除单条
			var record = AOS.selectone(_grid5);
			_grid5_store.remove(record);
			AOS.tip('客户端删除了记录成功。');
		}

		//客户端新增记录
		function fn_add_row() {
			editing = _grid5.getPlugin('id_plugin');
			_grid5_store.insert(0, {
				card_type_ : '1',
				name_ : '小芳',
				create_time_ : new Date(),
			});
			editing.startEdit(0, 2);
		}

		//触发编辑前事件
		function fn_beforeedit(obj, e) {
			var editing = _grid5.getPlugin('id_plugin');
			var rowEditor = editing.getEditor();
			//这行是修复行编辑的一个bug，当数据校验时候如果初始时数据不合法，则数据纠正后保存按钮也不能用的bug。
			rowEditor.on('fieldvaliditychange', rowEditor.onFieldChange,
					rowEditor);
			//form = editing.editor.form;
			//form.findField('sex_').setValue('1');
			//根据当前行的数据控制行编辑器
			/*
			var card_type_ = e.record.data.card_type_;
			if(card_type_ == '2'){
				 AOS.read(form.findField('name_'));
				 AOS.read(form.findField('balance_'));
			}else{
				 AOS.edit(form.findField('name_'));
				 AOS.edit(form.findField('balance_'));
			} */

		}

		//监听行编辑事件
		function fn_edit(editor, e) {
			if (!e.record.dirty) {
				AOS.tip('数据没变化，提交操作取消。');
				return;
			}
			AOS.ajax({
				params : e.record.data,
				url : 'demoService.saveEditGrid',
				ok : function(data) {
					//保存成功后最好是reload表格，以刷新表格行序号
					//_grid5_store.reload();
					AOS.tip(data.appmsg);
					//客户端数据状态提交
					e.record.commit();
				}
			});
		}
		
		//监听单元格编辑事件
		function fn_edit2() {
			if (AOS.mrows(_grid6) === 0) {
				AOS.tip('数据没变化，提交操作取消。');
				return;
			}
			AOS.ajax({
				params : {
					aos_rows_ : AOS.mrs(_grid6)
				},
				url : 'demoService.saveCellEditGrid',
				ok : function(data) {
					AOS.tip(data.appmsg);
					_grid6_store.reload();
				}
			});
		}

		//获取表格选择行的指定字段集合[逗号分隔]
		function _grid2_selected() {
			var selection = AOS.selection(_grid2, 'card_id_');
			if (AOS.empty(selection)) {
				AOS.tip('请先选择表格行。');
				return;
			}
			AOS.tip(selection);
		}

		//获取数据表选择行的所有字段集合[JSON]
		function _grid2_selected2() {
			var selection = AOS.select2json(_grid2);
			if (AOS.empty(selection)) {
				AOS.tip('请先选择表格行。');
				return;
			}
			AOS.tip(selection);
		}

		//已选行数
		function _grid2_rows() {
			AOS.tip('已选行数：' + AOS.rows(_grid2));
		}
		//按钮列转换
		function fn_button_render(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="审核" class="cbtn" onclick="fn_column_button_onclick();" />';
		}

		//按钮列转换
		function fn_button_render2(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="流程跟踪" class="cbtn_warn" onclick="fn_column_button_onclick();" />';
		}

		//按钮列转换
		function fn_button_render3(value, metaData, record, rowIndex, colIndex,
				store) {
			return '<input type="button" value="删除" class="cbtn_danger" onclick="fn_column_button_onclick();" />';
		}

		//处理图标列
		function fn_do(grid, rowIndex, colIndex) {
			var rec = grid.getStore().getAt(rowIndex);
			AOS.tip("可以获取当前行的任意数据传给后台: " + "[卡号：" + rec.get('card_id_') + "]");
		}

		//根据值禁用图标按钮
		function fn_disabled(view, rowIndex, colIndex, item, record) {
			if (record.data.sex_ === '1') {
				return true;
			}
		}

		//加载表格数据
		function _grid1_query() {
			//增加表格查询参数
			//var params = AOS.getValue('_f_query');
			//_grid1_store.getProxy().extraParams = params;
			_grid1_store.loadPage(1);
		}

		//刷新表格数据
		function _grid1_refresh() {
			_grid1_store.reload();
		}

		//加载表格数据  可以动态变更表格加载数据的url（很少用到）
		function _grid1_query2() {
			var params = {
			//name_ : _name_.getValue()
			};
			//这个可以动态指定加载数据的url
			_g_account_store.getProxy().url = 'demoService.listAccounts';
			//这个Store的命名规则为：表格ID+"_store"。
			_g_account_store.getProxy().extraParams = params;
			_g_account_store.loadPage(1);
		}

		//响应单双击事件
		function _grid_click(me, record) {
			AOS.tip("当前行：" + JSON.stringify(record.data));
			//获取某一个字段值
			console.log(record.data.name_);
		}

		//通过API形式获取当前选中行
		function _grid1_cur_row() {
			var record = AOS.selectone(_grid1);
			AOS.tip("当前行：" + JSON.stringify(record.data));
		}

		//超链接列转换开始
		function fn_link_render(value, metaData, record) {
			//可以根据record.data.xx数据来判断是否要加超连接
			return '<a href="javascript:void(0);">' + record.data.card_id_
					+ '</a>';
		}
		_grid1.on("cellclick", function(grid, rowIndex, columnIndex, e) {
			var record = AOS.selectone(_grid1);
			if (columnIndex === 1) {
				AOS.tip("当前行：" + JSON.stringify(record.data));
			}
		});
		//超链接列转换结束

		//单元格的颜色转换
		function fn_balance_render(value, metaData, record) {
			if (value >= 50000) {
				metaData.style = 'color:#CC0000';
			} else {
				metaData.style = 'color:green';
			}
			return value;
		}

		//单元格样式
		function fn_bgcolor_render(value, metaData, record) {
			//metaData.tdAttr = 'data-qtip="'+value+'"';
			if (value >= 45000) {
				//可以对单元格应用任何你想使用的样式信息
				metaData.style = 'background: #FFFFE5;border: 1px solid #F3565D;border-radius: 2px;height:25px;margin-top:1px;';
				return value;
			}
			return value;

		}

		//sex_列转换
		function fn_sex_render(value, metaData, record) {
			if (value === '1') {
				return '<img src="${cxt}/static/icon/user8.png" />';
			} else if (value === '2') {
				return '<img src="${cxt}/static/icon/user1.png" />';
			} else {
				return '未知';
			}
		}
	</script>
</aos:onready>

<script type="text/javascript">
	//提示：按钮的事件响应函数需要写到aos:onready标签之外。
	//表格列按钮单击事件
	function fn_column_button_onclick(obj) {
		var record = AOS.selectone(Ext.getCmp('_grid2'));
		AOS.tip("可以获取当前行的任意数据传给后台: " + "[卡号：" + record.data.card_id_ + "]");
		console.log(record);
		//Ext.getCmp('_g_west').getStore().reload();
	}
</script>