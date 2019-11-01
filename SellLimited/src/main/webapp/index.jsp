<%@page import="java.awt.print.Printable"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> itemStatusList = (List<Map<String,Object>>)request.getAttribute("itemStatusList");
	if(itemStatusList != null){
		out.print(itemStatusList.get(0).get("MEM_ID"));
	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
	function sign() {
		location.href="product/managerPermission.sf?item_code=LOAJ7089&mem_id=uh4ng&auct_period=6";
	}
	function itemStatusList() {
		location.href="product/itemStatusList.sf"
	}
</script>
</head>
<body>

<form action="member/memberIns.sf" method="POST">
	<button>회원가입</button>
</form>

<form action="member/login.sf" method="POST">
	<button>로그인</button>
	<%-- <%= request.getAttribute("mem_name") %> --%>
</form>

<form action="member/memberUpd.sf" method="POST">
	<button>수정</button>
</form>

<form action="member/memberDel.sf" method="get">
	<button>삭제</button>
</form>

<form action="member/memberList.sf?mem_id=test" method="get">
	<button>리스트</button>
</form>


	<button type="button" onclick="sign()">관리자승인</button>
	<a href="product/itemStatusList.sf">리스트호출</a>
</body>
</html>
