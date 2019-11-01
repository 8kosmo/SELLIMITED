<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관심상품목록</title>
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
         <caption>관심 상품 목록 <img src="/images/integ/20150918_10.png"> 
            <span class="mth_left">총 <strong>0</strong> 건의 자료가 조회되었습니다.</span>
            <span class="mth_right">
               <form action="#" accept-charset="utf-8" method="get" id="frm" name="frm">
                  <div id="select_boxview">
                     <label for="color">30개씩 보기</label>
                     <select name="search_limit" title="select color">
                        <option value="30" selected="selected">30개씩 보기</option>
                        <option value="50">50개씩 보기</option>
                        <option value="100">100개씩 보기</option>
                     </select>
                  </div>
               </form>
            </span>
         </caption>
         <colgroup>
            <col width="120px;">
            <col width="120px;">
            <col width="120px;">
            <col width="">
            <col width="120px;">
            <col width="120px;">
            <col width="120px;">
         </colgroup>
         <tbody>
            <tr>
               <td>상태</td>
               <td>판매자 아이디</td>
               <td>상품 이름</td>
               <td>상품 설명</td>
               <td>시작 가격</td>
               <td>즉시 구매 가격</td>
               <td>관심제외하기</td>
            </tr>
      </table>
      <table class="mypage_table">
         <colgroup>
            <col width="120px;">
            <col width="120px;">
            <col width="120px;">
            <col width="">
            <col width="120px;">
            <col width="120px;">
            <col width="120px;">
         </colgroup>
            <tr>
               <td>경매진행중</td>
               <td>johnhyeon</td>
               <td><a href="#">2080칫솔</a></td>
               <td>kosmo 52th를 함께한 2080칫솔</td>
               <td>1,000원</td>
               <td>200,000원</td>
               <td><a href="#"><button type="button">제외</button></a></td>
            </tr>
         </tbody>
      </table>
<%

%>
       <table class="mypage_table">
         <colgroup>
            <col width="120px;">
            <col width="120px;">
            <col width="120px;">
            <col width="">
            <col width="120px;">
            <col width="120px;">
            <col width="120px;">
         </colgroup>
         <tbody>
            <tr>
               <td height="200" colspan="7">관심 등록 된 상품이 존재 하지 않습니다.</td>
            </tr>
         </tbody>
      </table>
<%

%>
   </li>
   <li class="paging"><table border="0" cellpadding="0"
         cellspacing="0" class="paging_comm" align="center"
         style="margin: 0 auto;">
         <tbody>
            <tr>
               <td><a
                  href="#"
                  title="이전" class="btn_page btn_prev"> </a> <a
                  href="#"
                  title="page 1" class="btn_page _current">1</a> <a
                  href="#"
                  title="다음" class="btn_page btn_next"> </a></td>
            </tr>
         </tbody>
      </table>
      </li>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>