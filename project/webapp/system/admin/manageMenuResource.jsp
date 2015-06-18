<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="菜单资源管理">
<G4Studio:import src="/system/admin/js/manageMenuResource.js"/>
<G4Studio:ext.codeRender fields="MENUTYPE,LEAF,EXPAND"/>
<G4Studio:ext.codeStore fields="EXPAND"/>
<G4Studio:body>
<G4Studio:div key="menuTreeDiv"></G4Studio:div>
</G4Studio:body>
<G4Studio:script>
   var root_menuname = '<G4Studio:out key="rootMenuName" scope="request"/>';
</G4Studio:script>
</G4Studio:html>