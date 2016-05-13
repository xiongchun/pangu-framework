<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:formpanel id="_f_info" layout="column" labelWidth="70" header="false" icon="user8.png">
	<aos:docked forceBoder="0 0 1 0">
		<aos:dockeditem xtype="tbtext" text="个人信息 [这个表单为复用的页面组件]" />
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
		<aos:dockeditem xtype="button" text="暂存草稿" disabled="true" icon="doc_ok.png" />
		<aos:dockeditem xtype="button" text="保存数据" onclick="fn_save_data" icon="ok.png" />
		<aos:dockeditem xtype="tbfill" />
	</aos:docked>
</aos:formpanel>

<script type="text/javascript">

	//保存数据按钮
	function fn_save_data(){
		AOS.tip('响应保存数据按钮。');
	}
	
	//响应新增卡申请按钮
	//提示：子页面的函数也可以被父页面随意调用。反之亦然。
	function fn_new_card(){
		AOS.tip('响应新增卡申请按钮。');
	}

</script>