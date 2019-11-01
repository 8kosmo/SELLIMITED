<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>테스트</title>
<link rel="shortcut icon" type="image/x-icon" href="/favicon.ico" />
<link rel="stylesheet" href="/css/common.css" type="text/css" />
<link rel="stylesheet" href="/css/renew.css" type="text/css" />
<link rel="stylesheet" href="/css/jquery.bxslider.css" type="text/css" />
<link type="text/css" rel="stylesheet" href="/css/customs_calc.css" />
<link rel="stylesheet" href="/css/japanstyle.css" type="text/css" />

<script type="text/javascript" src="/newjs/jquery.min.js"></script>
<script type="text/javascript" src="/newjs/common.js"></script>
<script type="text/javascript" src="/newjs/site.js"></script>
<script type="text/javascript" src="/newjs/layer_pop.js"></script>
<script type="text/javascript" src="/newjs/jquery.cookie.js"></script>
<script type="text/javascript" src="/newjs/jquery.bxslider.min.js"></script>
<script type="text/javascript" src="http://wcs.naver.net/wcslog.js"> </script>
<script type="text/javascript" src="/newjs/placeholders.min.js"></script>
<script type="text/javascript" src="/newjs/mosaic.1.0.1.min.js"></script>

<link rel="stylesheet" href="/css/jquery.ui.css" type="text/css" />
<style>
.mosaic-block {
	position:relative;
	overflow:hidden;
	width:182px;
	height:182px;
}

.mosaic-backdrop {
	display:none;
	position:absolute;
	top:0;
	height:100%;
	width:100%;
	background:#111;
}

.mosaic-overlay {
	display:none;
	z-index:5;
	position:absolute;
	width:100%;
	height:100%;
	background:#111;
}
.bar .mosaic-overlay {
	z-index:9999;
	bottom:-100px;
	height:30px;
	background:url(/images/bg-black.png);
}
</style>

<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
	String mem_name = null;
	String nowBalance = null;
    if (session.getAttribute("mem_name") == null 
    		||session.getAttribute("nowBalance") == null) {
    }else{
    	 mem_name = (String)session.getAttribute("mem_name");
    	 nowBalance = (String)session.getAttribute("nowBalance");
    }
%>

<script>
	var mem_name = '<%=mem_name%>';
	var nowBalance = '<%=nowBalance%>';
	$(document).ready(function(){
		//로그인 실패시
		if(mem_name=='null'){
			$("#logout").hide();
			$("#login").show();
		}else{
			$("#login").hide();
			$("#logout").show();
		}
	})
		function logout(){
<%
			session.removeAttribute("mem_name");
			session.removeAttribute("nowBalance");
%>
			location.href="/testview/commonView.jsp";	
	}
</script>
</head>
<body>
<!-- wrap이 뷰 전체에 대한 div -->
<!-- <div id="wrap"> -->
<!-- top은 페이지 맨 위에 로그인, 회원가입 등 있는 하얀 부분 , top의 css에 하단에 보라색 줄그어진거 그려져있음.-->
<div id="top" style="align:center">
<!-- head -->
<ul class="head">
	<li class="head_txt" style="width: auto; float: right;">
		<div id="login" style="display:inline;">
			<a href="#" onclick="">로그인</a><span>|</span>
			<a href="#"><strong>회원가입</strong></a><span>|</span>
		</div>
		<div id="logout" style="display:inline;">
		<a href="#"><%= mem_name+"님 환영합니다." %></a><span>|</span>
		<a href="#" style="margin-right:500px"><%="현재 보유 캐시 : "+nowBalance %></a>
			<a href="#" onclick="logout()">로그아웃</a><span>|</span>
			<a href="#"><strong>마이페이지</strong></a><span>|</span>
		</div>
		<a href="#">이용안내</a><span>|</span>
		<div class="layer_add2">
			<a href="#">고객센터</a>
			<ul class="list_layer2">
					<li><a href="#">공지사항</a></li>
					<li><a href="#">1:1문의</a></li>
					<li><a href="#">FAQ</a></li>
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
		<span><a href="#" onclick=""><img src="/images/japanstyle_files/20160926_07.png"></a></span>
	</li>
	<!-- 검색창 오른쪽 광고배너 -->
	<li class="logopart_right"><a href="#"><img src="/images/japanstyle_files/20181113_01.png"></a></li>
