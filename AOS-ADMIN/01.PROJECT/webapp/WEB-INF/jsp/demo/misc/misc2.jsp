<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="综合实例①">
	<aos:include lib="ext" />
	<aos:base href="demo/misc" />
	<style>
#_div_tips {
	line-height: 25px;
	margin-right: 10px;
}
</style>
</aos:head>
<aos:body>
	<div id="_div_tips" class="x-hidden">
		<ul>
			<li>申请年龄：18周岁以上；</li>
			<li>负债要求：信用卡透支不超过授信额度的50%；</li>
			<li>限制户籍：暂不接受北京籍人士申请；</li>
			<li>信用要求：近6个月内无信用卡或贷款逾期发生；</li>
			<li>其他要求：暂不接受木材、石材、钢材美容美发行业申请；</li>
		</ul>
	</div>
	<div id="_div_img" class="x-hidden" align="center" style="vertical-align: middle;">
		<img id="_img" style="vertical-align: middle; margin:10px;" />
	</div>
</aos:body>
<aos:onready>
	<aos:viewport layout="border">

		<aos:panel region="west" width="250" bodyBorder="0 1 0 0">
			<aos:layout type="vbox" align="stretch" />
			<aos:docked forceBoder="0 1 1 0">
				<aos:dockeditem xtype="tbtext" text="信用卡办理申请" />
			</aos:docked>
			<aos:panel height="100">
				<aos:layout type="vbox" align="stretch" />
				<aos:button text="新增办卡申请" icon="add2.png" scale="medium" margin="10" onclick="#_w_max.show();" />
				<aos:button text="扫描身份证件及相关材料" icon="webcam.png" scale="medium" disabled="true" margin="0 10 0 10" />
			</aos:panel>
			<aos:panel height="120" layout="fit">
				<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="申请人信息" />
				</aos:docked>
				<aos:formpanel layout="anchor" labelWidth="60" header="false" icon="user8.png">
					<aos:textfield name="name_" fieldLabel="姓名" value="熊嘉靖" readOnly="true" anchor="99%" />
					<aos:textfield name="idno_" fieldLabel="身份证号" value="532928198811170654" readOnly="true" anchor="99%" />
					<aos:datefield name="birthday_" fieldLabel="申请日期" value="2015-03-10" format="Y年m月d日" readOnly="true" anchor="99%" />
				</aos:formpanel>
			</aos:panel>
			<aos:panel flex="1" layout="fit" contentEl="_div_tips" autoScroll="true">
				<aos:docked forceBoder="1 0 1 0">
					<aos:dockeditem xtype="tbtext" text="信用卡办理注意事项" />
				</aos:docked>
			</aos:panel>

		</aos:panel>

		<aos:panel region="center" border="false">
			<%-- 垂直盒子布局，里面可以放置任意多个固定高度或者自适应高度的组件 --%>
			<aos:layout type="vbox" align="stretch" />

			<%-- 这里也可以设置flex属性，不写死高度 --%>
			<aos:panel height="155" layout="fit">
				<aos:formpanel id="_f_info" layout="column" labelWidth="70" header="false" icon="user8.png">
					<aos:docked forceBoder="0 0 1 0">
						<aos:dockeditem xtype="tbtext" text="个人信息" />
					</aos:docked>
					<aos:textfield name="card_id_" fieldLabel="信用卡号" columnWidth="0.33" readOnly="true" />
					<aos:textfield name="id_no_" fieldLabel="身份证号" columnWidth="0.33" readOnly="true" />
					<aos:datefield name="birthday_" fieldLabel="生日" format="Y-m-d" editable="false" columnWidth="0.33" />
					<aos:textfield name="name_" fieldLabel="持卡人" columnWidth="0.33" />
					<aos:numberfield name="credit_line_" fieldLabel="信用额度" columnWidth="0.33" />
					<aos:numberfield name="balance_" fieldLabel="可用余额" columnWidth="0.33" />
					<aos:textfield name="address_" fieldLabel="持卡人住址" columnWidth="0.99" />
					<aos:docked dock="bottom" ui="footer" margin="0 0 10 0">
						<aos:dockeditem xtype="tbfill" />
						<aos:dockeditem xtype="button" text="暂存草稿" icon="doc_ok.png" />
						<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
						<aos:dockeditem xtype="tbfill" />
					</aos:docked>
				</aos:formpanel>
			</aos:panel>

			<aos:gridpanel flex="1" id="_g_center" url="listAccounts.jhtml" onrender="_g_center_query"
				onitemclick="fn_g_center_click">
				<aos:docked forceBoder="1 1 1 0">
					<aos:dockeditem xtype="tbtext" text="信用卡账户信息" />
				</aos:docked>
				<aos:column type="rowno" />
				<aos:column header="流水号" dataIndex="id_" hidden="true" />
				<aos:column header="信用卡号" dataIndex="card_id_" width="90" />
				<aos:column header="卡类型" dataIndex="card_type_" rendererField="card_type_" width="60" />
				<aos:column header="身份证号" dataIndex="id_no_" width="140" />
				<aos:column header="持卡人" dataIndex="name_" width="80" />
				<aos:column header="信用额度" dataIndex="credit_line_" type="number" />
				<aos:column header="可用余额" dataIndex="balance_" type="number" />
				<aos:column header="性别" dataIndex="sex_" rendererField="sex_" width="60" />
				<aos:column header="出生日期" dataIndex="birthday_" type="date" format="Y-m-d" />
				<aos:column header="年龄" dataIndex="age_" width="60" />
				<aos:column header="持卡人住址" dataIndex="address_" width="180" />
			</aos:gridpanel>
		</aos:panel>

		<aos:window id="_w_max" layout="border" maximized="true" title="新增办卡申请" onshow="_w_max_onshow">
			<aos:panel layout="fit" region="west" width="300" title="个人基本信息" collapsible="true">
				<aos:formpanel layout="column" labelWidth="50" border="false">
					<aos:textfield name="name_" fieldLabel="姓名" value="熊嘉靖" readOnly="true" columnWidth="0.5" />
					<aos:textfield name="sex_" fieldLabel="性别" value="男" readOnly="true" columnWidth="0.49" />
					<aos:textfield name="id_no_" fieldLabel="身份证" columnWidth="0.99" readOnly="true" />
					<aos:textfield name="address_" fieldLabel="现住址" readOnly="true" columnWidth="0.99" />
					<aos:textfield name="mobile_phone_" fieldLabel="手机号" readOnly="true" columnWidth="0.99" />
					<aos:textfield name="credit_card_" fieldLabel="信用卡" readOnly="true" columnWidth="0.99" />
					<aos:textareafield name="remark_" fieldLabel="备注" readOnly="true" columnWidth="0.99" />
				</aos:formpanel>
			</aos:panel>
			<aos:panel region="center" bodyBorder="0 0 0 1" layout="border">
				<aos:panel layout="fit" region="north" height="60" title="信用认证信息" bodyBorder="1 0 1 0">
					<aos:formpanel layout="column" labelWidth="70" border="false">
						<aos:textfield name="mobile_phone_" fieldLabel="手机号" allowBlank="false" columnWidth="0.5" />
						<aos:textfield name="credit_card_" fieldLabel="信用卡号" allowBlank="false" columnWidth="0.49" />
					</aos:formpanel>
				</aos:panel>
				<aos:panel layout="fit" region="center" title="信审资料预览" bodyBorder="1 0 1 0" contentEl="_div_img" autoScroll="true">
				</aos:panel>
				<aos:panel layout="fit" region="south" height="100" title="备注信息">
					<aos:formpanel layout="column" labelWidth="60" border="false">
						<aos:textareafield name="remark_" columnWidth="1" />
					</aos:formpanel>
				</aos:panel>
			</aos:panel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem text="保存" icon="ok.png" />
				<aos:dockeditem onclick="#_w_max.hide();" text="关闭" icon="close.png" />
			</aos:docked>
		</aos:window>
	</aos:viewport>
	<script type="text/javascript">
		//加载center表格数据
		function _g_center_query() {
			_g_center_store.loadPage(1);
		}

		//表格单击事件
		function fn_g_center_click(obj, record) {
			_f_info.loadRecord(record);
		}
		
		//监听窗口弹出事件
		function _w_max_onshow(){
			document.getElementById('_img').src = "${cxt}/static/image/demo/wxb.jpg";
		}
	</script>
</aos:onready>
</aos:html>