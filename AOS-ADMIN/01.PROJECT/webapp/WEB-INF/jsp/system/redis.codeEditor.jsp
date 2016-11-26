<%@ page contentType="text/html; charset=utf-8"%>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<title>Redis缓存管理页面使用的代码编辑器</title>
<style type="text/css" media="screen">
body {
	overflow: hidden;
}
#editor {
	margin: 0;
	position: absolute;
	top: 0;
	bottom: 0;
	left: 0;
	right: 0;
}
</style>
</head>
<body>
	<pre id="editor"></pre>

	<script src="${pageContext.request.contextPath}/static/weblib/ace/js/ace.js" type="text/javascript" charset="utf-8"></script>
	<script src="${pageContext.request.contextPath}/static/weblib/beautify/beautify.js" type="text/javascript" charset="utf-8"></script>
	<script>
		//初始化代码编辑器
		var editor = ace.edit("editor");
		editor.setTheme("ace/theme/github");
		editor.getSession().setUseWrapMode(true);
		editor.setReadOnly(false);
		document.getElementById('editor').style.fontSize = '16px';
		
		//获取代码编辑器中的文本
		function getValue() {
			return editor.getValue();
		}
		
		//设置代码编辑器中的文本
		function setValue(code) {
			var val;
			try{
				//代码为json
				val = JSON.stringify(JSON.parse(code), null, 4);
				editor.session.setMode("ace/mode/json");
			}catch(e){
				val = code;
				editor.session.setMode("ace/mode/text");
			}
			editor.setValue(val);
		}
	</script>

</body>
</html>