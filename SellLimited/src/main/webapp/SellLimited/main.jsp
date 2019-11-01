<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>메인뷰</title>
	<style>
	.carousel-inner img {
	    width: 100%;
	    height: 100%;
	}
	</style>
 	<script type="text/javascript">
 		function loginAction(){
 	    	var mem_id = $("#mem_id").val();
 	    	var mem_pw = $("#mem_pw").val();
 	    	$.ajax({
 	    		url : ""
 	    		,method : "get"
 	    		,success : function(data) {
 	    			$("#logoutForm").show();
 	    			$("#loginForm").hide();
 	    		}
 	    		,error : function(e){
 	    			alert(e.responseText);
 	    		}
 	    	});
 		}
 	    function logoutAction(){
 	    	$("#logoutForm").hide();
 			$("#loginForm").show();
 		}
 	    //서브 카테고리 보이기
 	    function submenuview(i){
 	    	$('#_main_gslist'+i).show();
 	    	$('#demo').hide();
 	    }
 	    //서브 카테고리 숨기기
 	    function submenuhide(i){
 	    	$('#_main_gslist'+i).hide();
 	    	$('#demo').show();
 	    }
	</script>
</head>
<body>
	<script>
		$(document).ready(function() {
			$("#logoutForm").hide();
			$("#_main_gslist1").hide();
			$("#_main_gslist2").hide();
			$("#_main_gslist3").hide();
			$("#_main_gslist4").hide();
			$("#_main_gslist5").hide();
			$("#_main_gslist6").hide();
			$("#_main_gslist7").hide();
		});
	</script>

	<div class="container" id="loginForm">
		<div class="row">
			<div class="col">
				<nav class="navbar navbar-expand-sm navbar-light">
					 <ul class="navbar-nav">
					 	<li class="nav-item">
					 		<p></p>
					 	</li>
					 </ul>
				</nav>
			</div>
			<div class="col">
				<nav class="navbar navbar-expand-sm navbar-light justify-content-end">
				  	<ul class="navbar-nav">
				    	<li class="nav-item active">
				      		<a class="nav-link" href="signUp_1.jsp">회원가입</a>
				    	</li>
				    	<li class="nav-item">
				      		<a class="nav-link" data-toggle="modal" data-target="#login">로그인</a>
				    	</li>
				    	<li class="nav-item">
				      		<a class="nav-link" href="#">이용안내</a>
				    	</li>
				  	</ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="container" id="logoutForm">
		<div class="row">
			<div class="col">
				<nav class="navbar navbar-expand-sm navbar-light">
					 <ul class="navbar-nav">
					 	<li class="nav-item">
					 		<p>OOO 님 환영합니다.  보유캐쉬 OOOP입니다.</p>
					 	</li>
					 </ul>
				</nav>
			</div>
			<div class="col">
				<nav class="navbar navbar-expand-sm navbar-light justify-content-end">
				  <ul class="navbar-nav">
				    <li class="nav-item active">
				      <a class="nav-link" href="myPage.jsp">마이페이지</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" onclick="logoutAction()">로그아웃</a>
				    </li>
				    <li class="nav-item">
				      <a class="nav-link" href="#">이용안내</a>
				    </li>
				  </ul>
				</nav>
			</div>
		</div>
	</div>
	<div class="container" style="margin-top: 10px;align:right">
		<div class="row">
			<div class="col-sm-3" style="align-self: center;">
				<img src="../images/index.gif" class="rounded" width="214" height="80">
			</div>
			<div class="col-sm-6" style="align-self: center;">
				<form>
					<div class="input-group">
						<input type="text" id=""class="form-control" placeholder="Search here">
						<div class="input-group-append">
							<button class="btn btn-success" type="submit">검색</button> 
						</div>
					</div>
				</form>			
			</div>
			<div class="col-sm-3" style="align-self: center;">
				<input type="text" placeholder="실시간 검색기능">
			</div>
		</div>
	</div>
	<!-- modal(#signUp) -->
	
	<!-- /modal(#signUp) -->
	<!-- modal(#login) -->
	<div class="modal fade" id="login">
    <div class="modal-dialog">
    <div class="modal-content">      
        <!-- modal header -->
        <div class="modal-header">
          <h4 class="modal-title">로그인 화면</h4>
          <button type="button" class="close" data-dismiss="modal">x</button>
        </div>
        <!-- modal body -->
        <div class="modal-body">
        	<form action="">
        		<div class="from-group">
	        		<label for="id">ID</label>
	        		<input type="text" class="form-control" id="mem_id" name="mem_id">
        		</div>
        		<div class="from-group">
	        		<label for="pw">Password</label>
	        		<input type="text" class="form-control" id="mem_pw" name="mem_pw">
        		</div>
        	</form>
        </div>
        <!-- modal footer -->
        <div class="modal-footer">
          <button type="button" class="btn btn-primary" onclick="loginAction()" data-dismiss="modal">로그인</button>
          <button type="button" class="btn btn-danger" data-dismiss="modal">취소</button>
        </div>
	</div>
    </div>
	</div>
	<!-- /modal(#login) -->
	<div class="container" style="margin-top: 10px">
	<!-- category -->
		<div class="row">
			<div class="col-sm-2">
				<table class="table table-borderless">
					<tr><th onmouseover="submenuview(1)" onmouseout="submenuhide(1)">카메라</th></tr>
					<tr><th onmouseover="submenuview(2)" onmouseout="submenuhide(2)">악기</th></tr>
					<tr><th onmouseover="submenuview(3)" onmouseout="submenuhide(3)">키덜트</th></tr>
					<tr><th onmouseover="submenuview(4)" onmouseout="submenuhide(4)">연예인 굿즈</th></tr>
					<tr><th onmouseover="submenuview(5)" onmouseout="submenuhide(5)">골동품</th></tr>
					<tr><th onmouseover="submenuview(6)" onmouseout="submenuhide(6)">게임</th></tr>
					<tr><th onmouseover="submenuview(7)" onmouseout="submenuhide(7)">음반</th></tr>
				</table>
			</div>
	<!-- /category -->
			<div class="col-sm-10">
				<div class="main_cate" id="_main_gslist1" onmouseover="submenuview(1)" onmouseout="submenuhide(1)">
					<table class="table table-borderless">
						<tr>
							<th><a href="#" style="color:coral">DSLR</a></th>
							<th><a href="#" style="color:coral">자동카메라</a></th>
							<th><a href="#" style="color:coral">수동카메라</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">바이올린</a></th>
							<th><a href="#" style="color:black">베이스기타</a></th>
							<th><a href="#" style="color:black">일랙트로닉기타</a></th>
							<th><a href="#" style="color:black">피아노</a></th>
							<th><a href="#" style="color:black">etc</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">RC/무선조종</a></th>
							<th><a href="#" style="color:black">피규어</a></th>
							<th><a href="#" style="color:black">건담</a></th>
							<th><a href="#" style="color:black">모형/프라모델</a></th>
							<th><a href="#" style="color:black">게임퍼즐</a></th>
							<th><a href="#" style="color:black">서바이벌</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">잡화</a></th>
							<th><a href="#" style="color:black">악세서리</a></th>
							<th><a href="#" style="color:black">티셔츠</a></th>
							<th><a href="#" style="color:black">브로마이드</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">장식품</a></th>
							<th><a href="#" style="color:black">종교물품</a></th>
							<th><a href="#" style="color:black">문화제</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">게임기</a></th>
							<th><a href="#" style="color:black">게임CD/팩</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">CD관련</a></th>
							<th><a href="#" style="color:black">LP관련</a></th>
						</tr>
					</table>
				</div>
				<div class="main_cate" id="_main_gslist2" onmouseover="submenuview(2)" onmouseout="submenuhide(2)">
					<table class="table table-borderless">
						<tr>
							<th><a href="#" style="color:black">DSLR</a></th>
							<th><a href="#" style="color:black">자동카메라</a></th>
							<th><a href="#" style="color:black">수동카메라</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:coral">바이올린</a></th>
							<th><a href="#" style="color:coral">베이스기타</a></th>
							<th><a href="#" style="color:coral">일랙트로닉기타</a></th>
							<th><a href="#" style="color:coral">피아노</a></th>
							<th><a href="#" style="color:coral">etc</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">RC/무선조종</a></th>
							<th><a href="#" style="color:black">피규어</a></th>
							<th><a href="#" style="color:black">건담</a></th>
							<th><a href="#" style="color:black">모형/프라모델</a></th>
							<th><a href="#" style="color:black">게임퍼즐</a></th>
							<th><a href="#" style="color:black">서바이벌</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">잡화</a></th>
							<th><a href="#" style="color:black">악세서리</a></th>
							<th><a href="#" style="color:black">티셔츠</a></th>
							<th><a href="#" style="color:black">브로마이드</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">장식품</a></th>
							<th><a href="#" style="color:black">종교물품</a></th>
							<th><a href="#" style="color:black">문화제</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">게임기</a></th>
							<th><a href="#" style="color:black">게임CD/팩</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">CD관련</a></th>
							<th><a href="#" style="color:black">LP관련</a></th>
						</tr>
					</table>
				</div>
				<div class="main_cate" id="_main_gslist3" onmouseover="submenuview(3)" onmouseout="submenuhide(3)">
					<table class="table table-borderless">
						<tr>
							<th><a href="#" style="color:black">DSLR</a></th>
							<th><a href="#" style="color:black">자동카메라</a></th>
							<th><a href="#" style="color:black">수동카메라</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">바이올린</a></th>
							<th><a href="#" style="color:black">베이스기타</a></th>
							<th><a href="#" style="color:black">일랙트로닉기타</a></th>
							<th><a href="#" style="color:black">피아노</a></th>
							<th><a href="#" style="color:black">etc</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:coral">RC/무선조종</a></th>
							<th><a href="#" style="color:coral">피규어</a></th>
							<th><a href="#" style="color:coral">건담</a></th>
							<th><a href="#" style="color:coral">모형/프라모델</a></th>
							<th><a href="#" style="color:coral">게임퍼즐</a></th>
							<th><a href="#" style="color:coral">서바이벌</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">잡화</a></th>
							<th><a href="#" style="color:black">악세서리</a></th>
							<th><a href="#" style="color:black">티셔츠</a></th>
							<th><a href="#" style="color:black">브로마이드</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">장식품</a></th>
							<th><a href="#" style="color:black">종교물품</a></th>
							<th><a href="#" style="color:black">문화제</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">게임기</a></th>
							<th><a href="#" style="color:black">게임CD/팩</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">CD관련</a></th>
							<th><a href="#" style="color:black">LP관련</a></th>
						</tr>
					</table>
				</div>
				<div class="main_cate" id="_main_gslist4" onmouseover="submenuview(4)" onmouseout="submenuhide(4)">
					<table class="table table-borderless">
						<tr>
							<th><a href="#" style="color:black">DSLR</a></th>
							<th><a href="#" style="color:black">자동카메라</a></th>
							<th><a href="#" style="color:black">수동카메라</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">바이올린</a></th>
							<th><a href="#" style="color:black">베이스기타</a></th>
							<th><a href="#" style="color:black">일랙트로닉기타</a></th>
							<th><a href="#" style="color:black">피아노</a></th>
							<th><a href="#" style="color:black">etc</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">RC/무선조종</a></th>
							<th><a href="#" style="color:black">피규어</a></th>
							<th><a href="#" style="color:black">건담</a></th>
							<th><a href="#" style="color:black">모형/프라모델</a></th>
							<th><a href="#" style="color:black">게임퍼즐</a></th>
							<th><a href="#" style="color:black">서바이벌</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:coral">잡화</a></th>
							<th><a href="#" style="color:coral">악세서리</a></th>
							<th><a href="#" style="color:coral">티셔츠</a></th>
							<th><a href="#" style="color:coral">브로마이드</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">장식품</a></th>
							<th><a href="#" style="color:black">종교물품</a></th>
							<th><a href="#" style="color:black">문화제</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">게임기</a></th>
							<th><a href="#" style="color:black">게임CD/팩</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">CD관련</a></th>
							<th><a href="#" style="color:black">LP관련</a></th>
						</tr>
					</table>
				</div>
				<div class="main_cate" id="_main_gslist5" onmouseover="submenuview(5)" onmouseout="submenuhide(5)">
					<table class="table table-borderless">
						<tr>
							<th><a href="#" style="color:black">DSLR</a></th>
							<th><a href="#" style="color:black">자동카메라</a></th>
							<th><a href="#" style="color:black">수동카메라</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">바이올린</a></th>
							<th><a href="#" style="color:black">베이스기타</a></th>
							<th><a href="#" style="color:black">일랙트로닉기타</a></th>
							<th><a href="#" style="color:black">피아노</a></th>
							<th><a href="#" style="color:black">etc</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">RC/무선조종</a></th>
							<th><a href="#" style="color:black">피규어</a></th>
							<th><a href="#" style="color:black">건담</a></th>
							<th><a href="#" style="color:black">모형/프라모델</a></th>
							<th><a href="#" style="color:black">게임퍼즐</a></th>
							<th><a href="#" style="color:black">서바이벌</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">잡화</a></th>
							<th><a href="#" style="color:black">악세서리</a></th>
							<th><a href="#" style="color:black">티셔츠</a></th>
							<th><a href="#" style="color:black">브로마이드</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:coral">장식품</a></th>
							<th><a href="#" style="color:coral">종교물품</a></th>
							<th><a href="#" style="color:coral">문화제</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">게임기</a></th>
							<th><a href="#" style="color:black">게임CD/팩</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">CD관련</a></th>
							<th><a href="#" style="color:black">LP관련</a></th>
						</tr>
					</table>
				</div>
				<div class="main_cate" id="_main_gslist6" onmouseover="submenuview(6)" onmouseout="submenuhide(6)">
					<table class="table table-borderless">
						<tr>
							<th><a href="#" style="color:black">DSLR</a></th>
							<th><a href="#" style="color:black">자동카메라</a></th>
							<th><a href="#" style="color:black">수동카메라</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">바이올린</a></th>
							<th><a href="#" style="color:black">베이스기타</a></th>
							<th><a href="#" style="color:black">일랙트로닉기타</a></th>
							<th><a href="#" style="color:black">피아노</a></th>
							<th><a href="#" style="color:black">etc</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">RC/무선조종</a></th>
							<th><a href="#" style="color:black">피규어</a></th>
							<th><a href="#" style="color:black">건담</a></th>
							<th><a href="#" style="color:black">모형/프라모델</a></th>
							<th><a href="#" style="color:black">게임퍼즐</a></th>
							<th><a href="#" style="color:black">서바이벌</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">잡화</a></th>
							<th><a href="#" style="color:black">악세서리</a></th>
							<th><a href="#" style="color:black">티셔츠</a></th>
							<th><a href="#" style="color:black">브로마이드</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">장식품</a></th>
							<th><a href="#" style="color:black">종교물품</a></th>
							<th><a href="#" style="color:black">문화제</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:coral">게임기</a></th>
							<th><a href="#" style="color:coral">게임CD/팩</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">CD관련</a></th>
							<th><a href="#" style="color:black">LP관련</a></th>
						</tr>
					</table>
				</div>
				<div class="main_cate" id="_main_gslist7" onmouseover="submenuview(7)" onmouseout="submenuhide(7)">
					<table class="table table-borderless">
						<tr>
							<th><a href="#" style="color:black">DSLR</a></th>
							<th><a href="#" style="color:black">자동카메라</a></th>
							<th><a href="#" style="color:black">수동카메라</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">바이올린</a></th>
							<th><a href="#" style="color:black">베이스기타</a></th>
							<th><a href="#" style="color:black">일랙트로닉기타</a></th>
							<th><a href="#" style="color:black">피아노</a></th>
							<th><a href="#" style="color:black">etc</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">RC/무선조종</a></th>
							<th><a href="#" style="color:black">피규어</a></th>
							<th><a href="#" style="color:black">건담</a></th>
							<th><a href="#" style="color:black">모형/프라모델</a></th>
							<th><a href="#" style="color:black">게임퍼즐</a></th>
							<th><a href="#" style="color:black">서바이벌</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">잡화</a></th>
							<th><a href="#" style="color:black">악세서리</a></th>
							<th><a href="#" style="color:black">티셔츠</a></th>
							<th><a href="#" style="color:black">브로마이드</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">장식품</a></th>
							<th><a href="#" style="color:black">종교물품</a></th>
							<th><a href="#" style="color:black">문화제</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:black">게임기</a></th>
							<th><a href="#" style="color:black">게임CD/팩</a></th>
						</tr>
						<tr>
							<th><a href="#" style="color:coral">CD관련</a></th>
							<th><a href="#" style="color:coral">LP관련</a></th>
						</tr>
					</table>
				</div>
	<!-- carousel -->
				<div id="demo" class="carousel slide" data-ride="carousel">
				  <!-- Indicators -->
				  <ul class="carousel-indicators">
				    <li data-target="#demo" data-slide-to="0" class="active"></li>
				    <li data-target="#demo" data-slide-to="1"></li>
				    <li data-target="#demo" data-slide-to="2"></li>
				  </ul>
				  <!-- The slideshow -->
				  <div class="carousel-inner">
				    <div class="carousel-item active">
				      <img src="../images/la.jpg" alt="Los Angeles" width="100%" height="500">
				    </div>
				    <div class="carousel-item">
				      <img src="../images/chicago.jpg" alt="Chicago" width="100%" height="500">
				    </div>
				    <div class="carousel-item">
				      <img src="../images/ny.jpg" alt="New York" width="100%" height="500">
				    </div>
				  </div>
				  <!-- Left and right controls -->
				  <a class="carousel-control-prev" href="#demo" data-slide="prev">
				    <span class="carousel-control-prev-icon"></span>
				  </a>
				  <a class="carousel-control-next" href="#demo" data-slide="next">
				    <span class="carousel-control-next-icon"></span>
				  </a>
				</div>
	<!-- /carousel -->
			</div>
		</div>
	</div>
	<div class="container bg-3" style="margin-top: 20px; margin-bottom: 20px">
		<h3>시드 참여 목록</h3>
		<div class="row bg-secondary">	
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
		</div>
		<div class="row">	
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
		</div>
	</div>
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="javascript:;">처음</a>
		<li class="page-item"><a class="page-link" href="javascript:;">2</a>
		<li class="page-item"><a class="page-link" href="javascript:;">3</a>
		<li class="page-item"><a class="page-link" href="javascript:;">4</a>
		<li class="page-item"><a class="page-link" href="javascript:;">5</a>
		<li class="page-item"><a class="page-link" href="javascript:;">다음</a>
	</ul>
	<div class="container bg-3" style="margin-top: 20px; margin-bottom: 20px">
		<h3>경매 참여 목록</h3>
		<div class="row bg-secondary">	
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods<span class="badge badge-danger ml-2">new</span></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
		</div>
		<div class="row">	
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
			<div class="col-sm-3">
				<p>goods <small class="text-info">5 mins ago</small></p>
				<img src="https://placehold.it/150x80?text=IMAGE" class="img-responsive" style="width:100%" alt="Image">
			</div>
		</div>
	</div>
	<ul class="pagination justify-content-center">
		<li class="page-item"><a class="page-link" href="javascript:;">처음</a>
		<li class="page-item"><a class="page-link" href="javascript:;">2</a>
		<li class="page-item"><a class="page-link" href="javascript:;">3</a>
		<li class="page-item"><a class="page-link" href="javascript:;">4</a>
		<li class="page-item"><a class="page-link" href="javascript:;">5</a>
		<li class="page-item"><a class="page-link" href="javascript:;">다음</a>
	</ul>
	<div class="container-fluid">
		<div class="jumbotron"></div>
	</div>
</body>
</html>