<%@ page contentType="text/html; charset=utf-8"%>
<%@ taglib uri="http://www.osworks.cn/tag/aos" prefix="aos"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body id="my01">
</aos:body>
<aos:onready>
	<aos:formpanel id="myform" renderTo="my01" width="600" layout="anchor" labelWidth="60" collapsible="true" title="个人基本信息"
		center="true" bodyBorder="false">
		<aos:docked border="true">
			<aos:dockeditem xtype="button" onclick="fntest1" text="只读" />
			<aos:dockeditem xtype="button" onclick="fntest2" text="取消只读" />
			<aos:dockeditem xtype="button" onclick="fntest3" text="禁用" />
			<aos:dockeditem xtype="button" onclick="fntest4" text="取消禁用" />
			<aos:dockeditem xtype="button" onclick="fntest5" text="隐藏小红星" />
			<aos:dockeditem xtype="button" onclick="fntest6" text="显示小红星" />
			<aos:dockeditem xtype="button" onclick="fntest7" text="批量只读" />
			<aos:dockeditem xtype="button" onclick="fntest8" text="批量取消只读" />
		</aos:docked>
		<aos:textfield id="field1" fieldLabel="姓名" name="name1" value="测试一下" anchor="50%" />
		<aos:textfield fieldLabel="卡号" name="cardno" readOnly="true" value="53001" anchor="50%" />
		<aos:textfield id="field2" fieldLabel="年龄" name="name2" value="年芳18、貌美如花。" allowBlank="false" anchor="50%" />
		<aos:combobox id="field3" name="name3" fieldLabel="自动展开" value="0" allowBlank="false">
			<aos:option value="1" display="是" />
			<aos:option value="0" display="否" />
		</aos:combobox>
		<aos:checkbox name="aa10a7" fieldLabel="是否循环" boxLabel="(号源用尽后自动从最小值开始循环)" checked="false" />
	</aos:formpanel>
	<script type="text/javascript">
		function fntest1() {
			App.read(field1);
		}
		function fntest2() {
			App.edit(field1);
		}
		function fntest3() {
			App.disable(field2);
		}
		function fntest4() {
			App.enable(field2);
		}
		function fntest5() {
			App.unstar(field3);
		}
		function fntest6() {
			App.star(field3);
		}
		function fntest7() {
			App.reads(myform, 'name1,name2,aa10a7');
		}
		function fntest8() {
			App.edits(myform, 'name1,name2,aa10a7');
		}
	</script>
</aos:onready>
</aos:html>