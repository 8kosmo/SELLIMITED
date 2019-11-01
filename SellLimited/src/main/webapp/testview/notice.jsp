<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
      <table class="mypage_table_head">
         <caption>
            공지사항
            <img src="/images/integ/20150918_10.png">
            <p><strong>SellLimited</strong>의 최신소식과 공지를 알려드립니다.</p>
         </caption>
      </table>
      <table class="mypage_table_head" style="margin-top:10px;">
         <colgroup>
         <col width="80px;">
         <col width="">
         <col width="180px;">
         <col width="130px;">
         </colgroup>
         <tbody>
            <tr>
            <td>번호</td>
            <td>제목</td>
            <td>작성일</td>
            <td style="background:#FBFBFB;">조회수</td>
            </tr>
         </tbody>
      </table>
      <table class="board_table">
         <colgroup>
         <col width="80px;">
         <col width="">
         <col width="180px;">
         <col width="130px;">
         </colgroup>
         <tbody>
            <tr>
               <td style="color:red;font-weight:bold;text-align:center;">공지</td>
               <td class="subject" style="text-align:left;">
                  <a href="javascript:void(0)" rel="#a66762">
                     <span class="question" id="q66762" style="margin-left:10px">오픈 기념 마일리지 대방출</span>
                  </a>
                  <div id="a66762" style="display: none;" class="answer">
                     <p>오픈 기념으로 19년12월31일 까지 회원가입 하시는 모든 회원님에게 10,000마일리지를
                     <br>지급해 드립니다. 많은 이용 부탁드립니다.
                     <br>저희 사이트 이용 방법은 메인 페이지 우측상단에 있습니다.
                  </div>
               </td>
               <td>2019-08-19</td>
               <td>33</td>
            </tr>   
         </tbody>
      </table>
   </li>
   <li class="paging">
      <table border="0" cellpadding="0" cellspacing="0" class="paging_comm" align="center" style="margin: 0 auto;">
         <tbody>
            <tr>
               <td>
                  <a href="#" title="이전" class="btn_page btn_prev"> </a>
                  <a href="#" title="page 1" class="btn_page _current">1</a>
                  <a href="#" title="다음" class="btn_page btn_next"> </a>
               </td>
            </tr>
         </tbody>
      </table>
   </li>
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
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>