<%@ page contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="部门管理"  >
<G4Studio:import src="/system/admin/js/manageDepartment.js"/>
<G4Studio:ext.codeRender fields="LEAF"/>
<G4Studio:body>
<G4Studio:div key="deptTreeDiv"></G4Studio:div>
</G4Studio:body>
<G4Studio:script>
   var root_deptid = '<G4Studio:out key="rootDeptid" scope="request"/>';
   var root_deptname = '<G4Studio:out key="rootDeptname" scope="request"/>';
   
</G4Studio:script>
</G4Studio:html>