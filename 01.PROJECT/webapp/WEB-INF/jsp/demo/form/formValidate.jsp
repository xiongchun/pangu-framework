<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="表单校验">
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport>
		<aos:panel autoShow="true" center="true" width="600">
			<aos:formpanel id="_form1" width="600" layout="column" labelWidth="80" title="表单校验" bodyBorder="1 0 0 0">
				<aos:docked forceBoder="1 1 0 0">
					<aos:dockeditem icon="bullet_blue.png" onclick="fn6" text="姓名可以为空" />
					<aos:dockeditem icon="bullet_blue.png" onclick="fn5" text="姓名非空" />
				</aos:docked>
				<aos:textfield fieldLabel="身份证1" name="cardno_" allowBlank="false" emptyText="只能输入合法的身份证号" onblur="fn_id" columnWidth="0.5" />
				<aos:textfield fieldLabel="身份证2" name="cardno2_" allowBlank="false" emptyText="只能输入合法的身份证号"  onblur="AOS.idcheck" columnWidth="0.49" />
				<aos:textfield id="_id_name" fieldLabel="姓名" name="name_" allowBlank="false" columnWidth="0.5" />
				<aos:numberfield fieldLabel="年龄" name="age_" maxValue="100" minValue="1" emptyText="只能输入1-100的数字"  columnWidth="0.49" />
				<aos:combobox name="sex_" fieldLabel="性别" columnWidth="0.5">
					<aos:option value="1" display="男" />
					<aos:option value="2" display="女" />
				</aos:combobox>
				<aos:textfield fieldLabel="电子邮件" name="emai_" vtype="email" allowBlank="false" emptyText="只能输入合法的电子邮件"   columnWidth="0.49" />
				<aos:textfield fieldLabel="只输入字母" name="alpha_" vtype="alpha"  emptyText="只能输入字母"  columnWidth="0.5" />
				<aos:textfield fieldLabel="字母+数字" name="number_" vtype="alphanum" emptyText="只能输入英文字母和数字"   columnWidth="0.49" />
				<aos:textfield fieldLabel="URL校验" name="url_" vtype="url" emptyText="只能输入URL地址"  vtypeText="URL格式不合法。自定义校验不通过时的提示信息。"  columnWidth="0.5" />
				<aos:textfield fieldLabel="正则表达式" name="reg_"  regex="/[\u4e00-\u9fa5]/" emptyText="只能输入中文字符" regexText="只能输入中文字符。正则表达式验证不通过的提示信息。"  columnWidth="0.49" />
				<aos:docked dock="bottom" ui="footer" padding="0 0 5 0">
					<aos:dockeditem xtype="tbfill" />
					<aos:dockeditem xtype="button" text="校验" onclick="fn_validate" icon="ok.png" />
					<aos:dockeditem xtype="button" text="重置" onclick="#_form1.form.reset()" icon="refresh.png" />
					<aos:dockeditem xtype="tbfill" />
				</aos:docked>
			</aos:formpanel>
		</aos:panel>

	</aos:viewport>
	<script type="text/javascript">
	   //身份证校验
	   function fn_id(obj_){
		   if(AOS.empty(obj_.getValue())) return;
		   var idinfo = AOS.idinfo(obj_.getValue());
		   if(idinfo.isTrue){
			   AOS.tip(JSON.stringify(idinfo));
			   //还可以从idinfo对象中获取出生年月和性别信息
		   }else{
			   obj_.markInvalid('身份证校验失败，请核对。');
		   }
	   }
	
		//姓名非空
		function fn5() {
			AOS.star(_id_name);
		}

		//姓名可以为空
		function fn6() {
			AOS.unstar(_id_name);
		}
		
		function fn_validate(){
			_form1.isValid();
		}
	</script>
</aos:onready>
</aos:html>