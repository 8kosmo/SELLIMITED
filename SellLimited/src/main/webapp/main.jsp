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
   </script>
</head>
<body>
   <script>
      $(document).ready(function() {
         $("#logoutForm").hide();
      });
   </script>
<div class="top-bar">
   <div class="container" id="loginForm">
      <div class="col">
         <nav class="navbar navbar-expand-sm justify-content-end">
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
   <div class="container" id="logoutForm">
      <div class="col">
         <nav class="navbar navbar-expand-sm justify-content-end">
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
         <div class="col-sm-3">
            <img src="../images/index.gif" class="rounded" width="214" height="80">
         </div>
         <div class="col-sm-6">
            <form>
               <div class="input-group">
                  <input type="text" id=""class="form-control" placeholder="Search here">
                  <div class="input-group-append">
                     <button class="btn btn-success" type="submit">검색</button> 
                  </div>
               </div>
            </form>         
         </div>
         <div class="col-sm-3">
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
         <div class="col-sm-3 bg-dark">
            <ul class="nav flex-column">
               <li class="nav-item">
                  <a class="nav-link text-white" onmouseover="">패션<span class="badge badge-primary ml-1">best</span></a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-white">카메라</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-white">악기</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-white">키덜트</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-white">연예인 굿즈</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-white">골동품</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-white">게임</a>
               </li>
               <li class="nav-item">
                  <a class="nav-link text-white">음반</a>
               </li>
            </ul>
         </div>
   <!-- /category -->
         <div class="col-sm-9">
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
   <div class="container bg-3" style="margin-top: 10px">
      <h3>현재 경매 준비 중인 상품</h3>
      <div class="row bg-secondary">   
 <div class="row" style="margin:5px">
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>입찰건수 : 12건</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">입찰가 : 65,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">경매입장</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>입찰건수 : 12건</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">입찰가 : 65,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">경매입장</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>입찰건수 : 12건</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">입찰가 : 65,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">경매입장</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>입찰건수 : 12건</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">입찰가 : 65,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">경매입장</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>입찰건수 : 12건</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">입찰가 : 65,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">경매입장</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>

 </div>
      </div>
      <div class="row bg-secondary">   
   <div class="row" style="margin:5px">
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>참여인원 : 6명</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">시작가 : 15,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">시드참여</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>참여인원 : 6명</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">시작가 : 15,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">시드참여</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>참여인원 : 6명</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">시작가 : 15,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">시드참여</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>참여인원 : 6명</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">시작가 : 15,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">시드참여</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
  <div class="card col" style="width:20%">
    <img class="card-img-top" src="./images/sample.jfif" alt="Card image" style="width:100%">
    <div class="card-body">
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>참여인원 : 6명</span></div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col"><span>관심상품등록<a href="#">&nbsp;<img src="./images/fav.png"></a></span></div>
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">시작가 : 15,000</div>
	    	
	    </div>
	    <div class="row" style="margin-bottom:5px">
	    	<div class="col">즉시구매가 : 150,000</div>
	    </div>
	    <div class="row">
	    	<div class="col"><a href="#" class="btn btn-primary" style="width:100%">시드참여</a></div>
	    </div>
    </div>
    <div class="card-body">
        <p class="card-text" style="font-size:15px">미개봉 원피스pop보아 핸콕Ver.BB _GOLD</p>
        <p class="card-text" style="font-size:12px">판매자 : 박상범<br>남은시간 : 2일</p>
    </div>
 </div>
 

 </div>
      </div>
      <div class="row bg-secondary">   
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
   <div class="container-fluid">
      <div class="jumbotron"></div>
   </div>
</body>
</html>