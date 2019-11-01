<%@page import="org.springframework.ui.Model"%>
<%@page import="com.fasterxml.jackson.annotation.JsonCreator.Mode"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.*" %>
<!DOCTYPE html>
<html>
<head>
<%
Map<String,Object> aMap = (Map<String,Object>)request.getAttribute("tMap");
List<String> infoList =  (List<String>)aMap.get("정보");
String name = null;
if(aMap!=null){
	 name = aMap.get("이름").toString();
	 out.print("zz");
	if(infoList!=null){
	}
}
else{
}
%>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
function inner(){
var vname = '<%=name%>';
document.getElementById("inner").innerHTML = vname;
}
</script>
</head>
<body>
<div>
<hr>
<table>
<tr>
<td>
<span id="inner"></span>
</td>
</tr>
</table>
</div>
<script>inner()</script>
</body>
</html>