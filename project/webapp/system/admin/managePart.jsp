<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="UI组件托管" uxEnabled="true">
<G4Studio:import src="/system/admin/js/managePart.js"/>
<G4Studio:body>
<G4Studio:div key="menuTreeDiv" />
<G4Studio:ext.codeRender fields="CMPTYPE"/>
<G4Studio:ext.codeStore fields="CMPTYPE"/>

</G4Studio:body>
<G4Studio:script>
   var root_menuname = '<G4Studio:out key="rootMenuName" scope="request"/>';
</G4Studio:script>
</G4Studio:html>