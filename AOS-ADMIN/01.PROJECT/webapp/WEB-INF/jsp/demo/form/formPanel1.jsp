<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="基本表单2">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport layout="fit">
		<aos:panel layout="column" autoScroll="true" border="false">
			<aos:formpanel id="_f_info" layout="column" labelWidth="80" padding="10 25 0 0" columnWidth="1" >
				<aos:textfield fieldLabel="姓名" name="name_" columnWidth="0.5" allowBlank="false" />
				<aos:numberfield fieldLabel="年龄" name="age_" minWidth="1" maxValue="120" columnWidth="0.5" />
				<aos:textfield fieldLabel="身份证号" name="id_no_" columnWidth="0.5" />
				<aos:textfield fieldLabel="所属银行" name="org_id_" columnWidth="0.5" />
				<aos:numberfield fieldLabel="可用余额" name="balance_" columnWidth="0.5" />
				<aos:numberfield fieldLabel="信用额度" name="credit_line_" columnWidth="0.5" value="100000" readOnly="true" />
				<aos:textareafield fieldLabel="兴趣爱好" name="interests_" columnWidth="1" />
				<aos:htmleditor fieldLabel="备注" name="remark_" columnWidth="1" />
				<aos:docked dock="bottom" ui="footer">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem xtype="button" text="保存数据" icon="ok.png" />
					<aos:dockeditem xtype="button" text="删除" icon="del.png" />
					<aos:dockeditem xtype="tbfill" />
				</aos:docked>
			</aos:formpanel>
		</aos:panel>
	</aos:viewport>
</aos:onready>
</aos:html>