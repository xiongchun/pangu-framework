<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="实例①-简单查询" base="http" lib="ext">

<aos:body>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border" id="viewport">
		<aos:formpanel id="_f_query" layout="column" labelWidth="70" header="false" region="north" border="false">
			<aos:docked forceBoder="0 0 1 0">
				<aos:dockeditem xtype="tbtext" text="查询条件" />
			</aos:docked>
			<aos:textfield name="name_" fieldLabel="持卡人姓名" columnWidth="0.25" />
			<aos:combobox name="card_type_" fieldLabel="卡类型" dicField="card_type_" columnWidth="0.25" />
			<aos:textfield name="card_id_" fieldLabel="信用卡号" columnWidth="0.25" />
			<aos:textfield name="id_no_" fieldLabel="身份证号" columnWidth="0.24" />
			<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="查询" onclick="_g_account_query" icon="query.png" />
				<aos:dockeditem xtype="button" text="重置" onclick="AOS.reset(_f_query);" icon="refresh.png" />
				<aos:dockeditem xtype="tbfill" />
			</aos:docked>
		</aos:formpanel>
	</aos:viewport>
	<script type="text/javascript">
	
	    //表格数据模型
		var _g_account_store = Ext.create('Ext.data.Store', {
			fields : [ {
				name : 'id_'
			}, {
				name : 'card_id_'
			}, {
				name : 'card_type_'
			}, {
				name : 'id_no_'
			}, {
				name : 'name_'
			}, {
				name : 'credit_line_'
			}, {
				name : 'balance_'
			}, {
				name : 'sex_'
			}, {
				name : 'birthday_'
			}, {
				name : 'age_'
			}, {
				name : 'create_time_'
			} ],
			pageSize : 50,
			autoLoad : false,
			proxy : {
				type : 'ajax',
				url : 'do.jhtml?router=demoService.listAccounts',
				timeout : 120000,
				actionMethods : {
					read : 'POST'
				},
				reader : {
					type : 'json',
					totalProperty : '_total',
					root : '_rows'
				}
			}
		});

		//表格列模型
		var _g_account_grid_columns = [ {
			width : 30,
			align : 'left',
			xtype : 'rownumberer'
		}, {
			header : '流水号',
			dataIndex : 'id_',
			align : 'left'
		}, {
			header : '卡信息',
			columns : [ {
				header : '信用卡号',
				dataIndex : 'card_id_',
				align : 'left'
			}, {
				width : 60,
				header : '卡类型',
				dataIndex : 'card_type_',
				align : 'left'
			} ]
		}, {
			width : 140,
			header : '身份证号',
			dataIndex : 'id_no_',
			align : 'left'
		}, {
			header : '个人账户信息',
			columns : [ {
				header : '额度信息',
				columns : [ {
					width : 80,
					header : '持卡人',
					dataIndex : 'name_',
					align : 'left'
				}, {
					width : 100,
					header : '信用额度',
					dataIndex : 'credit_line_',
					align : 'right'
				}, {
					width : 100,
					header : '可用余额',
					dataIndex : 'balance_',
					align : 'right'
				} ]
			}, {
				header : '附加信息',
				columns : [ {
					width : 60,
					header : '性别',
					dataIndex : 'sex_'
				}, {
					width : 100,
					header : '出生日期',
					dataIndex : 'birthday_',
					align : 'left'
				}, {
					width : 60,
					header : '年龄',
					dataIndex : 'age_',
					align : 'left'
				} ]
			} ]
		}, {
			width : 160,
			header : '创建时间',
			dataIndex : 'create_time_',
			align : 'left'
		} ];

		//表格基本定义
		var _g_account_cfg = {
			id : '_g_account',
			xtype : 'gridpanel',
			region : 'center',
			width : 200,
			border : false,
			enableColumnHide:false,
			emptyText:'没有查询到符合条件的数据...',
			loader : {},
			forceFit : true,
			store : _g_account_store,
			columns : _g_account_grid_columns,
			viewConfig : {
				enableTextSelection : true,
			},
			dockedItems : [ {
				xtype : 'pagingtoolbar',
				store : _g_account_store,
				dock : 'bottom',
				displayInfo : true
			} ]
		};
		var _g_account = Ext.create('Ext.grid.Panel', _g_account_cfg);
		
		//绑定事件，自动查询
		_g_account.on('render', _g_account_query);

		//工具栏
		var toolbar = Ext.create('Ext.toolbar.Toolbar', {
			id : 'id_toolbar',
			height : 32,
			items : [ {
				id : '_id_cf827ee4',
				xtype : 'tbtext',
				text : '<span class="app-normal">信用卡账户信息</span>'
			} ]
		});
		//控制工具栏上边框线条
		Ext.util.CSS.createStyleSheet(
				'#id_toolbar {border-top-width: 1px !important;}',
				'id_toolbar_top');
		
		//将工具栏加到表格里去
		Ext.getCmp('_g_account').addDocked(toolbar);
		
		//将表格加到布局里去
		Ext.getCmp('viewport').add(_g_account);

		//加载表格数据
		function _g_account_query() {
			var params = AOS.getValue('_f_query');
			_g_account_store.getProxy().extraParams = params;
			_g_account_store.loadPage(1);
		}
		
	</script>
</aos:onready>