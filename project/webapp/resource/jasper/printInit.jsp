<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="报表预览" urlSecurity2="false">
<G4Studio:body>
	<%-- 为了兼容各种浏览器applet标签的属性被配置2次 --%>
	<APPLET
		CODE="org.g4studio.core.web.report.jasper.applet.EmbeddedViewerApplet.class"
		CODEBASE="<%=request.getContextPath()%>/resource/jasper/applets"
		ARCHIVE="g4studio-report-applet.jar,jasperreports-applet-3.7.0.jar,commons-logging-1.0.4.jar,commons-collections-2.1.1.jar"
		WIDTH="100%" HEIGHT="100%">
		<PARAM NAME=CODE
			VALUE="org.g4studio.core.web.report.jasper.applet.EmbeddedViewerApplet.class">
		<PARAM NAME=CODEBASE
			VALUE="<%=request.getContextPath()%>/resource/jasper/applets">
		<PARAM NAME=ARCHIVE
			VALUE="g4studio-report-applet.jar,jasperreports-applet-3.7.0.jar,commons-logging-1.0.4.jar,commons-collections-2.1.1.jar">
		<PARAM NAME="type" VALUE="application/x-java-applet;version=1.2.2">
		<PARAM NAME="scriptable" VALUE="false">
		<PARAM NAME="REPORT_URL" VALUE="<%=request.getAttribute("dataUrl")%>">
	</APPLET>
</G4Studio:body>
</G4Studio:html>