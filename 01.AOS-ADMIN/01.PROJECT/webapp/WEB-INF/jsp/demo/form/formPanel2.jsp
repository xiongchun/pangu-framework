<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="基本表单3">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:window title="表单布局" width="850" layout="fit" autoShow="true" modal="false" center="true" maximizable="true"
			closable="false">
			<aos:docked>
				<aos:dockeditem xtype="tbtext" text="工具栏" />
				<aos:dockeditem xtype="tbseparator" />
				<aos:dockeditem text="复制" icon="copy.png" />
				<aos:dockeditem text="剪切" icon="cut.png" />
				<aos:dockeditem text="粘贴" icon="paste.png" />
			</aos:docked>
			<aos:formpanel id="_f_info" layout="column" autoScroll="true" labelWidth="70">
				<aos:fieldset title="请查询" columnWidth="1">
					<aos:textfield fieldLabel="卡号" name="card" allowBlank="false" columnWidth="0.4" />
					<aos:button text="查询" margin="0 0 0 10" icon="query.png" />
				</aos:fieldset>
				<aos:fieldset title="持卡人信息" columnWidth="1" checkboxToggle="true" collapsed="false">
					<aos:textfield fieldLabel="姓名" name="name" columnWidth="0.5" />
					<aos:textfield fieldLabel="身份证号" name="name" columnWidth="0.49" />
					<aos:textfield fieldLabel="现住址" name="name" columnWidth="0.5" />
					<aos:textfield fieldLabel="户口地" name="name" columnWidth="0.49" />
				</aos:fieldset>
				<aos:fieldset title="发卡行信息(复杂表单布局)" columnWidth="1">
					<aos:textfield fieldLabel="支行名称" name="bankName" columnWidth="0.99" />
					<aos:rowset2>
						<aos:numberfield fieldLabel="上班时间" name="satrt1" value="8" columnWidth="0.2" />
						<aos:displayfield value="点" columnWidth="0.02" />
						<aos:numberfield name="name1" value="30" columnWidth="0.1" />
						<aos:displayfield value="分 (强制换行)" columnWidth="0.3" />
					</aos:rowset2>
					<aos:textfield fieldLabel="邮编" name="bankName" columnWidth="0.4" />
					<aos:textfield fieldLabel="地址" name="bankName" columnWidth="0.59" />
				</aos:fieldset>
			</aos:formpanel>
			<aos:docked dock="bottom" ui="footer">
				<aos:dockeditem xtype="tbfill" />
				<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
				<aos:dockeditem xtype="button" text="删除" icon="del.png" />
			</aos:docked>
		</aos:window>
	</aos:viewport>
</aos:onready>
</aos:html>