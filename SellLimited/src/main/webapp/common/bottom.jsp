<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공통부분 - Bottom, 퀵바</title>
<script type="text/javascript">
   //입찰중경매
   function auctionInsProduct(){
       <%      
             if(mem_id==null){   
       %>
                location.href="/testview/login.jsp";
       <%
             }else{
       %> 
               location.href='/product/auctionInsProduct.sf?mem_id=<%=mem_id%>'
       <%
             }
       %>
          }
   //관심판매자
   function favSeller(){
       <%      
             if(mem_id==null){   
       %>
                location.href="/testview/login.jsp";
       <%
             }else{
       %> 
               location.href='/favorite/favSellerList.sf?mem_id=<%=mem_id%>'
       <%
             }
       %>
          }
   //관심상품
   function favProduct(){
       <%      
             if(mem_id==null){   
       %>
                location.href="/testview/login.jsp";
       <%
             }else{
       %> 
               location.href='/favorite/favSellerList.sf?mem_id=<%=mem_id%>'
       <%
             }
       %>
          }
   //상품등록
   function productIns(){
       <%      
             if(mem_id==null){   
       %>
                location.href="/testview/login.jsp";
       <%
             }else{
       %> 
               location.href='/testview/ProductIns.jsp'
       <%
             }
       %>
          }
   //시드참여중
   function seedImIn(){
       <%      
             if(mem_id==null){   
       %>
                location.href="/testview/login.jsp";
       <%
             }else{
       %> 
               location.href='/product/seedImIn.sf?mem_id=<%=mem_id%>'
       <%
             }
       %>
          }
   //배송현황
   function productDelivery(){
       <%      
             if(mem_id==null){   
       %>
                location.href="/testview/login.jsp";
       <%
             }else{
       %> 
               location.href='/product/productDelivery.sf?mem_id=<%=mem_id%>'
       <%
             }
       %>
          }
   //TOP
   function goTop(){
               location.href='#';
          }

</script>
</head>
<body>
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
          <span class="bb_left"><img style="width:195px;margin-top:0px;" src="/images/banner/newlogo.png"></span>
          <span class="bb_right" style="color:#b2b2b2;font-size:8pt;">
             상호 : <strong>(주)SellLimited</strong> <span class="bmslash">|</span>
             사업자등록번호 : 111-22-3333 <span class="bmslash">|</span>
             대표 : 곽도훈 <span class="bmslash">|</span>
             통신판매신고번호 : 2019-서울가산-0315 <span class="bmslash">|</span>
             <br>
              주소 : 서울시 금천구 가산동 월드메르디앙2차타워 4층 <span class="bmslash">|</span>
              화장품 제조판매업(수입대행형) : 제 8134 호 <span class="bmslash">|</span>
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

<!-- <span id="bottomPage">
</span>end of bottom
<script src="/js/react/bottomPage.bundle.js"></script>
 -->
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
   <div id="total" ></div>
   <script src="/js/react/quickBar.bundle.js"></script>
</body>
</html>