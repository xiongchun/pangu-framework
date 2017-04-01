<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>

<aos:html title="常用布局一" base="http" lib="ext">
<aos:body>
	<div id="div_tips" class="x-hidden" style="line-height: 25px; margin-right: 10px;">
		<ul>
			<li>申请年龄：18周岁以上；</li>
			<li>负债要求：信用卡透支不超过授信额度的50%；</li>
			<li>限制户籍：暂不接受北京籍人士申请；</li>
			<li>信用要求：近6个月内无信用卡或贷款逾期发生；</li>
			<li>其他要求：暂不接受木材、石材、钢材美容美发行业申请；</li>
		</ul>
	</div>
	<div id="divimg" class="x-hidden" align="center" style="vertical-align: middle;">
		<img id="img" style="vertical-align: middle; margin: 10px;" />
	</div>
</aos:body>
</aos:html>

<aos:onready>
	<aos:viewport layout="border">

		<aos:panel region="west" width="250" bodyBorder="0 1 0 0">
			<%-- 垂直盒子布局，里面可以放置任意多个固定高度或者自适应高度的组件 --%>
			<aos:layout type="vbox" align="stretch" />
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡申请审批" />
			</aos:docked>
			<%-- 这里也可以设置flex属性，不写死高度 --%>
			<aos:panel height="100">
				<aos:layout type="vbox" align="stretch" />
				<aos:button text="调阅信用卡申请审核信息" icon="add2.png" scale="medium" margin="10" onclick="#w_max.show();" />
				<aos:button text="扫描身份证件及相关材料" icon="webcam.png" scale="medium" disabled="true" margin="0 10 0 10" />
			</aos:panel>
			<aos:panel layout="fit">
				<aos:formpanel layout="anchor" labelWidth="60" header="false">
					<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="申请人信息" />
				</aos:docked>
					<aos:textfield name="name" fieldLabel="姓名" value="熊嘉靖" readOnly="true" anchor="99%" />
					<aos:textfield name="idno" fieldLabel="身份证号" value="532928198811170654" readOnly="true" anchor="99%" />
					<aos:datefield name="birthday" fieldLabel="申请日期" value="2015-03-10" format="Y年m月d日" readOnly="true" anchor="99%" />
				</aos:formpanel>
			</aos:panel>
			<aos:panel flex="1" layout="fit" contentEl="div_tips" autoScroll="true">
				<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="信用卡审批注意事项" />
				</aos:docked>
			</aos:panel>

		</aos:panel>

		<%-- border布局嵌套：对外层boder布局的center区域再应用border布局 --%>
		<aos:panel region="center" border="false" layout="border">
			<aos:panel region="north" >
				<aos:formpanel id="f_query" layout="column" labelWidth="70" header="false">
					<aos:docked forceBoder="0 0 1 0">
						<aos:dockeditem xtype="tbtext" text="查询条件" />
					</aos:docked>
					<aos:textfield name="name" fieldLabel="持卡人姓名" columnWidth="0.25" />
					<aos:combobox name="card_type" fieldLabel="卡类型" dicField="card_type" columnWidth="0.25" />
					<aos:textfield name="card_id" fieldLabel="信用卡号" columnWidth="0.25" />
					<aos:textfield name="id_no" fieldLabel="身份证号" columnWidth="0.24" />
					<aos:docked dock="bottom" ui="footer" margin="0 0 8 0">
						<aos:dockeditem xtype="tbfill" />
						<aos:dockeditem xtype="button" text="查询" onclick="g_account_query" icon="query.png" />
						<aos:dockeditem xtype="button" text="重置" onclick="AOS.reset(f_query);" icon="refresh.png" />
						<aos:dockeditem xtype="tbfill" />
					</aos:docked>
				</aos:formpanel>
			</aos:panel>

			<aos:gridpanel id="g_account" url="demoService.listAccounts" region="center" onrender="g_account_query"
				onitemclick="fng_account_click">
				<aos:docked forceBoder="1 1 1 0">
					<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
				</aos:docked>
				<aos:column type="rowno" />
				<aos:column header="流水号" dataIndex="id" hidden="true" />
				<aos:column header="信用卡号" dataIndex="card_id" width="90" />
				<aos:column header="卡类型" dataIndex="card_type" rendererField="card_type" width="60" />
				<aos:column header="身份证号" dataIndex="id_no" width="140" />
				<aos:column header="持卡人" dataIndex="name" width="80" />
				<aos:column header="信用额度" dataIndex="credit_line" type="number" />
				<aos:column header="可用余额" dataIndex="balance" type="number" />
				<aos:column header="性别" dataIndex="sex" rendererField="sex" width="60" />
				<aos:column header="出生日期" dataIndex="birthday" type="date" format="Y-m-d" />
				<aos:column header="年龄" dataIndex="age" width="60" />
				<aos:column header="持卡人住址" dataIndex="address" width="180" />
			</aos:gridpanel>
			
			<aos:panel region="south" >
				<aos:formpanel id="f_info" layout="column" labelWidth="70" >
					<aos:docked forceBoder="1 0 1 0">
						<aos:dockeditem xtype="tbtext" text="账户信息(演示表格行和表单的数据联动)" />
					</aos:docked>
					<aos:textfield name="card_id" fieldLabel="信用卡号" columnWidth="0.33" readOnly="true" />
					<aos:textfield name="id_no" fieldLabel="身份证号" columnWidth="0.33" readOnly="true" />
					<aos:datefield name="birthday" fieldLabel="生日" format="Y-m-d" readOnly="true" columnWidth="0.33" />
					<aos:textfield name="name" fieldLabel="持卡人" columnWidth="0.33" />
					<aos:numberfield name="credit_line" fieldLabel="信用额度" columnWidth="0.33" />
					<aos:numberfield name="balance" fieldLabel="可用余额" columnWidth="0.33" />
					<aos:textfield name="address" fieldLabel="持卡人住址" columnWidth="0.99" />
				</aos:formpanel>
			</aos:panel>

		</aos:panel>

		<aos:window id="w_max" layout="border" maximized="true" title="信用卡申请审核资料" onshow="w_max_onshow">
			<aos:panel layout="fit" region="west" width="300" title="个人基本信息" collapsible="true">
				<aos:formpanel layout="column" labelWidth="50" border="false">
					<aos:textfield name="name" fieldLabel="姓名" value="熊嘉靖" readOnly="true" columnWidth="0.5" />
					<aos:textfield name="sex" fieldLabel="性别" value="男" readOnly="true" columnWidth="0.49" />
					<aos:textfield name="id_no" fieldLabel="身份证" columnWidth="0.99" readOnly="true" />
					<aos:textfield name="address" fieldLabel="现住址" readOnly="true" columnWidth="0.99" />
					<aos:textfield name="mobile_phone" fieldLabel="手机号" readOnly="true" columnWidth="0.99" />
					<aos:textfield name="credit_card" fieldLabel="信用卡" readOnly="true" columnWidth="0.99" />
					<aos:textareafield name="remark" fieldLabel="备注" readOnly="true" columnWidth="0.99" />
				</aos:formpanel>
			</aos:panel>
			<aos:panel region="center" bodyBorder="0 0 0 1" layout="border">
				<aos:panel layout="fit" region="north" height="60" title="信用认证信息" bodyBorder="1 0 1 0">
					<aos:formpanel layout="column" labelWidth="70" border="false">
						<aos:textfield name="name" fieldLabel="持卡人姓名" readOnly="true" columnWidth="0.25" />
						<aos:combobox name="card_type" fieldLabel="卡类型" readOnly="true" dicField="card_type" columnWidth="0.25" />
						<aos:textfield name="card_id" fieldLabel="信用卡号" readOnly="true" columnWidth="0.25" />
						<aos:textfield name="id_no" fieldLabel="身份证号" readOnly="true" columnWidth="0.24" />
					</aos:formpanel>
				</aos:panel>
				<aos:panel layout="fit" region="center" title="信审资料预览" bodyBorder="1 0 1 0" contentEl="divimg" autoScroll="true">
				</aos:panel>
				<aos:panel layout="fit" region="south" height="100" title="备注信息">
					<aos:formpanel layout="column" labelWidth="60" border="false">
						<aos:textareafield name="remark" readOnly="true" columnWidth="1" />
					</aos:formpanel>
				</aos:panel>
			</aos:panel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem onclick="#w_max.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
	</aos:viewport>

	<script type="text/javascript">
		//加载center表格数据
		function g_account_query() {
			var params = AOS.getValue('f_query');
			g_account_store.getProxy().extraParams = params;
			g_account_store.loadPage(1);
		}

		//表格单击事件
		function fng_account_click(obj, record) {
			f_info.loadRecord(record);
		}
		
		//监听窗口弹出事件
		function w_max_onshow(){
			document.getElementById('img').src = "${cxt}/static/image/demo/wxb.jpg";
		}
	</script>
</aos:onready>