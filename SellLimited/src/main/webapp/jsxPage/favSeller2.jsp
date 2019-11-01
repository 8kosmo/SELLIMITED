<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

</head>
<body>
<div id='favSeller'></div>
<script>
	fetch('http://127.0.0.1:8080/jsxPage/favSeller.json').then(function(response){
			return response.json()
			})
			.then(function(data){
				console.log(data)
			});
</script>		
</body>
</html>