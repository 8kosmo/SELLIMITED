<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<%@ include file="/common/cssJs.jsp" %>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
   String mem_name = null;
   int nowBalance = 0;
   String mem_id = null;
   String acct_number = null;
    if (session.getAttribute("mem_name") == null 
          ||session.getAttribute("nowBalance") == null) {
    }else{
        mem_name = (String)session.getAttribute("mem_name");
        nowBalance = (int)session.getAttribute("nowBalance");
        mem_id = (String)session.getAttribute("mem_id");
        acct_number = (String)session.getAttribute("acct_number");
    }
%>

<script type="text/javascript">
   var mem_name = '<%=mem_name%>';
   var nowBalance = '<%=nowBalance%>';
   $(document).ready(function(){
      //로그인 실패시
      if(mem_name=='null'){
         $("#login").show();
         $("#logout").hide();
         $("#managerLogout").hide();
      }else if(mem_name=='관리자'){
         $("#login").hide();
         $("#logout").hide();
         $("#managerLogout").show();
      }else {
         $("#login").hide();
         $("#logout").show();
         $("#managerLogout").hide();
      }
   });
      function logout(){
         location.href="/common/sessionDel.jsp";   
   }
      function balance(){
          if(mem_name!='null'&&mem_name!='관리자'){
             $.ajax({
                  method:'GET'
                 ,url:'/rest/accountBalance.sf?mem_id=<%=mem_id%>'
                 ,data:'data'
                 ,success:function(data){
                    if(<%=nowBalance%>!=data){
                       location.reload();
                    }
                 }      
              });
          }
       }
      function total_search() {
        var searchWord = $("#SearchWord").val();
        if(searchWord == ''){
          alert('검색 할 상품을 입력 해주세요');
          $("#SearchWord").focus();
          return false;
        }else{           
           location.href="/product/productList.sf?keyword="+searchWord;
        }
   }
      function login(){
          var mem_id = $("#mem_id").val();
          var mem_password = $("#mem_password").val();
          $.ajax({
              type:'POST'
             ,url:'/rest/login.sf'
             ,data:$("#login_frm").serialize()
             ,success:function(data){
                   //alert(data);
                   var jsonStr = JSON.parse(data);
                   //alert(jsonStr);
                   if(jsonStr.length>0){
                      var result="";
                         if('비밀번호를 잘못 입력하셨습니다.'== jsonStr[0] 
                               || '아이디가 존재하지 않습니다.'== jsonStr[0]){
                            var result=jsonStr[0];
                            //alert(result);
                            $("#wrong").html(result);
                         }else{
                            var mem_name=jsonStr[0];
                            var nowBalance=jsonStr[1];
                            //alert(mem_name);
                            //alert(nowBalance);
                            location.href="/product/mainViewTOP6.sf";
                         }
                      
                     }
             }
          });
       }

</script>
</head>
<body>
<!-- top은 페이지 맨 위에 로그인, 회원가입 등 있는 하얀 부분 , top의 css에 하단에 보라색 줄그어진거 그려져있음.-->
<div id="top" align="center">
<!-- head -->
<ul class="head">
   <li class="head_txt" style="width: auto; float: right;">
      <div id="login" style="display:inline;">
         <a href="/testview/login.jsp" onclick="">로그인</a><span>|</span>
         <a href="/testview/memberIns.jsp"><strong>회원가입</strong></a><span>|</span>
      </div>
      <div id="logout" style="display:inline;">
         <a href="#"><%= mem_name+"님 환영합니다." %></a><span>|</span>
         <a href="#" style="margin-right:450px"><%="현재 보유 캐시 : "+nowBalance %></a>
         <a href="#" onclick="logout()">로그아웃</a><span>|</span>
         <a href="/testview/myPage.jsp"><strong>마이페이지</strong></a><span>|</span>
      </div>
      <div id="managerLogout" style="display:inline;">
         <a href="#"><%= mem_name+"님 환영합니다." %></a><span>|</span>
         <a href="#" style="margin-right:500px">&nbsp</a>
         <a href="#" onclick="logout()">로그아웃</a><span>|</span>
         <a href="/product/itemStatusList.sf"><strong>관리페이지</strong></a><span>|</span>
      </div>
      <a href="/testview/howToUse.jsp">이용안내</a><span>|</span>
      <div class="layer_add2">
         <a href="#">고객센터</a>
         <ul class="list_layer2">
               <li><a href="/testview/notice.jsp">공지사항</a></li>
               <li><a href="/testview/QNA.jsp">1:1문의</a></li>
               <li><a href="/testview/FAQ.jsp">FAQ</a></li>
         </ul>
         </div>
   </li>  
