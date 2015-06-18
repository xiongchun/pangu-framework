<%@ page language="java" contentType="text/html; charset=utf-8"%>
<%@ include file="/common/include/taglib.jsp"%>
<G4Studio:html title="表单同步提交后跳转的页面" >
<G4Studio:body>
页面一提交的值为：<br>
<%=request.getAttribute("value") %>
</G4Studio:body>
</G4Studio:html>