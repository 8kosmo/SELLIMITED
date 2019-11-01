<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품등록</title>
<%@ include file="/common/cssJs.jsp" %>
</head>

<script>
	function cancel(){
	var product_name = $("#product_name").val();
	alert(product_name);
	}
</script>
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
      <!-- 공통부분 끝 -->
      <form action="/product/productIns.sf" accept-charset="utf-8" 
      	id="memberUpdForm" name="memberUpdForm" method="post"
      	enctype="multipart/form-data">
      <input type="hidden" name="mem_id" value="<%=mem_id%>"/>
      <li>
      	<table class="mypage_table_head">
      		<caption>
      			상품 등록 <img src="/images/integ/20150918_10.png">
      			<p>안녕하세요! 한정판 물품 경매대행 공식사이트 SellLimited 입니다.<br>
				SellLimited는 회원님의 개인정보를 신중하게 보호하려 노력하고 있으며, 회원님의 동의없이 정보가 유출되지 않습니다. 자세한 내용은 '개인정보취급방침'에서 확인해 주십시오.</p>
      		</caption>
      	</table>
      	<table class="indiv_table">
      		<colgroup>
				<col width="20%;" />
				<col width="" />
			</colgroup>
			<tr>
				<th>상품명</th>
				<td><input type="text" class="input_name" id="product_name" name="product_name"  maxlength="30" required="true"/></td>
			</tr>
			<tr>
				<th>브랜드</th>
				<td><input type="text" class="input_name" id="brand" name="brand" maxlength="30"/></td>
			</tr>
			<tr>
				<th>모델명</th>
				<td><input type="text" class="input_name" name="modelname" value=""  maxlength="30"/></td>
			</tr>
			<tr>
				<th>대분류</th>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="border-bottom:none;padding:0" class="select_bank">
								<div id="select_boxstyle" style="margin:0;">
									<label for="color"></label>								
									<select name="main_catagory_name" id="main_catagory_name" class="selbox_tr" >
										<option value="1">선택안함</option>
										<option value="2">패션</option>
										<option value="3">카메라</option>
										<option value="4">악기</option>
										<option value="5">키덜트</option>
										<option value="6">연예인 굿즈</option>
										<option value="7">골동품</option>
										<option value="8">게임</option>
										<option value="9">음반</option>
									</select>
								</div>
							</td>
						</tr>
					</table>
			</tr>
			<tr>
				<th>소분류</th>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="border-bottom:none;padding:0" class="select_bank">
								<div id="select_boxstyle" style="margin:0;">
									<label for="color"></label>								
									<select name="sub_catagory" id="sub_catagory" class="selbox_tr" >
										<option value="1">선택안함</option>
										<option value="0101">신발</option>
										<option value="0102">모자</option>
										<option value="0103">시계</option>
										<option value="0201">필름카메라</option>
										<option value="0202">DSLR</option>
										<option value="0203">미러리스</option>
										<option value="0301">바이올린</option>
										<option value="0302">피아노</option>
										<option value="0303">일렉기타</option>
										<option value="0401">피규어</option>
										<option value="0402">프라모델</option>
										<option value="0403">만화책</option>
										<option value="0501">사인물품</option>
										<option value="0502">애장품</option>
										<option value="0503">기타</option>
										<option value="0601">동전</option>
										<option value="0602">우표</option>
										<option value="0603">기타</option>
										<option value="0701">게임기</option>
										<option value="0702">게임팩</option>
										<option value="0703">기타</option>
										<option value="0801">국내</option>
										<option value="0802">해외</option>
										<option value="0803">기타</option>
									</select>
								</div>
							</td>
						</tr>
					</table>
			</tr>
			<tr>
				<td colspan="2" style="height:15px;padding:0;"></td>
			</tr>
			<tr>
				<th>경매제목</th>
				<td><input type="text" class="input_name" id="bid_title" name="bid_title"  maxlength="30" required="true"/></td>
			</tr>
			<tr>
				<th>시작가격</th>
				<td><input type="text" class="input_name" name="start_price" value=""  maxlength="30" required="true"/></td>
			</tr>
			<tr>
				<th>즉시구매가격</th>
				<td><input type="text" class="input_name" name="buynow_price" value=""  maxlength="30"/></td>
			</tr>
			<tr>
				<th>경매진행기간</th>
				<td>
					<table width="100%" border="0" cellspacing="0" cellpadding="0">
						<tr>
							<td style="border-bottom:none;padding:0" class="select_bank">
								<div id="select_boxstyle" style="margin:0;">
									<label for="color"></label>								
									<select name="auction_period" id="auction_period" class="selbox_tr" >
										<option value="0">선택안함</option>
										<option value="6">6시간</option>
										<option value="12">12시간</option>
										<option value="24">24시간</option>
										<option value="48">48시간</option>
										<option value="72">72시간</option>
									</select>
								</div>
							</td>
						</tr>
					</table>
			</tr>
			<tr>
				<td colspan="2" style="height:15px;padding:0;"></td>
			</tr>
			<tr>
				<th>상품설명</th>
				<td>
					<!-- <input type="text" id="explanation" name="explanation"  maxlength="100" style="width:500px;height:100px;"/> -->
					 <textarea style="width:500px;height:100px" maxlength="100" rows="5" id="explanation" name="explanation" >
					</textarea>
				</td>
			</tr>
			<tr>
				<th>첨부파일</th>
				<td>
					<input type="file" name="attached_file1" id="attached_file1"/>
					<input type="file" name="attached_file2" id="attached_file2"/>
					<input type="file" name="attached_file3" id="attached_file3"/>
				</td>
			</tr>
			<tr>
				<!-- <td colspan="2" class="austria"><button type="submit" class="btn_luxemberg" style="cursor:pointer">상품등록</button><button type="button" class="btn_rome" onclick="history.go(-1)" style="cursor:pointer">취소</button></td> -->
				<td colspan="2" class="austria"><button type="submit" class="btn_luxemberg" style="cursor:pointer">상품등록</button><button type="button" class="btn_rome" onclick="cancel()" style="cursor:pointer">취소</button></td>
			</tr>
      	</table>
      </li>
      </form>
     </ul>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>