<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="${sysTitle}" showLoading="false" exportParams="true"
	isSubPage="false" exportExceptionWindow="true" exportUserinfo="true">
<G4Studio:import src="/resource/commonjs/extTabCloseMenu.js" />
<G4Studio:import src="/system/admin/js/index.js" />
<G4Studio:ext.codeStore fields="SEX" />
<G4Studio:body>
	<G4Studio:arm.Viewport northTitle="${sysTitle}" westTitle="${westTitle}" />
	
</G4Studio:body>
</G4Studio:html>