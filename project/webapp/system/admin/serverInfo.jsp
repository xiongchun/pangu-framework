<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="获取服务器信息及内存CPU实时监控" fcfEnabled="true">
<G4Studio:import src="/system/admin/js/serverInfo.js" />
<G4Studio:body>
	<G4Studio:flashReport type="L" dataVar="xmlString" id="jvmMemChart" style="margin-top:50px"
		width="680" height="250" align="center" visible="false" />
</G4Studio:body>
<G4Studio:script>
var jsonInfo = <G4Studio:out key="jsonInfo" scope="request" />;
</G4Studio:script>
</G4Studio:html>