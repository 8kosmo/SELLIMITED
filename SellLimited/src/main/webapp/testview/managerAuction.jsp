<%@page import="java.awt.print.Printable"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.sellfeed.util.PageBar"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   List<Map<String,Object>> rList = 
         (List<Map<String,Object>>)request.getAttribute("rList");
   int size = 0;
   if(rList != null && rList.size()>0){
      size = rList.size();
   }
   /* 페이지네이션 추가 */
   int nowPage = 0;
   int numPerPage = 10;
   if(request.getParameter("nowPage")!=null){
	      nowPage = Integer.parseInt(request.getParameter("nowPage"));
	   }
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자페이지</title>
 <!-- jQuery CDN-->
<script
  src="https://code.jquery.com/jquery-1.9.0.js"
  integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM="
  crossorigin="anonymous"></script>
<!-- Web socket CDN -->
<script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<%@ include file="/common/cssJs.jsp" %>
<script type="text/javascript">
	function startAuction(bid_code, item_code, auct_period){
		alert("startAuction 함수호출 성공"+bid_code+"/"+item_code+"/"+auct_period);
		let sock = new SockJS('/echo?roomCreate:'+bid_code);
		location.href="/auction/auctionIns.sf?bid_code="+bid_code+"&item_code="+item_code+"&auct_period="+auct_period;
	};

</script>
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
               <td class="mtt_center">관리자 페이지
                  <p>닉네임 : <span class="mttid"><%=mem_name %></span></p>
               </td>
            </tr></tbody>
         </table>
      </li>
<!-- 나중에 관리자 페이지에서 관리 목록이 생기면 추가할 카테고리 -->
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
               <td>
               		<p><a href="/product/itemStatusList.sf">시드등록 관리</a></p>
               </td>
               <td>
               		<p><a href="/auction/beforeAuctionList.sf">경매등록 관리</a></p>
               </td>
               <td>
               		<p><a href="/account/accountStatusList.sf">충전 관리</a></p>
               </td>
               <td>
               		<p><a href="/auction/endAuctionList.sf">경매결산 관리</a></p>
               </td>
               <td>
               		<p><a href="/testview/memberUpd.jsp">회원관리</a></p>
               </td>
            </tr></tbody>
         </table>
      </li>
        <li>
      <table class="mypage_table_head">
         <caption>경매등록 관리 <img src="/images/integ/20150918_10.png"> 
            <span class="mth_left">총 <strong><%=size %></strong> 건의 자료가 조회되었습니다.</span>
         </caption>
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="100px;">
            <col width="80px;">
            <col width="80px;">
            <col width="130px;">
            <col width="130px;">
            <col width="130px;">
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
            <col width="100px;">
            <col width="100px;">
         </colgroup>
         <tbody>
            <tr>
               <td>상품코드</td>
               <td>경매코드</td>
               <td>시드참여 수</td>
               <td>아이디</td>
               <td>소분류코드</td>
               <td>상품이름</td>
               <td>모델명</td>
               <td>경매기간</td>
               <td>즉시구매가</td>
               <td>경매시작가격</td>
               <td>이미지</td>
               <td>경매 승인</td>
               <td>경매 비승인</td>
            </tr>
      </table>
<%
   if(size > 0){
      
%>
       <table class="mypage_table">
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="100px;">
            <col width="80px;">
            <col width="80px;">
            <col width="130px;">
            <col width="130px;">
            <col width="130px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
            <col width="100px;">
            <col width="100px;">
         </colgroup>
<%
      for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
          if(size==i) break;
           Map<String,Object> rMap = rList.get(i);
%>
            <tr>
               
               <td><%=rMap.get("ITEM_CODE") %></td>
               <td><%=rMap.get("BID_CODE") %></td>
               <td><%=rMap.get("CNTSEED") %></td>
               <td><%=rMap.get("MEM_ID") %></td>
               <td><%=rMap.get("SUB_CATEGORY_CODE") %></td>
               <td><%=rMap.get("PRODUCT_NAME") %></td>
               <td><%=rMap.get("MODEL_NAME") %></td>
               <td><%=rMap.get("AUCT_PERIOD") %></td>
               <td><%=rMap.get("BUYNOW_PRICE") %></td>
               <td><%=rMap.get("START_PRICE") %></td>
               <td><%=rMap.get("PHOTO_NAME") %>
               <td>
               <button onclick="javascript: startAuction('<%=rMap.get("BID_CODE") %>','<%=rMap.get("ITEM_CODE") %>','<%=rMap.get("AUCT_PERIOD")%>')" type="button">경매 승인</button></td>
               <td><a href="/account/managerRefuseAcct.sf?charge_code=<%=rMap.get("CHARGE_CODE") %>"><button type="button">경매 비승인</button></a></td>
            </tr>
<%
      }
%>
         </tbody>
      </table>
     
<%
   } else{
%>
       <table class="mypage_table">
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
            <col width="">
            <col width="80px;">
            <col width="80px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
         </colgroup>
         <tbody>
            <tr>
               <td height="200" colspan="11">관리자의 승인 대기 중 상품이 존재 하지 않습니다.</td>
            </tr>
         </tbody>
      </table>
   </li>
<%
   }
%>
   <li class="paging"><table border="0" cellpadding="0"
         cellspacing="0" class="paging_comm" align="center"
         style="margin: 0 auto;">
         <tbody>
            <tr>
               <td>
<%
                  String pagePath = "/auction/beforeAuctionList.sf?";
                  PageBar pb = new PageBar(10,size,nowPage,pagePath);
                  String pagination = pb.getPageBar();
                  out.print(pagination);
%>
            </tr>
         </tbody>
      </table>
      </li>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>