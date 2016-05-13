<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:window title="TriggerFiled演示" autoShow="true" width="400" layout="fit" maximizable="true" center="true">
		<aos:formpanel labelWidth="80" center="true" layout="anchor" height="200">
			<aos:triggerfield fieldLabel="机构名称" name="name1" maxLength="10" trigger1Cls="x-form-clear-trigger"
				trigger2Cls="x-form-search-trigger" onTrigger1Click="fnclear" onTrigger2Click="fntest1" />
			<aos:triggerfield fieldLabel="机构名称" name="name2" trigger1Cls="x-form-clear-trigger"
				trigger2Cls="x-form-search1-trigger" onTrigger1Click="fnclear" onTrigger2Click="fntest1" />
			<aos:triggerfield fieldLabel="机构名称" name="name3" trigger1Cls="x-form-search-trigger" onTrigger1Click="fntest1"
				trigger2Cls="x-form-clear1-trigger" />
			<aos:triggerfield fieldLabel="自定义图标" name="name3" trigger1Cls="x-form-clear2-trigger" trigger2Cls="x-form-add-trigger"
				trigger3Cls="x-form-search1-trigger" />
		</aos:formpanel>
	</aos:window>
	<script type="text/javascript">
		function fnclear() {
			this.setValue('');
			this.focus();
			AOS.tip('输入框内容被成功清除');
		}

		function fntest1() {
			AOS.tip('你单击了我哦');
		}
	</script>
</aos:onready>
</aos:html>