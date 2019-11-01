<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.HashMap" %>
<%@ page import="java.util.Calendar, java.text.SimpleDateFormat,java.util.Date" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>충전완료</title>
<%@ include file="/common/cssJs.jsp" %>
</head>
<body>
<%
   Map<String,Object> rMap = 
         (Map<String,Object>)request.getAttribute("rMap");

   Calendar cal = Calendar.getInstance();
   int year = cal.get(Calendar.YEAR);
   int month = cal.get(Calendar.MONTH);
   int day = cal.get(Calendar.DAY_OF_MONTH)+3;
   int hour = cal.get(Calendar.HOUR_OF_DAY);
   
   String time = Integer.toString(year)+"년 "
              +Integer.toString(month+1)+"월 "
              +Integer.toString(day)+"일 "
              +Integer.toString(hour)+"시"; 

   Map<String,Object> bankMap = new HashMap<String,Object>();
   bankMap.put("농협","30059753684");
   bankMap.put("신한","20076743654");
   bankMap.put("국민","9102654357");
   bankMap.put("우리","1002657347");
   bankMap.put("하나","62172253371");
   bankMap.put("기업","11012571570");
   bankMap.put("외환","70012543571");
   bankMap.put("수협","110865472365");
   bankMap.put("대구","910124753577");
   bankMap.put("부산","211055789511");
   bankMap.put("경남","22023366671");
   bankMap.put("우체국","10433542275");
   
   String ourBank = rMap.get("user_bank").toString();
   
%>

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
      <li style="margin-bottom:20px">
         <form action="#" name="order_frm" id="order_frm" method="post" accept-charset="utf-8">
            <table class="mypage_table_head">
            <caption>
               캐시충전 <img src="/images/integ/20150918_10.png"> 
               <span class="mth_left">캐시충전 가상계좌 발행이 완료 되었습니다.</span><span class="mth_right"></span>
            </caption>
         </table>
         <table class="order_settle_table_body" style="border-top:1px solid #C6C6C6;">
            <colgroup>
               <col width="72.3%;" />
               <col width="27.7%;" />
            </colgroup>
            <tr>
               <td>
                  <table class="rebill_table">
                     <colgroup>
                        <col width="20%;" />
                        <col width="" />
                     </colgroup>
                     <tr>
                        <th>입금 은행</th>
                        <td><%=rMap.get("user_bank") %></td>
                     </tr>
                     <tr>
                        <th>입금 계좌번호</th>
                        <td><%= bankMap.get(ourBank) %></td>
                     </tr>
                     <tr>
                        <th>입금액</th>
                        <td><%=rMap.get("trade_ammount") %> 원</td>
                     </tr>
                     <tr>
                        <th>예금주</th>
                        <td>(주)SellLimited</td>
                     </tr>
                     <tr>
                        <th>입금기한</th>
                        <td><strong><%= time %></strong> 까지 입금하세요.</td>
                     </tr>
                  </table>
               </td>
            </tr>
         </table>
         </form>
      </li>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>