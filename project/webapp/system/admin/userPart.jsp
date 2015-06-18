<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="UI元素人员授权">
<G4Studio:import src="/system/admin/js/userPart.js"/>
<G4Studio:body>
<G4Studio:div key="deptTreeDiv" />
<G4Studio:ext.codeRender fields="CMPTYPE"/>
<G4Studio:ext.codeStore fields="CMPTYPE"/>
<G4Studio:ext.codeRender fields="PARTAUTHTYPE"/>
<G4Studio:ext.codeStore fields="PARTAUTHTYPE"/>
</G4Studio:body>
<G4Studio:script>
   var root_deptid = '<G4Studio:out key="rootDeptid" scope="request"/>';
   var root_deptname = '<G4Studio:out key="rootDeptname" scope="request"/>';
   var root_menuname = '<G4Studio:out key="rootMenuName" scope="request"/>';
</G4Studio:script>
</G4Studio:html>