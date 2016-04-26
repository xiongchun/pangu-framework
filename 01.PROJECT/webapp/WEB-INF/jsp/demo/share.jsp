<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="页面组件复用">
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
				<aos:button text="新增办卡申请" icon="add2.png" onclick="fn_new_card" scale="medium" margin="10" />
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
			<aos:panel height="160" layout="fit">
			    <%-- 这里引入复用的代码片段 --%>
				<%@ include file="include/shareSub.jsp"%>
			</aos:panel>

			<aos:gridpanel flex="1" id="_g_center" url="listAccounts.jhtml" onrender="_g_center_query" onitemclick="fn_g_center_click">
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
	</aos:viewport>
	<script type="text/javascript">
		//加载center表格数据
		function _g_center_query() {
			_g_center_store.loadPage(1);
		}
		
		//表格单击事件
		function fn_g_center_click(obj, record){
			_f_info.loadRecord(record);
		}
	</script>
</aos:onready>
</aos:html>