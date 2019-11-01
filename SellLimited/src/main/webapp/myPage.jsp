<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<style>
   * {box-sizing: border-box}
   body {font-family: "Lato", sans-serif;}
   
   /* Style the tab */
   .tab {
     float: left;
     border: 1px solid #ccc;
     background-color: #f1f1f1;
     width: 15%;
     height: 1000px;
   }
   
   /* Style the buttons inside the tab */
   .tab button {
     display: block;
     background-color: inherit;
     color: black;
     padding: 22px 16px;
     width: 100%;
     border: none;
     outline: none;
     text-align: left;
     cursor: pointer;
     transition: 0.3s;
     font-size: 17px;
   }
   
   /* Change background color of buttons on hover */
   .tab button:hover {
     background-color: #ddd;
   }
   
   /* Create an active/current "tab button" class */
   .tab button.active {
     background-color: #ccc;
   }
   
   /* Style the tab content */
   .tabcontent {
     float: left;
     padding: 0px 12px;
     border: 1px solid #ccc;
     width: 85%;
     border-left: none;
     height: 1000px;
   }
</style>
</head>
<body>
<!-- MyPage-Header-->
   <div class="container">
      <div class="row">
         <div class="col">
            <nav class="navbar navbar-expand-sm navbar-light justify-content-end">
              <ul class="navbar-nav">
                <li class="nav-item">
                  <a class="nav-link" href="main.jsp">시작화면</a>
                </li>
                <li class="nav-item active">
                  <a class="nav-link" href="#">로그아웃</a>
                </li>
                <li class="nav-item">
                  <a class="nav-link" href="#">이용안내</a>
                </li>
              </ul>
            </nav>
         </div>
      </div>
   </div>
      <div class="container-fluid" style="margin-top: 10px;align:right">
      <div class="row">
         <div class="col-sm-1">
         </div>
         <div class="col-sm-2">
            <img src="./images/index.gif" class="rounded" width="214" height="80">
         </div>
         <div class="col-sm-6">
            <form>
               <div class="input-group">
                  <input type="text" class="form-control" placeholder="Search here">
                  <div class="input-group-append">
                     <button class="btn btn-success" type="submit">검색</button> 
                  </div>
               </div>
            </form>         
         </div>
         <div class="col-sm-2">
            <input type="text" placeholder="실시간 검색기능">
         </div>
         <div class="col-sm-1">
         
         </div>
      </div>
   </div>
<!-- /MyPage-Header-->
<!-- MyPage-Body -->
   <div class="container-fluid">
      <div class="row">
         <div class="col-sm-1" style="background-color: highlight;">
         
         </div>
         <div class="col-sm-10">
            <div class="tab">
              <button class="tablinks" onclick="openCity(event, 'memberUpdate')">회원 정보 수정</button>
              <button class="tablinks" onclick="openCity(event, 'myFavoritePage')" id="defaultOpen">관심회원 및 상품</button>
              <button class="tablinks" onclick="openCity(event, 'myProductInsert')">회원 상품 등록</button>
              <button class="tablinks" onclick="openCity(event, 'myProductList')">등록 상품 조회</button>
              <button class="tablinks" onclick="openCity(event, 'joinProductList')">참여 상품 정보</button>
              <button class="tablinks" onclick="openCity(event, 'myAccountList')">거래 내역 정보</button>
              <button class="tablinks" onclick="openCity(event, 'deliveryService')">상품 배송 정보</button>
              <button class="tablinks" onclick="openCity(event, 'CS')">고객 센터 문의</button>
            </div>
            <div id="memberUpdate" class="tabcontent">
               <h1>memberUpdate.jsp</h1>
            </div>
            <div id="myFavoritePage" class="tabcontent">
               <h1>myFavoritePage.jsp</h1>
            </div>
            <div id="myProductInsert" class="tabcontent">
               <h1>myProductInsert.jsp</h1>
            </div>
            <div id="myProductList" class="tabcontent">
               <h1>myProductList.jsp</h1>
            </div>
            <div id="joinProductList" class="tabcontent">
               <h1>joinProductList.jsp</h1>
            </div>
            <div id="myAccountList" class="tabcontent">
               <h1>myAccountList.jsp</h1>
            </div>
            <div id="deliveryService" class="tabcontent">
               <h1>deliveryService.jsp</h1>
            </div>
            <div id="CS" class="tabcontent">
            <h1>customerService</h1>
            </div>
         </div>
         <div class="col-sm-1" style="background-color: highlight">
         
         </div>
      </div>
   </div>
<!-- /MyPage-Body -->
<!-- MyPage-Footer -->
   <div class="container">   
      <div class="jumbotron">
      
      </div>
   </div>
<!-- /MyPage-Footer -->
<script>
   function openCity(evt, cityName) {
     var i, tabcontent, tablinks;
     tabcontent = document.getElementsByClassName("tabcontent");
     for (i = 0; i < tabcontent.length; i++) {
       tabcontent[i].style.display = "none";
     }
     tablinks = document.getElementsByClassName("tablinks");
     for (i = 0; i < tablinks.length; i++) {
       tablinks[i].className = tablinks[i].className.replace(" active", "");
     }
     document.getElementById(cityName).style.display = "block";
     evt.currentTarget.className += " active";
   }
   
   // Get the element with id="defaultOpen" and click on it
   document.getElementById("defaultOpen").click();
</script>
</body>
</html>