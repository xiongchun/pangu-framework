<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="组合选择框">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:window title="组合选择框" width="650" layout="fit" autoShow="true" modal="false" center="true" collapsible="true"
			maximizable="true" closable="false" icon="icon152.png">
			<aos:formpanel id="_f_info" layout="column" autoScroll="true">
				<aos:fieldset title="常规下拉选择框" labelWidth="90" columnWidth="1">
					<aos:combobox fieldLabel="客户端数据源" name="bank_" value="1" columnWidth="0.5">
						<aos:option value="1" display="中国嘉靖银行" />
						<aos:option value="2" display="中国招商银行" />
						<aos:option value="3" display="中国农业银行" />
						<aos:option value="4" display="中国建设银行" />
						<aos:option value="5" display="中国工商银行" />
					</aos:combobox>
					<aos:combobox fieldLabel="字典数据源" name="card_type_"  dicField="card_type_" columnWidth="0.49" />
					<aos:combobox fieldLabel="服务器数据源" name="name2" editable="false" columnWidth="0.5" url="listComboBoxData.jhtml" />
					<aos:combobox fieldLabel="可输入" name="card_type_2_" dicField="card_type_" editable="true" columnWidth="0.49" />
					<aos:combobox fieldLabel="下拉项多选" multiSelect="true" name="name2" columnWidth="0.99" url="listComboBoxData.jhtml" />
				</aos:fieldset>
				<aos:fieldset title="多级联动下拉选择框" labelWidth="90" columnWidth="1">
					<aos:combobox onselect="fn_bank1_onselect" fieldLabel="一级节点" name="bank_1_" emptyText="请选择分行..." columnWidth="0.5"
						url="listComboBoxData.jhtml" />
					<aos:combobox id="_bank_2" fieldLabel="二级节点" queryMode="local" name="bank_2_" readOnly="true" emptyText="请选择支行..."
						columnWidth="0.49" url="listComboBoxData2.jhtml" />
				</aos:fieldset>
				<aos:fieldset title="弹窗式选择框" labelWidth="90" columnWidth="1">
					<%-- 隐藏域用来存储弹出树选中节点ID --%>
					<aos:hiddenfield name="parent_id_" />
					<aos:triggerfield fieldLabel="弹出树" name="parent_id_desc" allowBlank="false" editable="false"
						trigger1Cls="x-form-clear-trigger" onTrigger1Click="fn_clear" onfocus="_w_org_find_show"
						trigger2Cls="x-form-search-trigger" onTrigger2Click="_w_org_find_show" columnWidth="0.5" />
					<aos:triggerfield fieldLabel="弹出表格" name="card_id_" editable="true" trigger1Cls="x-form-search-trigger"
						onTrigger1Click="_w_account_find_show" columnWidth="0.49" />
				</aos:fieldset>
				<aos:fieldset title="下拉树选择框" labelWidth="90" columnWidth="1">
					<aos:treepicker fieldLabel="所属分类" name="catalog_id_" allowBlank="false" id="_tp_catalog_id_" emptyText="请选择..."
						rootId="cd14928a239b448b867c2e45246cd038" url="listCatalogs.jhtml" nodeParam="parent_id_" columnWidth="0.5" />
				</aos:fieldset>
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
				<aos:dockeditem xtype="button" text="删除" icon="del.png" />
			</aos:docked>
		</aos:window>

		<aos:window id="_w_org_find" title="上级组织[双击选择]" height="-60" layout="fit" autoScroll="true"
			onshow="_t_org_find_refresh">
			<aos:treepanel id="_t_org_find" singleClick="false" width="320" bodyBorder="0 0 0 0" url="listOrgTree.jhtml"
				nodeParam="parent_id_" rootId="63cf387a243d4d9799367d773b853346" rootText="中国嘉靖银行" rootVisible="true"
				rootIcon="home.png" rootExpanded="false" onitemdblclick="_t_org_find_select" />
		</aos:window>

		<aos:window id="_w_account_find" title="信用卡号[双击选择]" height="-200" width="800" layout="fit" onshow="_g_account_query">
			<aos:gridpanel id="_g_account" url="listAccounts.jhtml" onrender="_g_account_query"
				onitemdblclick="_g_account_dbclick">
				<aos:docked>
					<aos:triggerfield emptyText="姓名" id="_name_" onenterkey="_g_account_query" trigger1Cls="x-form-search-trigger"
						onTrigger1Click="_g_account_query" width="250" />
				</aos:docked>
				<aos:column type="rowno" />
				<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
				<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
				<aos:column header="持卡人" dataIndex="name_" width="80" />
				<aos:column header="身份证号" dataIndex="id_no_" width="140" />
				<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
				<aos:column header="可用余额" dataIndex="balance_" type="number" />
			</aos:gridpanel>
		</aos:window>
	</aos:viewport>
	<script type="text/javascript">
		//一级节点选择事件监听函数
		function fn_bank1_onselect(me, records) {
			var parent_id_ = me.getValue();
			_bank_2_store.getProxy().extraParams = {
				parent_id_ : parent_id_
			};
			_bank_2_store.load({
				callback : function(records, operation, success) {
					if (records.length > 0) {
						AOS.edit(_bank_2);
					} else {
						AOS.tip('选中的分行下无二级支行节点');
						AOS.read(_bank_2);
					}
				}
			});
		}

		//========================弹窗式旋转框(弹出树)=================>>
		//弹出选择上级组织窗口
		function _w_org_find_show() {
			_w_org_find.show();
		}
		//上级组织树节点双击事件
		function _t_org_find_select() {
			var record = AOS.selectone(_t_org_find);
			_f_org.down('[name=parent_id_]').setValue(record.raw.id);
			_f_org.down('[name=parent_id__desc]').setValue(record.raw.text);
			_w_org_find.hide();
		}
		//刷新上级组织树
		function _t_org_find_refresh() {
			var refreshnode = _t_org_find.getRootNode();
			_t_org_find_store.load({
				callback : function() {
					//收缩再展开才能在刷新时正确显示expanded=true的节点的子节点
					refreshnode.collapse();
					refreshnode.expand();
				}
			});
		}
		//上级组织树节点双击事件
		function _t_org_find_select() {
			var record = AOS.selectone(_t_org_find);
			_f_info.down('[name=parent_id_]').setValue(record.raw.id);
			_f_info.down('[name=parent_id_desc]').setValue(record.raw.text);
			_w_org_find.hide();
		}
		//清出选中
		function fn_clear() {
			_f_info.down('[name=parent_id_]').reset();
			_f_info.down('[name=parent_id_desc]').reset();
		}
		//<<====================================================

		//========================弹窗式旋转框(弹出表格)=================>>
		//弹出选择卡号窗口
		function _w_account_find_show() {
			_w_account_find.show();
		}
		//加载表格数据
		function _g_account_query() {
			var params = {
				name_ : _name_.getValue()
			};
			//这个Store的命名规则为：表格ID+"_store"。
			_g_account_store.getProxy().extraParams = params;
			_g_account_store.load();
		}
		//账户表格双击事件
		function _g_account_dbclick(obj, record) {
			_f_info.down('[name=card_id_]').setValue(record.raw.card_id_);
			_w_account_find.hide();
		}
		//<<=====================================================
		
		//========================下拉树选择框=====================>>
		//设置下拉树初始值
		function fn_set_treepicker_value() {
			//不能想combo一样自动转换，即便是在load后，所以强行设置文本框显示值
			//提示：一定要先setValue()再setRawValue()，否则setValue如果下拉项没被渲染的话会被覆盖
			treepicker.setValue('0'); //选择器表单提交值
			treepicker.setRawValue('文本框显示值');
		}
		//<<=====================================================
	</script>
</aos:onready>
</aos:html>