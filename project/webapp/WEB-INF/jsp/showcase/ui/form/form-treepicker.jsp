<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="/showcase/tag/" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="下拉树选择器" autoShow="true" width="600" layout="fit" maximizable="true">
		<aos:formpanel id="myform" layout="column" labelWidth="100" center="true">
			<aos:treepicker id="treepicker" fieldLabel="下拉树选择器" name="name1" allowBlank="false" url="listTreeNodes.jhtml"
				nodeParam="az02a3" onselect="fnselect" columnWidth="0.6" />
		</aos:formpanel>
		<aos:docked dock="bottom">
			<aos:dockeditem xtype="tbfill" />
			<aos:dockeditem text="设置初始值" onclick="fntest1" />
			<aos:dockeditem text="查看表单提交值" onclick="fntest2" />
		</aos:docked>
	</aos:window>
	<script type="text/javascript">
		function fnselect(cmp, record) {
			App.info(record.raw.text);
		}

		//设置初始值
		function fntest1() {
			//不能想combo一样自动转换，即便是在load后，所以强行设置文本框显示值
			//提示：一定要先setValue()再setRawValue()，否则setValue如果下拉项没被渲染的话会被覆盖
			treepicker.setValue('0'); //选择器表单提交值
			treepicker.setRawValue('文本框显示值');

			//_f_module.down('[name=aa11a5]').setValue(record.raw.id); 
			//_f_module.down('[name=aa11a5]').setRawValue(record.raw.text);
		}

		function fntest2() {
			console.log(myform.getValues());
			App.info('请看浏览器控制台');
		}
	</script>
</aos:onready>
</aos:html>