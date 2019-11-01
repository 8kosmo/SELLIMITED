<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div>
날짜: <input type="text" id="year" size=5>년
<input type="text" id="month" size=5>월
<input type="text" id="day" size=5>일
시간: <input type="text" id="hour" size=5>시
<input type="text" id="minute" size=5>분까지 남은 시간:
<button type="button" onclick="getTime()">남은 시간 구하기</button>
 
<br />
 
종료시간: 
<span id=counter0></span>일
<span id=counter1></span>시간
<span id=counter2></span>분
<span id=counter3></span>초 남음
 
 
 
<script>
 
function getTime() {
  var year = parseInt(document.getElementById("year").value);
  var month = parseInt(document.getElementById("month").value);
  var day = parseInt(document.getElementById("day").value);
  var hour = parseInt(document.getElementById("hour").value);
  var minute = parseInt(document.getElementById("minute").value);
 
  now = new Date();
  dday = new Date();
  dday.setFullYear(year,month-1,day);
  dday.setHours(hour);
  dday.setMinutes(minute);
  dday.setSeconds(0);
 
  days = (dday - now) / 1000 / 60 / 60 / 24;
  daysRound = Math.floor(days);
  months =
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
</div>
</body>
</html>