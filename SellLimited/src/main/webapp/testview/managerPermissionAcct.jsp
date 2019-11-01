<%@page import="java.awt.print.Printable"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@page import="com.sellfeed.util.PageBar"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
   List<Map<String,Object>> acctStatusList = 
         (List<Map<String,Object>>)request.getAttribute("accountStatusList");
   int size = 0;
   if(acctStatusList != null && acctStatusList.size()>0){
      size = acctStatusList.size();
   }  
   /* 페이지네이션 추가 */
   int numPerPage = 10;
   int nowPage = 0;
   if(request.getParameter("nowPage")!=null){
      nowPage = Integer.parseInt(request.getParameter("nowPage"));
   }

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8"">
<title>관리자페이지</title>
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
         <caption>충전 대기 회원 목록 <img src="/images/integ/20150918_10.png"> 
            <span class="mth_left">총 <strong><%=size %></strong> 건의 자료가 조회되었습니다.</span>
         </caption>
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
            <col width="130px;">
            <col width="130px;">
            <col width="130px;">
            <col width="80px;">
            <col width="80px;">
            <col width="80px;">
         </colgroup>
         <tbody>
            <tr>
               <td>충전코드</td>
               <td>아이디</td>
               <td>충전금액</td>
               <td>입금은행</td>
               <td>계좌번호</td>
               <td>신청일자</td>
               <td>입금일자</td>
               <td>처리일자</td>
               <td>상태</td>
               <td>승인</td>
               <td>거절</td>
            </tr>
      </table>
<%
   if(size > 0){
      
%>
       <table class="mypage_table">
         <colgroup>
            <col width="80px;">
            <col width="80px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
            <col width="130px;">
            <col width="130px;">
            <col width="130px;">
            <col width="60px;">
            <col width="80px;">
            <col width="80px;">
         </colgroup>
<%
      for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
          if(size==i) break;
           Map<String,Object> rMap = acctStatusList.get(i);
%>
            <tr>
               <td><%=rMap.get("CHARGE_CODE") %></td>
               <td><%=rMap.get("MEM_ID") %></td>
               <td><%=rMap.get("TRADE_AMMOUNT") %></td>
               <td><%=rMap.get("USER_BANK") %></td>
               <td><%=rMap.get("ACCT_NUMBER") %></td>
               <td><%=rMap.get("APPLY_DATE") %></td>
               <td><%=rMap.get("DEPOSIT_DATE") %></td>
               <td><%=rMap.get("APPROVAL_DATE") %></td>
               <td><%=rMap.get("STATUS") %></td>
               <td>
               <button
               onclick="location.href='/account/managerPermissionAcct.sf?charge_code=<%=rMap.get("CHARGE_CODE") %>&mem_id=<%=rMap.get("MEM_ID") %>&trade_ammount=<%=rMap.get("TRADE_AMMOUNT") %>'">충전승인
               </button>
               </td>
               <td>
               <button onclick="location.href='/account/managerRefuseAcct.sf?charge_code=<%=rMap.get("CHARGE_CODE") %>'">충전거절</button></td>
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
                  String pagePath = "/account/accountStatusList.sf?";
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