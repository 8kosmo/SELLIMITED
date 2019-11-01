<%@page import="java.util.StringTokenizer"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript">
<%
String T_EndTime = "2019/10/05/21/44/32";

StringTokenizer st = new StringTokenizer(T_EndTime,"/");
String YY = st.nextToken();
String MM = st.nextToken();
String DD = st.nextToken();
String HH = st.nextToken();
String MI = st.nextToken();
String SS = st.nextToken();
%>

function getTime() {
	now = new Date();
	dday = new Date(<%=YY%>,<%=MM%>-1,<%=DD%>,<%=HH%>,<%=MI%>,<%=SS%>,); // 원하는 날짜, 시간 정확하게 초단위까지 기입.
	days = (dday - now) / 1000 / 60 / 60 / 24;
	daysRound = Math.floor(days);
	hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound);
	hoursRound = Math.floor(hours);
	minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound);
	minutesRound = Math.floor(minutes);
	seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
	secondsRound = Math.round(seconds);


	document.getElementById("counter0").innerHTML = daysRound;
	document.getElementById("counter1").innerHTML = hoursRound;
	document.getElementById("counter2").innerHTML = minutesRound;
	document.getElementById("counter3").innerHTML = secondsRound;
	newtime = window.setTimeout("getTime();", 1000);
	}
	</script>

	<style type="text/css">

	/*타임*/
	#count {
	 height: 167px;
	 color: #000;
	 padding-left: 100px;
	 padding-top:130px;
	 background-repeat: no-repeat;
	}
	#bt {
	 height: 16px;
	 width: 49;
	 padding-left: 100px;
	 padding-top: 0px;
	}
	</style>
	</head>
	<body>
	<table cellSpacing=0 cellPadding=0>
	   <tbody>
	      <tr>
	         <td height=167 width=350>
	            <div id=count>
	               <SPAN style="FONT: bold 12px; COLOR: #000" id=counter0></SPAN>일 +
	               <SPAN style="FONT: bold 12px; COLOR: #000" id=counter1></SPAN>시간
	               <SPAN style="FONT: bold 12px;  COLOR: #000" id=counter2></SPAN>분
	               <SPAN style="FONT: bold 12px; COLOR: #000" id=counter3></SPAN>초 남음<br>
	               <SPAN style="padding-left:30px;"></SPAN>
	            </div>
	         </td>
	      </tr>
	   </tbody>
	</table>
	<script>getTime()</script>
	</body>
	</html>