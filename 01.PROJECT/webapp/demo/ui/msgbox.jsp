<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head title="消息对话框">
	<aos:include lib="ext" />
</aos:head>
<aos:body>
</aos:body>
<aos:onready>
	<aos:container width="500" height="200" margin="10" autoShow="true" layout="hbox">
		<aos:button text="提示对话框" onclick="fnmsg1" margin="10" />
		<aos:button text="错误信息框" onclick="fnmsg2" margin="10" />
		<aos:button text="确认对话框" onclick="fnmsg3" margin="10" />
		<aos:button text="等待对话框" onclick="fnmsg4" margin="10" />
		<aos:button text="滑动提示框" onclick="fnmsg5" margin="10" />
	</aos:container>

	<script type="text/javascript">
		function fnmsg1() {
			AOS.info('数据保存成功');
		}

		function fnmsg2() {
			AOS.err('程序出错啦!');
		}

		function fnmsg3() {
			AOS.confirm('真的要放弃保存数据吗？', function(btn) {
				alert(btn);
			});
		}

		function fnmsg4() {
			AOS.wait('正在保存数据，请稍候...');
			AOS.job(function() {
				//请在需要结束等待窗口的地方调用此函数
				AOS.hide();
			}, 3000);
		}

		function fnmsg5() {
			AOS.tip('演示滑动提示框！');
		}
	</script>
</aos:onready>
</aos:html>