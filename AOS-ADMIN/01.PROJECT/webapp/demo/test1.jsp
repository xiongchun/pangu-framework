<%@ page contentType="text/html; charset=utf-8"%>
<html>
<%
request.setAttribute("test1", "Abc");
request.setAttribute("test2", "{\"router\":\"homeService.initLogin\"} ");
%>

<body>
<form action="http://localhost:10010/aos/http/do.jhtml?router=homeService.initLogin">
    <input name="test1" value="${test1}"  />
    <input name="test2" value="${test2}"  />
    <textarea name="test3" style="display:none;">${test2}</textarea>
</form>
</body>

<script type="text/javascript">
window.onload=function(){
	console.info(document.getElementsByName('test3')[0].value);
	document.forms[0].submit();
}
</script>

</html>