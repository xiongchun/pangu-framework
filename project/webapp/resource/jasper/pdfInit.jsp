<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="报表预览">
<G4Studio:body>
</G4Studio:body>
<script language="JavaScript">
window.onload = function(){
    window.location.href = '<%=request.getAttribute("dataUrl")%>';
}
</script>

</G4Studio:html>