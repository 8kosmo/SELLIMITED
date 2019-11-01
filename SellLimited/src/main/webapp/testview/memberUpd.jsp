<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.StringTokenizer" %>
<%
   Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("rMap");
   String MEM_BDATE = rMap.get("MEM_BDATE").toString();
   StringTokenizer st = new StringTokenizer(MEM_BDATE,"/");
   String YY = st.nextToken();
   String MM = st.nextToken();
   String DD = st.nextToken();
%>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>회원정보수정</title>
<%@ include file="/common/cssJs.jsp" %>
</head>
<body>
<%@ include file="/common/top.jsp" %>
<div id="mypage">
   <ul class="mypage_title">
      <li>
         <table class="mypage_title_table">
            <colgroup>
               <col width="110px;">
               <col width="">
               <col width="260px;">
            </colgroup>
            <tbody><tr>
               <td class="mtt_left"><img src="/images/integ/20150918_01.png"></td>
               <td class="mtt_center">마이페이지
                 <p>아이디 : <span class="mttid"><%=mem_id%></span><br>
                     보유캐시 : <span class="mttcash"><a href="/mypage/cash_list"><%=nowBalance%> 원</a></span>
                  </p>
               </td>
               <td class="mtt_right" align="center">
                  <a href="/testview/cashCharge.jsp"><button type="button" class="juliet"><img src="/images/integ/20150918_03.png">캐시충전</button></a>
               </td>
            </tr></tbody>
         </table>
      </li>
      <li>
         <table class="mypage_category">
            <colgroup>
            <col width="20%;">
            <col width="20%;">
            <col width="20%">
            <col width="20%;">
            <col width="">
            </colgroup>
            <tbody><tr>
               <td>회원관리
                  <p><a href="/member/memberList.sf?mem_id=<%=mem_id%>">회원 정보수정</a><br>
                     <a href="/testview/memberDel.jsp">회원 탈퇴</a><br>
                     <a href="/account/accountList.sf?mem_id=<%=mem_id%>">계좌 거래내역</a><br>
                  </p>
               </td>
               <td>관심목록
                  <p><a href="/favorite/favSellerList.sf?mem_id=<%=mem_id%>">관심 회원 목록</a><br>
                     <a href="/testview/favProduct.jsp">관심 상품 목록</a><br>
                  </p>
               </td>
               <td>내 상품관리
                  <p><a href="/testview/ProductIns.jsp">상품 등록</a><br>
                     <a href="/product/authoritywaiting.sf?mem_id=<%=mem_id%>">승인 대기 상품</a><br>
                     <a href="/seed/seedInsProduct.sf?mem_id=<%=mem_id%>">시드 모집 상품</a><br>
                     <a href="/testview/auctionInsProduct.jsp">경매 진행 상품</a><br>
               </td>
               <td>참여 상품목록
                  <p><a href="/testview/seedImIn.jsp">시드 참여 상품</a><br>
                     <a href="/testview/auctionImIn.jsp">경매 참여 상품</a><br>
                     <a href="/product/productDelivery.sf?mem_id=<%=mem_id%>">상품 배송 정보</a></p>
               </td>
               <td>고객센터
                  <p><a href="/testview/notice.jsp">공 지 사 항</a><br>
                     <a href="/testview/FAQ.jsp">FAQ(자주하는 질문)</a><br>
                     <a href="/testview/QNA.jsp">1:1 문의게시판</a><br>
               </td>
            </tr></tbody>
         </table>
      </li>
      <!-- 공통부분 끝 -->
      <form action="/member/memberUpd.sf" accept-charset="utf-8" id="memberUpdForm" name="memberUpdForm" method="post">
     	<input type="hidden" name="mem_id" value="<%=mem_id%>" >
      <li>
         <table class="mypage_table_head">
            <caption>
               회원 정보수정 <img src="/images/integ/20150918_10.png">
               <p>안녕하세요! 한정판 물품 경매대행 공식사이트 SellLimited 입니다.<br>
            SellLimited는 회원님의 개인정보를 신중하게 보호하려 노력하고 있으며, 회원님의 동의없이 정보가 유출되지 않습니다. 자세한 내용은 '개인정보취급방침'에서 확인해 주십시오.</p>
            </caption>
         </table>
         <table class="indiv_table">
            <colgroup>
            <col width="20%;" />
            <col width="" />
         </colgroup>
         <tr>
            <th>아이디</th>
            
            <td style="height:25px;"><%=mem_id%></td>
         </tr>
         <tr>
            <th>비밀번호</th>
            <td><input type="password" class="input_name" name="mem_password" id="password" value="<%=rMap.get("MEM_PASSWORD")%>" required="true">
               <img src="/images/join/lock_1.gif" id="pw_chk_img1" class="q">
               <!-- 6~20자사이의 비밀번호 안치면 나오는부분 -->
               <div class="reg_notice"  id="notice_password" style="color:#929292;font-size:11px;">
               </div>
            </td>
         </tr>
         <tr>
            <th>비밀번호 확인</th>
            <td><input type="password" class="input_name" name="password_confirm" id="password_confirm"  value="<%=rMap.get("MEM_PASSWORD")%>">
               <img src="/images/join/unlock_1.gif" id="pw_chk_img2" class="q">
               <!-- 비밀번호 일치하지 않으면 나오는 부분 -->
               <div class="reg_notice"  id="notice_confirm_password" style="color:#929292;font-size:11px;">
               </div>   
            </td>
         </tr>
         <tr>
            <td colspan="2" style="height:15px;padding:0;"></td>
         </tr>
         <tr>
            <th>이름</th>
            <td><input type="text" class="input_name" disabled="disabled" name="realname" value="<%=mem_name%>"  maxlength="30">&nbsp;<span id="notice_name"></span></td>
         </tr>
         <tr>
            <th>닉네임</th>
            <td><input type="text" class="input_name" name="mem_nickname" value="<%=rMap.get("MEM_NICKNAME")%>"  maxlength="30"></td>
         </tr>
         <tr>
            <th>성별</th>
            <td><input type="radio" name="gender" value="1" checked=""> 남<input type="radio" style="margin-left:20px;" name="gender" value="2" > 여</td>
         </tr>
         <tr>
            <th>생년월일</th>
            <td>
               <span class="info_input2">
                  <input type="text" name="birth_year" id="birth_year" class="input_name" style="width:60px" maxlength="4" onkeydown="return showKeyCode(event)" value="<%=YY %>" readonly>
                  년
               </span>
               <span class="info_input3">
                  <input type="text" name="birth_month" id="birth_month" class="input_name" style="width:40px" maxlength="2" onkeydown="return showKeyCode(event)" value="<%=MM %>" readonly>
                  월
               </span>
               <span class="info_input3">
                  <input type="text" name="birth_days" id="birth_days" class="input_name" style="width:40px" maxlength="2" onkeydown="return showKeyCode(event)" value="<%=DD %>" readonly>
                  일
               </span>
               <div class="reg_notice" id="bir_notice" style="color:#929292;font-size:11px;"></div>
            </td>
         </tr>
         <tr>
            <th>이메일</th>
            <td>
               <input type="text" class="input_email" name="mem_email" id="mem_email" value="<%=rMap.get("MEM_EMAIL") %>" style="ime-mode:disabled;width:200px" maxlength="100" onblur="chk_email2()">
            </td>
         </tr>
         <tr>
            <td colspan="2" style="height:15px;padding:0;"></td>
         </tr>
         <tr>
            <th>주소</th>
            <td>
               <input type="text" class="input_add" name="zipcode" id="zipcode" readonly="readonly" value="">&nbsp;   <button type="button" class="btn_addno" onclick="goPopup()">우편번호 찾기</button>
               <br>
               <input type="text" class="input_addlong" style="margin-top:3px;width:200px" name="address" id="address" value="" readonly="readonly">
               <br>
               <input type="text" class="input_addlong" style="margin-top:3px;width:200px" name="address_detail" id="address_detail" value="">
            </td>
         </tr>
         <tr>
            <th>휴대전화번호</th>
            <td>
               <input type="text" class="input_name" placeholder="- 없이 입력" name="mem_phone" id="mem_phone" style="ime-mode:disabled;"  onkeydown="return showKeyCode(event)" maxlength="12" value="<%=rMap.get("MEM_PHONE")%>">
            </td>
         </tr>
         <tr>
            <td colspan="2" class="austria"><button type="submit" class="btn_luxemberg" style="cursor:pointer">회원정보수정</button><button type="button" class="btn_rome" onclick="history.go(-1)" style="cursor:pointer">취소</button></td>
         </tr>
         </table>
      </li>
      </form>
     </ul>
	 <script type="text/javascript">
		$(function(){
			$("#password").keyup(function() {
				var $password1 = $('input[name=mem_password]');
				if (chkPw($password1.val()) === false) {
					$('#notice_password').html('<div style="color:#fd5c03">※ 6~20글자로 입력해주세요.</div>');
					$("#pw_chk_img1").attr('src' , '/images/join/lock_2.gif');
					$password1.focus();
					return false;
				}else{
					$("#pw_chk_img1").attr('src' , '/images/join/lock_3.gif');
					$('#notice_password').html('');
				}
			});
	
			$("#password").blur(function(e){
				if($(this).val()=='') $('#notice_password').html('<div style="color:#fd5c03">※ 필수 정보입니다.</div>');
			});
	
			$("#password_confirm").keyup(function() {
				var $password1 = $('input[name=mem_password]');
				var $password2 = $('input[name=password_confirm]');
				if (chkPw($password2.val()) === false || $password1.val() != $password2.val()) {
					$('#notice_confirm_password').html('<div style="color:#fd5c03">※ 비밀번호를 확인해주세요.</div>');
					$("#pw_chk_img2").attr('src' , '/images/join/lock_2.gif');
					$password2.focus();
					return false;
				}else{
					$("#pw_chk_img2").attr('src' , '/images/join/lock_3.gif');
					$('#notice_confirm_password').html('');
				}
			});
	
			$("#password_confirm").blur(function(e){
				if($(this).val()=='') $('#notice_confirm_password').html('<div style="color:#fd5c03">※ 필수 정보입니다.</div>');
			});
	
			// 이름
			$("input[name=mem_name]").keyup(function(e) {
				var agent = navigator.userAgent.toLowerCase();
				if ((!(e.keyCode >=37 && e.keyCode<=40)) && !( (navigator.appName == 'Netscape' && agent.indexOf('trident') != -1) || (agent.indexOf("msie") != -1))) {
					var v = $(this).val();
					$(this).val(v.replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힝|\u318D\u119E\u11A2\u2022\u2025a\u00B7\uFE55]/gi,''));	//한글
					if(chkType(v, 'kor') === false)	$('#notice_name').html('<div style="color:#fd5c03">※ 회원명은 한글로 입력하셔야 합니다.</div>');
				}
			});
	
			// 이름
			$("input[name=mem_name]").blur(function(e) {
				var v = $(this).val();
				$(this).val(v.replace(/[^ㄱ-ㅎ|ㅏ-ㅣ|가-힝]/gi,''));	//한글
				if(chkType(v, 'kor') === false){
					$('#notice_name').html('<div style="color:#fd5c03">※ 회원명은 한글로 입력하셔야 합니다.</div>');
				}else{
					$('#notice_name').html('');
				}
				if($(this).val()=='') $('#notice_name').html('<div style="color:#fd5c03">※ 필수 정보입니다.</div>');
			});
	
			
			
			$("#email").keyup(function() {
				var v = $(this).val();
				var v= v.toLowerCase();		//소문자변경
				$(this).val(v.replace(/[^a-z0-9@.]/gi,''));	//영문숫자
			});
	
			$("#email").blur(function() {
				var v = $(this).val();
				var v= v.toLowerCase();		//소문자변경
				$(this).val(v.replace(/[^a-z0-9@.]/gi,''));	//영문숫자
				if (chkType($(this).val(), 'email') === false) {
					if($(this).val()) $('#email_notice').html('<div style="color:#fd5c03">※ 잘못된 이메일주소입니다.</div>');
				}else{
					$('#email_notice').html('');
				}
			});
	
			//휴대전화입력
			$('input[name=mem_phone]').keyup(function(e){
				var v = $(this).val();
				$(this).val(v.replace(/[^0-9]/gi,''));	//숫자
				$('#mobile_notice').html('<div style="color:#fd5c03">※ 휴대폰 번호를 입력하셔야 합니다.</div>');
			});
	
			$('input[name=mem_phone]').blur(function(e){
				var v = $(this).val();
				$(this).val(v.replace(/[^0-9]/gi,''));	//숫자
				$('#mobile_notice').html('');
				if($(this).val()=='') $('#mobile_notice').html('<div style="color:#fd5c03">※ 필수 정보입니다.</div>');
			});
	
			//가입하기 버튼 눌렀을때 폼전송할때 체크 먼저 하는 부분 여기서 return true되야 폼전송됨.
			$('#memberUpdForm').on('submit', function(){
	
				$('#notice_password').html('');
				$('#notice_id').html('');
				$('#notice_confirm_password').html('');
				$('#bir_notice').html('');
				$('#notice_name').html('');
				$('#mobile_notice').html('');
	
				var $username = $('input[name=username]');

	
				var $password1 = $('input[name=mem_password]');
				var $password2 = $('input[name=password_confirm]');
				if (chkPw($password1.val()) === false) {
					alert('비밀번호는 영문/숫자 6~20글자로 입력해주세요.');
					$password1.focus();
					return false;
				}
				if (chkPw($password2.val()) === false || $password1.val() != $password2.val()) {
					alert('비밀번호를 확인해주세요.');
					$password2.focus();
					return false;
				}
	
				var $email = $('input[name=mem_email]');
				if($email.val()==''){
					alert('이메일을 입력하셔야 합니다.');
					$email.focus();
					return false;
				}
	
				if (chkType($email.val(), 'email') == false) {
					alert('잘못된 이메일주소입니다.');
					$email.focus();
					return false;
				}
	
				var $mobile = $('input[name=mem_phone]');
				var $mobile_auth = $('input[name=mem_phone]');
	
				if($mobile.val() == '') {
					alert('휴대폰 인증을 받으셔야 합니다.');
					$mobile_auth.focus();
					return false;
				}
				return true;
			});
		});
	</script>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>