</ul>
<!-- 로고,검색창,검색버튼 있는부분 -->
<ul class="logopart">
   <!-- 로고있는부분 -->
   <li class="logopart_left" ><a href="/product/mainViewTOP6.sf"><img style="width:195px;margin-top:34px;" src="/images/logo.png"/></a></li>
   <!-- 검색창있는부분 -->
   <li class="logopart_center">
      <span class="searchbox_form">
         <!-- 검색창 -->
         <input type="text" class="input_search" name="SearchWord" id="SearchWord" value="" onkeydown="javascript: if (event.keyCode == 13) { total_search();return false; }">
      </span>
      <!-- 검색버튼 -->
      <span><a href="javascript:total_search()"><img src="/images/japanstyle_files/20160926_07.png"></a></span>
   </li>
   <!-- 검색창 오른쪽 광고배너 -->
   <li class="logopart_right"><a href="#"><img src="/images/japanstyle_files/20181113_01.png"></a></li>
</ul>
<!-- 대분류  -->
<ul class="gnb">
   <li class="gnb_left">
      <a href="/product/productList.sf?sub_category=패션"><span>패션</span></a>
      <a href="/product/productList.sf?sub_category=카메라"><span>카메라</span></a>
      <a href="/product/productList.sf?sub_category=악기"><span>악기</span></a>
      <a href="/product/productList.sf?sub_category=키덜트"><span>키덜트</span></a>
      <a href="/product/productList.sf?sub_category=연예인굿즈"><span>연예인 굿즈</span></a>
      <a href="/product/productList.sf?sub_category=골동품"><span>골동품</span></a>
      <a href="/product/productList.sf?sub_category=게임"><span>게임</span></a>
      <a href="/product/productList.sf?sub_category=음반"><span>음반</span></a>
   </li>
</ul>
</div><!-- end of div top -->
<div id="mypage">
<form accept-charset="utf-8" id="login_frm" name="login_frm">
<input type="hidden" name="url" value="/mypage/qna/write">

   <ul class="mypage_title">
      <li>
         <table class="order_title_table">
            <colgroup>
            <col width="110px;">
            <col width="">
            </colgroup>
            <tbody><tr>
               <td class="ott_left"><img src="/images/integ/20150925_05.png"></td>
               <td class="ott_right">로그인
                  <p><strong>SellLimited</strong>의 다양한 혜택과 회원서비스를 누리십시오.</p>
               </td>
            </tr>
         </tbody></table>
      </li>
      <li>
         <table class="login_table">
            <colgroup>
            <col width="500px;">
            <col width="">
            </colgroup>
            <tbody><tr>
               <td> <div>
               <!-- 로그인화면1 -->
                  <table class="login_table_inner">
                     <tbody><tr>
                        <td class="lti_title" style="line-height:50px;">회원 로그인</td>
                     </tr>
                     <tr>
                        <td><input type="text" class="input_login" placeholder="아이디를 입력하세요" name="mem_id" id="mem_id" tabindex="1" value="" style="IME-MODE:disabled;" onkeydown="alnum_check(event,this);"></td>
                     </tr>
                     <tr>
                        <td><input type="password" onkeydown="javascript: if (event.keyCode == 13) {login()}" class="input_login2" placeholder="비밀번호를 입력하세요" name="mem_password" id="mem_password" tabindex="2" maxlength="20"></td>
                     </tr>
                     <tr style="height:5px;"><td></td></tr><tr>
                     </tr><tr>
                        <td>
                        <span style="color:#929292"><!-- ※아이디/이메일 둘다 가능 합니다. --></span>
                                                </td>
                     </tr>
                     <tr>
                        <td type="text" id="wrong" name="wrong" style="color:red;"></td>
                     </tr>
                     <tr>
                        <td><input type="checkbox" name="remember" value="1"> 아이디 저장<span class="lti_slash">|</span><a href="/testview/findIdPassword.jsp">아이디/비밀번호 찾기</a></td><!-- !! -->
                     </tr>
                     <tr>
                        <td>
                           <button type="button" onclick="javascript:login()" class="login_submit_button" >로그인</button>
                        </td>
                     </tr>
                  </tbody></table>

                  </div> </td>
               <td><img src="/images/integ/login_side.png"></td>
            </tr>
            <tr>
               <td colspan="2" class="caspi">아직 SellLimited 회원이 아니십니까?<p>SellLimited의 회원이 되시면 찾으시던 상품경매 및 다양한 혜택과 서비스를 누리실 수 있습니다.</p><button type="button" class="onduras" onclick="location.href='#'" style="cursor:pointer">회원가입</button></td>
            </tr>
         </tbody></table>
      </li>
   </ul>
</form><br>
<script type="text/javascript">
$(function() {
   $('#login').focus();
});
</script>
</div>
<%@ include file="/common/bottom.jsp" %>
<script>balance()</script>
</body>
</html>