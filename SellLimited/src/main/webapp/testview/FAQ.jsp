<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>FAQ</title>
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
           <li>
      <table class="mypage_table_head" id="faq_content">
         <caption>
            FAQ (자주하는 질문) <img src="/images/integ/20150918_10.png"> <span
               class="mth_left">회원님들의 질문빈도가 가장 높은 항목들을 정리하였습니다.</span>
            <!--<span class="mth_right"><button type="button" class="btn_choice_all" onclick="location.href='/cs/faq/all'" style="cursor:pointer">전체보기</button></span>-->
         </caption>
      </table>
      <table class="faq_table">
         <colgroup>
            <col width="70px;">
            <col width="150px;">
            <col width="">
         </colgroup>
         <tbody>
            <tr>
               <td>1</td>
               <td>경매이용안내</td>
               <td class="subject">
                  <a href="javascript:void(0)" rel="#a34370">
                     <span class="question" id="q34370">경매시간이 자동연장이됩니다.</span>
                  </a>
                  <div id="a34370" style="display: none;" class="answer">
                     <p><b><span style="font-family: Batang, 바탕; font-size: 12pt;">자동연장:&nbsp;</span>
                          <span style="color: rgb(119, 119, 119); font-family: Batang, 바탕; font-size: 12pt;">
                           경매가 완료되기 직전에 입찰을 하였을 경우 경매종료시간이 지나더라도 마지막 입찰 이후 5초의 경매시간을 연장합니다.</span>
                     </b></p>
                     <p style="text-align: left;">
                        <img src="http://heyprice.co.kr/board/9982f2c2cbfe10e8eb66acb70be762ab.JPG" class="tx-daum-image" style="clear: none; float: none;">
                     </p>
                  </div>
               </td>
            </tr>
            <tr>
               <td>2</td>
               <td>상품 등록</td>
               <td class="subject">
                  <a href="javascript:void(0)" rel="#a34362">
                     <span class="question" id="q34362">상품 등록 후 승인 절차안내</span>
                  </a>
                  <div id="a34362" style="display: none;" class="answer">
                     <p>1.웹페이지에 상품 등록 후 본사로 등록하신 상품을 배송합니다.</p>
                     <p>2.본사에서 배송하신 상품을 확인 후 관리자 승인하면 상품등록이 완료됩니다.</p>
                     <p>3.등록 완료 후 3일 이후 자동으로 시드 참여시작 합니다.</p>
                  </div>
               </td>
            </tr>
            <tr>
               <td>3</td>
               <td>계좌 거래 내역</td>
               <td class="subject">
                  <a href="javascript:void(0)" rel="#a34335">
                     <span class="question" id="q34335">계좌 거래 내용 중 보여주고 싶지 않는 정보가 있어요.</span>
                  </a>
                  <div id="a34335" style="display: none;" class="answer">
                     <p>계좌 거래 내용 중 보여주고 싶지 않은 거래 내용은 숨김처리를 할 수 있습니다.</p>
                     <p>숨김처리한 거래내용은 관리자에게 문의하면 거래내용을 확인 할 수 있습니다.</p>
                  </div>
               </td>
            </tr>
            <tr>
               <td>4</td>
               <td>경매등록안내</td>
               <td class="subject">
                  <a href="javascript:void(0)" rel="#a34323">
                     <span class="question" id="q34323">상품 등록 승인이 안되요.</span>
                  </a>
                  <div id="a34323" style="display: none;" class="answer">
                     <p>상품 등록 시 기재정보와 보내주신 상품이 다를 경우,</p>
                     <p>혹은 상품 보존 상태가 경매에 적합하지 않을 경우</p>
                     <p>관리자의 권한으로 상품등록 승인 처리를 해주지 않습니다.</p>
                  </div>
               </td>
            </tr>
            <tr>
               <td>5</td>
               <td>경매이용안내</td>
               <td class="subject">
                  <a href="javascript:void(0)" rel="#a34041">
                     <span class="question" id="q34041">경매 진행절차</span>
                  </a>
                  <div id="a34041" style="display: none;" class="answer">
                     <p>1.상품 등록 후 승인이 완료되면 3일 후 부터 자동으로 시드참여인원을 받습니다.</p>
                     <p>2.시드참여하여 시드를 부여받는 회원은 소액의 보증금을 마일리지에서 지불합니다.(이 보증금은 경매 종료시 환불됩니다.)</p>
                     <p>3.경매가 시작되면 시드참여가 불가능합니다.</p>
                     <p>4.경매가 종료되고 낙찰 상품이 판매자에게 배송되고 최종 구매 여부를 확인합니다. 
                     <p>5.구매확인이 되면 낙찰된 회원이 가지고 있는 마일리지를 판매자에게 자동이체 됩니다.</p>
                  </div>
               </td>
            </tr>
         </tbody>
      </table>
      </li>
     </ul>

   <script type="text/javascript">
   
   $('.subject a').on('click', function(e){
      e.preventDefault();
      $('.answer').hide();
      $('.question').css({"font-weight":"normal"});
      $($(this).attr('rel')).show();
      var index = $('.subject a').index($(this));
      $('.question').eq(index).css({"font-weight":"bold"});
   });
   </script>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>