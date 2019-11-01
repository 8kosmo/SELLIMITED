<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>회원탈퇴</title>
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
                     <a href="/testview/readyProductList.jsp">승인 대기 상품</a><br>
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
      <form action="#" accept-charset="utf-8" id="memberDelForm" name="memberDelForm" method="post">
      	<li>
      		<table class="mypage_table_head">
      			<caption>
				회원 탈퇴 <img src="/images/integ/20150918_10.png">
				<p>
					<span style="color:red">
					회원탈퇴 후에는 보유하고 잇는 캐시 및 입찰보증금, 적립금, 쿠폰 등을 돌려받을 수 없습니다. 또한 진행 중인 주문 건, 환불 건 등도 중단되며,<br/>
					탈퇴 전의 모든 데이터를 되살릴 수 없습니다. 회원탈퇴로 인한 손해에 대해서는 재팬스타일에서 책임지지 않습니다. (회원약관에 명시)
					</span>
				</p>
				</caption>
      		</table>
      		<table class="indiv_table">
      			<colgroup>
					<col width="20%;" />
					<col width="" />
				</colgroup>
				<tr>
					<th>아이디</th>
					<td><input type="text" class="input_name" name="uid" id="uid" placeholder="아이디"></td>
				</tr>
				<tr>
					<th>비밀번호</th>
					<td><input type="password" class="input_name" name="upwd" id="upwd" placeholder="비밀번호"></td>
				</tr>
				<tr>
					<td colspan="2" class="austria" style="border-bottom:none;">
					<input type="checkbox" name="agree_chk" id="agree_chk"/> 위 내용에 동의합니다. <br/><br/>
					<button type="button" class="btn_luxemberg" style="cursor:pointer" onclick="fnc_chk_info()">확인</button><button type="button" class="btn_rome" style="cursor:pointer" onclick="history.go(-1)">취소</button></td>
				</tr>
      		</table>
      	</li>
      </form>
     </ul>
<script type="text/javascript">
$("#uid,#upwd").keyup(function(e) {
    if (e.keyCode == 13) fnc_chk_info();        
});

function fnc_chk_info(){

	if(confirm('회원 탈퇴를 하시겠습니까?')){
		if(!$('input[name=agree_chk]').is(':checked')){
			alert('위 내용에 동의하여 주십시오.');
			$("input[name=agree_chk]").focus();
			return false;
		}

		if( $("#uid").val() == "") {
			alert('아이디를 입력 해 주세요.');
			$("#uid").focus();
			return false;
		}

		if( $("#upwd").val() == "") {
			alert('비밀번호를 입력 해 주세요.');
			$("#upwd").focus();
			return false;
		}
		
/* 		var string = $("form[name=unregister_frm]").serialize();
		$.ajax({ 
			type: "POST", 
			url: "/auth/ajax_modify_ready_chk", 
			data: string, 
			dataType: 'json',
			success: function(data){ 
				if(data.result == "_ok"){
					document.unregister_frm.submit();
				}else{
					alert(data.message);
				}
			},
			error : function() { 
				alert('Error');
			}
		}); */
	}
}
$(document).ready(function(){
	$("#uid").focus();
});
</script>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>