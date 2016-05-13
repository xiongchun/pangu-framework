<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/WEB-INF/jsp/common/tags.jsp"%>
<aos:html>
<aos:head>
	<aos:include lib="ext" />
	<aos:base href="demo" />
</aos:head>
<aos:body backGround="true">
</aos:body>
<aos:onready>
	<aos:viewport layout="hbox" margin="30">
			<aos:button text="新增" icon="add.png" onclick="fn_add" />
			<aos:button text="修改" icon="edit.png" onclick="!fn_handler" margin="0 0 0 20" />
			<aos:button text="删除" icon="del.png" onclick="#AOS.tip('你点击了删除按钮。')" margin="0 0 0 20" />
			<aos:button text="查看" icon="query.png" disabled="true" tooltip="按钮已禁用" margin="0 0 0 20" />
			<aos:button text="操作" iconVec="fa-wrench" margin="0 0 0 20" />
			<aos:button text="新增" icon="add2.png" scale="medium" onclick="fn_add" margin="0 0 0 20" />
			<aos:button text="修改" icon="edit2.png" iconAlign="top"  margin="0 0 0 20" />
			<aos:button text="删除全部" icon="del2.png" iconAlign="bottom" onclick="#AOS.tip('你点击了我。')" margin="0 0 0 20" />
			<aos:button text="执行" icon="go.gif" scale="medium" margin="0 0 0 20">
				<aos:menu plain="true">
					<aos:menuitem text="下拉菜单①" icon="icq.png" />
					<aos:menuitem text="下拉菜单②" icon="ok.png" />
					<aos:menuitem xtype="menuseparator" />
					<aos:menuitem text="下拉菜单③" icon="ok3.png">
						<aos:menuitem text="嵌套菜单①" icon="webcam.png" />
						<aos:menuitem text="嵌套菜单②" icon="send_receive.png" />
					</aos:menuitem>
				</aos:menu>
			</aos:button>
	</aos:viewport>
	<script type="text/javascript">
		//响应新增按钮单击事件
		function fn_add(){
			AOS.tip('你点击了新增按钮。');
		}
		
	    //响应按钮单击事件
		function fn_handler(obj){
			AOS.tip('你点击了：' + obj.text + '。');
		}
	    
	</script>
</aos:onready>
</aos:html>