</ul>
<!-- 대분류  -->
<ul class="gnb">
	<li class="gnb_left" align="center">
		<a href="#"><span>패션</span></a>
		<a href="#"><span>카메라</span></a>
		<a href="#"><span>악기</span></a>
		<a href="#"><span>키덜트</span></a>
		<a href="#"><span>연예인 굿즈</span></a>
		<a href="#"><span>골동품</span></a>
		<a href="#"><span>게임</span></a>
		<a href="#"><span>음반</span></a>
	</li>
</ul>
</div><!-- end of div top -->
<!-- 소분류 부분 -->
<div id="main_navi">
	<ul>
		<li>
			<a href="#">신발</a>
			<a href="#">모자</a>
			<a href="#">시계</a>
		</li>
		<li>
			<a href="#">필름카메라</a>
			<a href="#">DSLR</a>
			<a href="#">미러리스</a>
		</li>
		<li>
			<a href="#">바이올린</a>
			<a href="#">피아노</a>
			<a href="#">일렉 기타</a>
		</li>
		<li>
			<a href="#">피규어</a>
			<a href="#">프라모델</a>
			<a href="#">만화책</a>
		</li>
		<li>
			<a href="#">사인물품</a>
			<a href="#">애장품</a>
			<a href="#">기타</a>
		</li>
		<li>
			<a href="#">동전</a>
			<a href="#">우표</a>
			<a href="#">기타</a>
		</li>
		<li>
			<a href="#">게임기</a>
			<a href="#">게임팩</a>
			<a href="#">기타</a>
		</li>
		<li>
			<a href="#">국내</a>
			<a href="#">해외</a>
			<a href="#">기타</a>
		</li>
	</ul>	
</div><!-- end of main_navi -->
<!-- 페이지 하단에 푸터 -->
<div id="bottom">
	 <ul>
	 	 <!-- 푸터 첫번째줄 -->
	 	 <li class="bm_menu" align="center">
		 	 <a href="#" target="_blank">회사소개</a><span>|</span>
		 	 <a href="#">이용약관</a><span>|</span>
		 	 <a href="#"><strong style="color:red">개인정보처리방침</strong></a><span>|</span>
		 	 <a href="#">이용안내</a><span>|</span>
		 	 <a href="#">고객불만 처리센터</a>
		 <!-- 푸터 첫번째줄 밑에 몸통부분 살짝 회색부분 -->
		 <li class="bm_body">
		 	<span class="bb_left"><img src="/images/japanstyle_files/logo_black.png"></span>
		 	<span class="bb_right" style="color:#b2b2b2;font-size:8pt;">
		 		상호 : <strong>(주)SellLimited</strong> <span class="bmslash">|</span>
		 		사업자등록번호 : 111-22-3333 <span class="bmslash">|</span>
		 		대표 : 김대영 <span class="bmslash">|</span>
		 		통신판매신고번호 : 2019-서울가산-0315 <span class="bmslash">|</span>
		 		<br>
		 		 주소 : 서울시 금천구 가산동 월드메르디앙2차타워 4층 <span class="bmslash">|</span>
		 		 화장품 제조판매업(수입대행형) : 제 8134 호 <span class="bmslash">|</span>
		 		 특별통관대상업체 : 0001400011
		 		<br>
		 		<strong style='color:#484848'>대표전화 : 1588-1234</strong> <span class="bmslash">|</span>
		 		FAX : 02-123-4567 <span class="bmslash">|</span>
		 		고객문의 : SellLimited@naver.com <span class="bmslash">|</span>
		 		제휴문의 : SellLimited@naver.com
		 		<br>
		 		<br>
		 		<span class="copy">COPYRIGHT ⓒ2019 SELLLIMITED ALL RIGHTS RESERVED</span>
		 	</span>
		 	<img src="/images/renew160927/20160927_10.png?v=1" usemap="#bottom_map2" style="cursor:pointer;">
		 	 <p>SELLLIMITED는 한정판 물품 경매사이트 이며 입찰, 구매를 중계하는 서비스를 제공하며, 상품의 이미지 및 등록내용, 진품여부 등에 대해서는 일체의 책임을 지지 않습니다.<br>
			 SELLLIMITED는 경매법 등 관련규정을 준수하고 불법물품을 취급하지 않으며, 분할배송에 의한 가격허위신고등 구매자의 불법사항 요청에 대해 일체 협조하지 않습니다.</p>
		 </li>
	 </ul>
