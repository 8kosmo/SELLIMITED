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
                  <a href="/testview/cashCharge.jsp"><button type="button" class="juliet" ><img src="/images/integ/20150918_03.png">캐시충전</button></a>
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
      	<form action="/account/accountCharge.sf" name="order_frm" id="order_frm" method="post" accept-charset="utf-8">
      	 <input type="hidden" name="mem_id" value="<%=mem_id%>"/>
      	 <input type="hidden" name="acct_number" value="<%=acct_number%>"/>
      		<table class="mypage_table_head">
      			<caption>
					캐시충전 <img src="/images/integ/20150918_10.png"> <span class="mth_left">무통장 또는 신용카드를 이용하여 결제하실 수 있습니다.</span><span class="mth_right"></span>
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
							<th>충전(결제)금액</th>
							<td><input type="text" class="input_rebill" name="trade_ammount" maxlength="30" value="0">
							<p><button type="button" class="scotch" style="cursor:pointer" onclick="cash_input_add(10000)">1만</button><button type="button" class="scotch" style="cursor:pointer" onclick="cash_input_add(50000)">5만</button><button type="button" class="scotch" style="cursor:pointer" onclick="cash_input_add(100000)">10만</button><button type="button" class="scotch" style="cursor:pointer" onclick="cash_input_add(200000)">20만</button><button type="button" class="scotch" style="cursor:pointer" onclick="cash_input_add(300000)">30만</button><button type="button" class="scotch" style="cursor:pointer" onclick="cash_input_add(500000)">50만</button><button type="button" class="scotch" style="cursor:pointer" onclick="cash_input_add(1000000)">100만</button><button type="button" class="scotch" style="cursor:pointer" style="color:#ED564D;" onclick="cash_zero()">정정</button></p>
							</td>
						</tr>
						<tr>
							<th>결제방법 선택</th>
							<td><input type="radio" name="pay_method" value="4" checked="checked"> 무통장<input type="radio" style="margin-left:20px;" name="pay_method" value="2"> 신용카드</td>
						</tr>
						<tr class="select_bank" style="display:">
							<th>입금은행</th>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td style="border-bottom:none;padding:0" class="select_bank">
											<div id="select_boxstyle" style="margin:0;">
												<label for="color"></label>								
													<select name="user_bank" id="user_bank" class="selbox_tr" >
														<option value="농협">농협은행</option>
														<option value="신한">신한은행</option>
														<option value="국민">국민은행</option>
														<option value="우리">우리은행</option>
														<option value="하나">하나은행</option>
														<option value="기업">기업은행</option>
														<option value="외환">외환은행</option>
														<option value="수협">수협은행</option>
														<option value="대구">대구은행</option>
														<option value="부산">부산은행</option>
														<option value="경남">경남은행</option>
														<option value="우체국">우체국</option>
													 </select>
											</div>
											입금자명 <input type="text" name="LGD_ACCOUNTOWNER" id="LGD_ACCOUNTOWNER" class="input_name">
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr class="select_bank" style="display:">
							<th style="border-bottom:none;padding:12px 0;">현금영수증</th>
							<td style="border-bottom:none;">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">
									<tr>
										<td style="border-bottom:none;padding:0" class="select_bank">
											<span style="display:none">
												<div id="select_box" style="margin:0;">
													<label for="color"></label>
													<select name="LGD_CASHRECEIPTUSE" id="LGD_CASHRECEIPTUSE" class="selbox_tr" >
														<option value="0">미발행</option>
														<option value="1">소득공제</option>
														<option value="2">지출증빙</option>
													</select>
												</div>
												<input type="text" name="LGD_CASHCARDNUM" id="LGD_CASHCARDNUM" class="input_name"> 공제받을 번호를 숫자만 입력 해 주세요. 
											</span>
											캐시는 구매건에 사용되는 금액임으로 캐시충전 항목으로의 현금영수증 발행은 불가합니다.
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr class="select_card" style="display:none">
							<th>카드종류</th>
							<td>
								<table width="100%" border="0" cellspacing="0" cellpadding="0">								
									<tr>
										<td width="100%" style="border-bottom:none;padding:0" class="select_card">
										<div id="select_boxstyle" style="margin:0;">
											<label for="color"></label>										
											<select name="LGD_CARDTYPE" id="LGD_CARDTYPE" class="selbox_tr" >
												<option value="XX">선택</option>
												<option value="11">국민</option>
												<option value="21">외환</option>
												<option value="31">비씨</option>
												<option value="41">신한</option>
												<option value="51">삼성</option>
												<option value="61">현대</option>
												<option value="71">롯데</option>
												<option value="91">NH</option>
												<option value="36">씨티</option>
												<option value="32">하나</option>
												<option value="33">우리</option>
												<option value="42">제주</option>
												<option value="34">수협</option>
												<option value="35">전북</option>
												<option value="46">광주</option>
												<option value="37">우체국체크</option>
												<option value="38">MG새마을체크</option>
												<option value="39">저축은행체크</option>
												<option value="62">신협체크</option>
												<option value="30">KDB산업은행</option>
												<option value="15">카카오뱅크</option>
											</select>
										</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
						<tr class="select_card" style="display:none">
							<th style="border-bottom:none;padding:12px 0;">할부적용</th>
							<td style="border-bottom:none;">
								<table width="100%" border="0" cellspacing="0" cellpadding="0">								
									<tr>
										<td width="100%" style="border-bottom:none;padding:0" class="select_card">
											<div id="select_boxstyle" style="margin:0;">
												<label for="color"></label>
												<select name="LGD_INSTALL" class="selbox_tr" >
													<option value="0">일시불</option>
													<option value="2">2개월</option>
													<option value="3">3개월</option>
													<option value="4">4개월</option>
													<option value="5">5개월</option>
													<option value="6">6개월</option>
													<option value="7">7개월</option>
													<option value="8">8개월</option>
													<option value="9">9개월</option>
													<option value="10">10개월</option>
													<option value="11">11개월</option>
													<option value="12">12개월</option>
												</select>
											</div>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
					</td>
					<td style="vertical-align:middle;">
						<span id="credit_ok">
							<button class="ireland" style="cursor:pointer" onclick="document.getElementById('order_frm').submit()">
							<img src="/images/integ/20150923_03.png">결제하기</button>
						</span>
					</td>
				</tr>
      		</table>
     	</form>
     </ul>
     <script type="text/javascript">
	     function cash_input_add(price)
	     {
	     	$('input[name=trade_ammount]').val(price);
	     	$('input[name=trade_ammount]').focus();
	     }
	     
	     function cash_zero()
	     {
	     	if($(":input:radio[name=pay_method]:checked").val() == 2 || $(":input:radio[name=pay_method]:checked").val() == 3 ) {
	     		alert('카드 결제시 수동 입력 하실수 없습니다.');
	     		return false;
	     	}
	     	else{
	     		$('input[name=trade_ammount]').val('');
	     		$('input[name=trade_ammount]').focus();
	     	}
	     }
	     
	 	 // 결제 수단 선택 표시
	     $('input[name=pay_method]').click(function() {
	     	
	     	var chk_type = $(this).val();

	     	var credit_method = $('#credit_method').val();
	     	if(credit_method == 2) {
	     		if (chk_type == 4) {
	     			$('input[name=trade_ammount]').val('');
	     			$('input[name=trade_ammount]').attr("readonly", false);
	     		}else{
	     			$('input[name=trade_ammount]').val('');
	     			$('input[name=trade_ammount]').attr("readonly", true);
	     		}

	     	}else{

	     		if(chk_type == 4) {
	     			$('input[name=trade_ammount]').val('');
	     			$('input[name=trade_ammount]').attr("readonly",false);
	     			$('.select_card').hide();
	     			$('.select_bank').show();

	     		} else if(chk_type == 2) {
	     			$('input[name=trade_ammount]').val('');
	     			$('input[name=trade_ammount]').attr("readonly",true);
	     			$('.select_bank').hide();
	     			$('.select_card').show();

	     		} else if(chk_type == 3) {
	     			$('input[name=trade_ammount]').val('');
	     			$('input[name=trade_ammount]').attr("readonly",true);
	     			$('.select_bank').hide();
	     			$('.select_card').show();

	     		} else {
	     			$('input[name=trade_ammount]').val('');
	     			$('input[name=trade_ammount]').attr("readonly",false);
	     			$('.select_card').hide();
	     			$('.select_bank').show();
	     		}
	     	}
	     });
	 	 
	 	 //결제버튼 눌렀을시
	     $('#order_frm').submit(function(){
	    		execPay($(this));
	    		return false;
	     });
	 	 
	     function execPay($form)
	     {
	     	var $pay_method = $('input[name=pay_method]:checked');
	     	var price = $('input[name=trade_ammount]').val();

	     	if(price <= 0) {
	     		alert('충전 금액을 선택하셔야 합니다.');
	     		$('input[name=trade_ammount]').focus();
	     		return false;
	     	}
	     /* 	if ($pay_method.val() == 1)
	     		//popup = window.open("", "payment_popup", "width=500,height=680,scroll=no,help=no,toolbar=no,resizable=no,status=yes");
	     	if ($pay_method.val() == 2 || $pay_method.val() == 3 )	// 다날 휴대폰, 신용카드, 계좌이체)
	     		popup = window.open("", "payment_popup", "width=520,height=380,scroll=no,help=no,toolbar=no,resizable=no,status=yes"); */
	     	

	     	var credit_method = $('#credit_method').val();
	     	if(credit_method != 2) {

	     		if($(':radio[name="pay_method"]:checked').val() == 2){
	     			if($('#LGD_CARDTYPE').val() == 'XX' || $('#LGD_CARDTYPE').val() == ''){
	     				alert('결제하실 카드종류를 선택 해 주세요.');
	     				return false;
	     			}
	     		}else{
	     			if($('#LGD_BANKCODE').val() == 'XX' || $('#LGD_BANKCODE').val() == ''){
	     				alert('입금은행을 선택 해 주세요.');
	     				return false;
	     			}
	     			if($('#LGD_ACCOUNTOWNER').val() == ''){
	     				alert('입금자명을 입력 해 주세요.');
	     				return false;
	     			}
	     		}
	     	}
	     }
     </script>
    </div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>








