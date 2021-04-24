 <%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="${sysTitle}" showLoading="false" exportParams="true"
	isSubPage="false">
<G4Studio:import src="/system/admin/js/login.js" />
<G4Studio:body>
	<div id="hello-win" class="x-hidden">
	<div id="hello-tabs"><img border="0" width="450" height="70"
		src="<%=request.getAttribute("bannerPath") == null ? request.getContextPath()
							+ "/resource/image/login_banner.png" : request.getAttribute("bannerPath")%>" />
	</div>
	</div>
	<div id="aboutDiv" class="x-hidden"
		style='color: black; padding-left: 10px; padding-top: 10px; font-size: 12px'>
	JavaEE行业应用二次快速开发平台 (G4Studio&reg)<br>
	<br>
	项目主页:<a href="http://www.g4it.org" target="_blank">www.g4it.org</a>
	<br>
	<br>
	联系方式:ouraos@qq.com
	</div>
	<div id="infoDiv" class="x-hidden"
		style='color: black; padding-left: 10px; padding-top: 10px; font-size: 12px; line-height:25px'>
	登录帐户[用户名/密码]<br>
	[developer/111111][super/111111]<br>
	[xiongchun_a_3/111111][xiongchun_b_3/111111]<br>
	提示：使用super帐户登录，可体验Web桌面布局。
	
	</div>
</G4Studio:body>
</G4Studio:html>