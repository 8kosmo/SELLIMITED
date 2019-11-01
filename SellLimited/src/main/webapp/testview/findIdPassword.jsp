<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>아이디 비밀번호 찾기</title>
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
<style>
#notice_mobile div { height:auto;border:0px}
</style>
<div id="mypage">
   <ul class="mypage_title">
      <li>
         <table class="order_title_table">
            <colgroup>
            <col width="110px;">
            <col width="">
            </colgroup>
            <tbody><tr>
               <td class="ott_left"><img src="/images/integ/20150930_02.png"></td>
               <td class="ott_right">아이디, 비밀번호 찾기
                  <p>SellLimited의 다양한 혜택과 회원서비스를 누리십시오.</p>
               </td>
            </tr>
         </tbody></table>
      </li>
      <li>
         <table class="login_table">
            <tbody><tr>
               <td> <div>
                  <form action="http://japanstyle.co.kr/auth/forgot_myinfo" method="post" accept-charset="utf-8" id="search_frm" name="search_frm">                  <table class="login_table_inner">
                     <tbody><tr>
                        <td colspan="2" class="lti_title">아이디 찾기</td>
                     </tr>
                     <tr>
                        <td><input type="text" class="input_login" placeholder="성함을 입력해 주십시오" name="search_name" id="search_name" tabindex="1"></td>
                        <td rowspan="2"><button type="button" class="cuba" id="req" style="cursor:pointer">확인</button></td>
                     </tr>
                     <tr>
                        <td><input type="text" class="input_login2" placeholder="이메일을 입력해 주십시오" name="search_eamil" id="search_email" tabindex="2"></td>
                     </tr>
                     <tr>
                        <td colspan="2" id="notice_mobile"></td>
                     </tr>
                     <tr>
                        <td colspan="2" style="line-height:70px;">가입하셨던 성함과 이메일을 기입해 주십시오.</td>
                     </tr>                     
                     
                  </tbody></table>
                  </form>                  </div> </td>
               <td>
                  <div style="border-left:none;">
                  <form action="http://japanstyle.co.kr/auth/forgot_myinfo" method="post" accept-charset="utf-8">                  <table class="login_table_inner">
                     <tbody><tr>
                        <td colspan="2" class="lti_title">비밀번호 찾기</td>
                     </tr>
                     <tr>
                        <td><input type="text" class="input_login" placeholder="아이디를 입력해 주십시오" name="username" id="username" tabindex="3"></td>
                        <td rowspan="2"><button type="button" class="cuba" id="pw_find" style="cursor:pointer">확인</button></td>
                     </tr>
                     <tr>
                        <td><input type="text" class="input_login2" placeholder="휴대전화번호를 입력해 주십시오" name="pass_mobile" id="pass_mobile" tabindex="4" onkeydown="return onlyNumber(event)"></td>
                     </tr>
                     <tr>
                        <td colspan="2" style="line-height:70px;">가입하셨던 아이디와 휴대전화번호를 기입해 주십시오.</td>
                     </tr>
                  </tbody></table>
                  </form>                  </div>
               </td>
            </tr>
            <tr>
               <td colspan="2" class="fiji">비밀번호 찾기가 되지 않거나, 휴대전화로 비밀번호가 오지 않을 경우!<p>임시 비밀번호는 회원정보상에 있는 회원님의 휴대전화로 임시 비밀번호가 발급되어 발송됩니다.<br>( 재전송을 할때마다 비밀번호는 매번 변경되오니 꼭 마지막 수신한 비밀번호를 이용해 로그인하여 주십시오. 로그인 이후에는 회원정보수정에서 새로운 비밀번호로 변경해 주십시오. )<br>휴대전화 변경 등으로 임시 비밀번호 수신이 어려운 경우에는 <br>아래의 고객센터로 문의주시면 조치해 드리겠습니다.<br><br><span>고객센터&nbsp;&nbsp;<strong>1644-4139</strong></span></p></td>
            </tr>
         </tbody></table>
      </li>
   </ul>
   </div>
</div>
<script>balance()</script>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>