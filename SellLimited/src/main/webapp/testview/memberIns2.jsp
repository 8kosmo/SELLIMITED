<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원가입</title>
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
	<form action="/member/memberIns.sf" method="post" accept-charset="utf-8" id="register_frm" name="register_frm">
		<ul class="mypage_title">
			<li>
				<table class="order_title_table">
					<colgroup>
					<col width="110px;" />
					<col width="" />
					</colgroup>
					<tr>
						<td class="ott_left"><img src="/images/integ/20150930_03.png"></td>
						<td class="ott_right">회원가입
							<p>SellLimited의 다양한 혜택과 회원서비스를 누리십시오.<span><img src="/images/integ/20150930_05.png"></span></p>
						</td>
					</tr>
				</table>
			</li>
			<li>
				<table class="mypage_table_head">
					<caption style="font-size:18px;font-weight:normal;">
					개인정보 입력 <img src="/images/integ/20150918_10.png">
					<p>아래의 모든 항목은 필수입력 사항입니다. 올바른 정보가 아닐시에는 정상적인 서비스를 이용할 수 없을 경우도 있습니다.</p>
					</caption>
				</table>
				<table class="indiv_table">
					<colgroup>
						<col width="20%;" />
						<col width="" />
					</colgroup>
										<tr>
						<th>아이디</th>
						<td><input type="text" class="input_name" name="mem_id" id="mem_id" style="IME-MODE:disabled;" maxlength='20' required="true"><button type="button" class="btn_hawaii" onclick="id_overlap()" style="cursor:pointer">중복확인</button>
							<div class="reg_notice" id="notice_id" style="color:#929292;font-size:11px;">
								<input type="hidden" name="overlap"/>
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호</th>
						<td>
							<input type="password" class="input_name" name="mem_password" id="password" maxlength='20' required="true">
							<img src="/images/join/unlock_1.gif" id="pw_chk_img1" class="q">
							<div class="reg_notice"  id="notice_password" style="color:#929292;font-size:11px;">
							</div>
						</td>
					</tr>
					<tr>
						<th>비밀번호 재확인</th>
						<td>
							<input type="password" class="input_name" name="password_confirm" id="password_confirm" onfocus="inFocus(this);" onBlur="outFocus(this)" maxlength='20'>
							<img src="/images/join/unlock_1.gif" id="pw_chk_img2" class="q">
							<div class="reg_notice"  id="notice_confirm_password" style="color:#929292;font-size:11px;">
														</div>	
						</td>
					</tr>
					<tr>
						<td colspan="2" style="height:15px;padding:0;"></td>
					</tr>
					<tr>
						<th>이름</th>
						<td><input type="text" class="input_name" name="mem_name" value="" maxlength="30" onfocus="inFocus(this);" onBlur="outFocus(this)" required="true"><p id="notice_name"></p></td>
					</tr>
					<tr>
						<th>닉네임</th>
						<td><input type="text" class="input_name" name="mem_nickname" value="" maxlength="30" onfocus="inFocus(this);" onBlur="outFocus(this)"></td>
					</tr>
					<tr>
						<th>성별</th>
						<td><input type="radio" name="mem_gender" value="male" checked> 남<input type="radio" style="margin-left:20px;" name="mem_gender" value="female" > 여
							<div class="reg_notice" style="color:#929292;font-size:11px;"></div>
						</td>
					</tr>
					<tr>
						<th>생년월일</th>
						<td>

							<span class="info_input2">
								<select name="yyyy" id="birth_year" style='height:25px;line-height:18px;padding:1px 5px 2px 8px;border:1px solid #d5d5d5;margin-right:7px;'><option>연도</option><option value='2005'>2005</option><option value='2004'>2004</option><option value='2003'>2003</option><option value='2002'>2002</option><option value='2001'>2001</option><option value='2000'>2000</option><option value='1999'>1999</option><option value='1998'>1998</option><option value='1997'>1997</option><option value='1996'>1996</option><option value='1995'>1995</option><option value='1994'>1994</option><option value='1993'>1993</option><option value='1992'>1992</option><option value='1991'>1991</option><option value='1990'>1990</option><option value='1989'>1989</option><option value='1988'>1988</option><option value='1987'>1987</option><option value='1986'>1986</option><option value='1985'>1985</option><option value='1984'>1984</option><option value='1983'>1983</option><option value='1982'>1982</option><option value='1981'>1981</option><option value='1980'>1980</option><option value='1979'>1979</option><option value='1978'>1978</option><option value='1977'>1977</option><option value='1976'>1976</option><option value='1975'>1975</option><option value='1974'>1974</option><option value='1973'>1973</option><option value='1972'>1972</option><option value='1971'>1971</option><option value='1970'>1970</option><option value='1969'>1969</option><option value='1968'>1968</option><option value='1967'>1967</option><option value='1966'>1966</option><option value='1965'>1965</option><option value='1964'>1964</option><option value='1963'>1963</option><option value='1962'>1962</option><option value='1961'>1961</option><option value='1960'>1960</option><option value='1959'>1959</option><option value='1958'>1958</option><option value='1957'>1957</option><option value='1956'>1956</option><option value='1955'>1955</option><option value='1954'>1954</option><option value='1953'>1953</option><option value='1952'>1952</option><option value='1951'>1951</option><option value='1950'>1950</option><option value='1949'>1949</option><option value='1948'>1948</option><option value='1947'>1947</option><option value='1946'>1946</option><option value='1945'>1945</option><option value='1944'>1944</option><option value='1943'>1943</option><option value='1942'>1942</option><option value='1941'>1941</option><option value='1940'>1940</option><option value='1939'>1939</option><option value='1938'>1938</option><option value='1937'>1937</option><option value='1936'>1936</option><option value='1935'>1935</option><option value='1934'>1934</option><option value='1933'>1933</option><option value='1932'>1932</option><option value='1931'>1931</option><option value='1930'>1930</option><option value='1929'>1929</option><option value='1928'>1928</option><option value='1927'>1927</option><option value='1926'>1926</option><option value='1925'>1925</option><option value='1924'>1924</option><option value='1923'>1923</option><option value='1922'>1922</option><option value='1921'>1921</option><option value='1920'>1920</option><option value='1919'>1919</option><option value='1918'>1918</option><option value='1917'>1917</option><option value='1916'>1916</option><option value='1915'>1915</option><option value='1914'>1914</option><option value='1913'>1913</option><option value='1912'>1912</option><option value='1911'>1911</option><option value='1910'>1910</option><option value='1909'>1909</option><option value='1908'>1908</option><option value='1907'>1907</option><option value='1906'>1906</option><option value='1905'>1905</option></select>
							</span>
							<span class="info_input3">
								<select name="mm" id="birth_month" style='height:25px;line-height:18px;padding:1px 5px 2px 8px;border:1px solid #d5d5d5;margin-right:7px;'><option>월</option><option value='01'>1</option><option value='02'>2</option><option value='03'>3</option><option value='04'>4</option><option value='05'>5</option><option value='06'>6</option><option value='07'>7</option><option value='08'>8</option><option value='09'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option></select>
							</span>
							<span class="info_input3">
								<select name="dd" id="birth_days" style='height:25px;line-height:18px;padding:1px 5px 2px 8px;border:1px solid #d5d5d5;margin-right:7px;'><option>일</option><option value='01'>1</option><option value='02'>2</option><option value='03'>3</option><option value='04'>4</option><option value='05'>5</option><option value='06'>6</option><option value='07'>7</option><option value='08'>8</option><option value='09'>9</option><option value='10'>10</option><option value='11'>11</option><option value='12'>12</option><option value='13'>13</option><option value='14'>14</option><option value='15'>15</option><option value='16'>16</option><option value='17'>17</option><option value='18'>18</option><option value='19'>19</option><option value='20'>20</option><option value='21'>21</option><option value='22'>22</option><option value='23'>23</option><option value='24'>24</option><option value='25'>25</option><option value='26'>26</option><option value='27'>27</option><option value='28'>28</option><option value='29'>29</option><option value='30'>30</option><option value='31'>31</option></select>
							</span>
							<div class="reg_notice" id="bir_notice" style="color:#929292;font-size:11px;"></div>			
							
						</td>
					</tr>
					<tr>
						<th>이메일</th>
						<td>
							<input type="text" class="input_mem_phone" style="width:150px" name="mem_email" id="email" onblur="emailchk_overlap();">
							<div class="reg_notice" id="email_notice" style="color:#929292;font-size:11px;"></div>
						</td>
					</tr>
					<tr>
						<th>주소</th>
						<td>
							<input type="text" class="input_add" name="zipcode" id="zipcode" readonly="readonly" value="">&nbsp;	<button type="button" class="btn_addno" onclick="goPopup()">우편번호 찾기</button>
							<br>
							<input type="text" class="input_addlong" style="margin-top:3px;width:200px" name="address" id="address" value="" readonly="readonly">
							<br>
							<input type="text" class="input_addlong" style="margin-top:3px;width:200px" name="address_detail" id="address_detail" value="">
						</td>
					</tr>
					<tr>
						<th>휴대전화번호</th>
						<td><input type="text" class="input_name" placeholder="- 없이 입력" name="mem_phone" id="mobile_auth" style="ime-mode:disabled;" maxlength="11">
						<div class="reg_notice" id="mobile_notice" style="color:#929292;font-size:11px;"></div></td>
					</tr>
					<tr>
						<td colspan="2" class="mem_enter"><button type="submit" class="camerun" style="cursor:pointer">가입하기</button></td>
					</tr>
				</table>
					
			</li>
		</ul>
	</form>
	<script type="text/javascript">
	var $overlap = $('input[name=overlap]');
	// 아이디 중복 체크
	function id_overlap() {

		var $username = $('input[name=mem_id]');

		if($username.val() == '' ) {
			$username.focus();
			$('#notice_id').html('<span style="color:red;">※ 필수 정보입니다.</span>');
			return false;
		}

		if($username.val().length < 6 || $username.val().length > 20) {
			$username.focus();
			$('#notice_id').html('<span style="color:red;">※ 아이디는 영문/숫자 6~20자 입니다.</span>');
			return false;
		}
		var username = $username.val();
 		$.ajax({
			type: 'get',
			url: '/rest/idInspection.sf?mem_id='+username,
			success: function(data) {
				if(data != '_ok') {
					$overlap.val(1);
					$('#notice_id').html('※ 사용가능한 아이디 입니다.');
					$username.val(username);
					return true;

				} else {

					$('#notice_id').html('<span style="color:red;">※사용불가능한 아이디입니다.</span>');
					$username.focus();
					$username.val('');
					return false;
				}
			},
			cache: false
		});
	}
	$(function(){

		//아이디
		$('input[name=mem_id]').keyup(function(e){
			if (!(e.keyCode >=37 && e.keyCode<=40)) {
				var v = $(this).val();
				var v= v.toLowerCase();		//소문자변경
				$(this).val(v.replace(/[^a-z0-9]/gi,''));	//영문숫자
				$('#notice_id').html('<div style="color:#fd5c03">※ 아이디는 영문/숫자 6~20자 입니다.</div>');
				if (chkType($(this).val(), 'lalnum') === true && $(this).val().length > 6 && $(this).val().length < 20) {
					$('#notice_id').html('<div style="color:#fd5c03">※ 중복확인을 진행해 주세요.</div>');
				}else{
					$('#notice_id').html('<div style="color:#fd5c03">※ 아이디는 영문/숫자 6~20자 입니다.</div>');
				}
			}
		});

		$('input[name=mem_id]').blur(function(e){
			var v = $(this).val();
			var v= v.toLowerCase();		//소문자변경
			$(this).val(v.replace(/[^a-z0-9]/gi,''));	//영문숫자
			if($(this).val()=='') $('#notice_id').html('<div style="color:#fd5c03">※ 필수 정보입니다.</div>');
		});

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

		// 생년월일체크
		$("#birth_year").blur(function() {
			if (chkYear($("#birth_year").val()) === false) {
				$('#bir_notice').html('<div style="color:#fd5c03">※ 연도를 선택해 주세요.</div>');
			}else{
				$('#bir_notice').html('');
			}
		});
		$("#birth_month").blur(function() {
			if (chkMonth($("#birth_month").val()) === false) {
				$('#bir_notice').html('<div style="color:#fd5c03">※ 월을 선택해 주세요.</div>');
			}else{
				$('#bir_notice').html('');
			}
		});
		$("#birth_days").blur(function() {
			if (chkDay($("#birth_days").val()) === false) {
				$('#bir_notice').html('<div style="color:#fd5c03">※ 일을 선택해 주세요.</div>');
			}else{
				$('#bir_notice').html('');
			}
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
		$('#register_frm').on('submit', function(){

			$('#notice_password').html('');
			$('#notice_id').html('');
			$('#notice_confirm_password').html('');
			$('#bir_notice').html('');
			$('#notice_name').html('');
			$('#mobile_notice').html('');

			var $username = $('input[name=username]');
			/* var $overlap = $('input[name=overlap]'); */
			
			
			if($username.val() == '') {
				alert('아이디를 입력하셔야 합니다.');
				$username.focus();
				return false;
			}
			if($overlap.val() != 1) {
				alert('아이디 중복 체크를 하셔야 합니다.');
				return false;
			}

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

			var $realname = $('input[name=mem_name]');
			if ($realname.val() == '' ) {
				alert('회원명을 정확하게 입력하셔야 합니다.');
				$realname.focus();
				return false;
			}

			if(chkType($realname.val(), 'kor') === false) {
				alert('회원명은 한글로 입력하셔야 합니다.');
				$realname.focus();
				return false;
			}

//			var $bir_year = $("#birth_year option:selected");
//			var $bir_month =  $("#birth_month option:selected");
//			var $bir_day =  $("#birth_days option:selected");

			var $bir_year = $("#birth_year");
			var $bir_month =  $("#birth_month");
			var $bir_day =  $("#birth_days");

			if (chkYear($("#birth_year").val()) === false) {
				alert('연도를 선택해 주세요.');
				$bir_year.focus();
				return false;
			}

			if (chkMonth($("#birth_month").val()) === false) {
				alert('월을 선택해 주세요.');
				$bir_month.focus();
				return false;
			}

			if (chkDay($("#birth_days").val()) === false) {
				alert('일을 선택해 주세요.');
				$bir_day.focus();
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
<script>balance()</script>
</body>
</html>