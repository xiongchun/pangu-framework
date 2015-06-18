<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="FlashReport综合实例(动态数据源|动态图表类型)" fcfEnabled="true">
<G4Studio:import src="/demo/flashReport/js/integrateFlashReport1.js" />
<G4Studio:body>
	<G4Studio:flashReport type="2DC" dataVar="xmlString" id="my2DcChart" align="center" style="margin-top:50px"
		visible="false" />
</G4Studio:body>
</G4Studio:html>