</div><!-- end of bottom -->
<!-- 하단에 우리은행 등 링크 거는거 -->
<map name="bottom_map2">
 <area shape="rect" coords="341,1,509,41" href="https://www.venturein.or.kr/venturein/infor/C22100.do" target="_blank" onfocus="this.blur()">
 <area shape="rect" coords="510,1,680,41" href="javascript:wooribank();" onfocus="this.blur()">
 <area shape="rect" coords="681,1,849,41" href="http://www.customs.go.kr/kcshome/index.jsp" target="_blank" onfocus="this.blur()">
 <area shape="rect" coords="850,1,1017,41" href="http://pgweb.uplus.co.kr:8080/pg/wmp/etc/jsp/SettlementSearchr.jsp" target="_blank" onfocus="this.blur()">
</map>
<script type="text/javascript">
	function usafe(strActPage){
		window.open("http://www.usafe.co.kr/usafeShopCheck.asp?com_no="+strActPage,"", "width=520, height=400, scrollbars=no, location=yes, status=yes, left=0, top=0");
	}
	function wooribank(){
		window.open("/pop/wooribank_guarantee.html", "woori_safety_service", "width=630, height=797, resizable=no, scrollbars=no, toolbars=no");
	}
</script>
<!-- </div>end of div wrap -->

<!-- 오른쪽 퀵바 -->
<table id="quickTapbox_table" border="0" cellpadding="0" cellspacing="0" width="1018" >
	<tr>
		<td width= "73"></td>
		<td width="1018"></td>
		<td width= "73" style=" top:0px;width: 70px;height: 100%;z-index: 9999;right:-2px;">
			<table id="quickTapbox" width="73"border="0" cellspacing="0" cellpadding="0"   style="z-index:100">
				<tr>
					<td>
						<div class="quickTapbg" id="quickTapbg">
							<ul>
								<li height="45">&nbsp;</li>
								<li>
									<a href="javascript:quick_open_top()" id="toggle" value='1'><img src="/images/quick_open.png" width="73" height="35" alt="open" id="quick_arrow"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('8', 0)"><img src="/images/quick_tab7.gif" width="73" height="64" alt="입찰중경매"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('3', 0)"><img src="/images/quick_tab1.gif" width="73" height="65" alt="관심상품"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('4', 0)"><img src="/images/quick_tab2.gif" width="73" height="64" alt="관심판매자"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('5', 0)"><img src="/images/quick_tab3_new.gif" width="73" height="64" alt="관심카테고리"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('6', 0)"><img src="/images/quick_tab4.gif" width="73" height="64" alt="관심키워드"></a>
								</li>
								<li>
									<a href="javascript:quick_switch('7', 0)"><img src="/images/quick_tab5.gif" width="73" height="64" alt="오늘본상품"></a>
								</li>
								<li><a href="#"><img src="/images/quick_tab_top.gif" alt="top"></a></li>
							</ul>
						</div>
					</td>
				</tr>
			</table>
				<table width="641" border="0" cellspacing="0" cellpadding="0" class="quickTapbox2" id="quickTapbox2" style="display:none">
							<tr>
								<td>
									<div class="quickTapbg2" id="quick_contents">
									</div>
								</td>
							</tr>
				</table>
	    </td>
	</tr>
</table>
<input type="hidden" name="isQuickOpen" id="isQuickOpen" value="false">
</body>
</html>














