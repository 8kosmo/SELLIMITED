<%@page import="com.sellfeed.util.PageBar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	String mem_name = null;
	int nowBalance = 0;
	String mem_id = null;
	String acct_number = null;
	 if (session.getAttribute("mem_name") == null 
	       ||session.getAttribute("nowBalance") == null) {
	 }else{
	     mem_name = (String)session.getAttribute("mem_name");
	     nowBalance = (int)session.getAttribute("nowBalance");
	     mem_id = (String)session.getAttribute("mem_id");
	     acct_number = (String)session.getAttribute("acct_number");
	 }
//경매진행중 리스트
	List<Map<String,Object>> itemStatusAuctionList =
		(List<Map<String,Object>>)request.getAttribute("itemStatusAuctionList");
	int totalsize1 = 0;
	if(itemStatusAuctionList != null && itemStatusAuctionList.size()>0){
		totalsize1 = itemStatusAuctionList.size();
	}
	/* 페이지네이션 추가 */
	int numPerPage1 = 15; 
	int nowPage1 = 0;
	if(request.getParameter("nowPage1")!=null){
		nowPage1 = Integer.parseInt(request.getParameter("nowPage1"));
	}
%>
			<!-- 실제 상품들 나오기 시작하는 부분 전체 -->
			<td id="contents2" style="display: table-cell;">
				<!-- 총 상품, 몇개씩 상품볼건지 콤보박스 부분 -->
				총<strong><%=totalsize1 %></strong>개의 상품이 검색 되었습니다.
				<!-- 상품박스들 전체-->
				<!-- 여기안에 리스트들을 반복처리로 html코드로 찍어서 뿌려야 한다.-->
				<div id="itemStatusSeedList" class="twice" style="text-align:left;">
					<!-- 상품 한 줄 -->
					<!-- 상품 5개에 한번씩 반복 -->
					<ul>
						<!-- <span class="chaeyoung"> -->
							<!-- 상품 한 개 -->
<%
				if(totalsize1>0){
					for(int i=nowPage1*numPerPage1;i<(nowPage1*numPerPage1)+numPerPage1;i++){
						if(totalsize1 == i) break;
						Map<String, Object> rMap = itemStatusAuctionList.get(i);
%>
						<li class="once">
							<div class="sana" alt="0">
								<ul class="yhauc_mets" alt="0">
									<!-- 목록의 사진, 누르면 페이시 새로운창 이동 -->
									<li class="sana_thumb">
										<div class="mosaic-block bar">
											<div class="mosaic-backdrop zt_mom" style="background-color: white; display: block;">
												<table border="0" height="182" width="182" cellpadding="0" cellspacing="0">
													<tbody>
														<tr>
															<td align="center">
																<a href="/product/productDetail.sf?bid_code=<%=rMap.get("BID_CODE") %>&status=auction&item_code=<%=rMap.get("ITEM_CODE") %>" target="_blank">
																	 <img src="//192.168.0.187:8080/itemPhoto/<%=rMap.get("PHOTO_NAME") %>">
																</a>
															</td>
														</tr>
													</tbody>
												</table>
											</div>
										</div>
									</li>
									<!-- 목록의 버튼들 -->
									<li class="sana_btns">
										<span class="mb_view">시드<strong><%=rMap.get("BIDDER_COUNT") %>명</strong></span>
										<span class="mb_btns">
											<a href="#null" ><img src="/images/integ/20151029_08.png"></a>
											<a href="javascript:addFavProduct('<%=rMap.get("BID_CODE") %>','<%=rMap.get("MEM_ID") %>','<%=mem_id %>')" ><img src="/images/integ/20151029_09.png"></a>
											<a href="/product/productDetail.sf?bid_code=<%=rMap.get("BID_CODE") %>&status=auction&item_code=<%=rMap.get("ITEM_CODE") %>" ><img src="/images/integ/magnifier.png"></a>
										</span>
									</li>
									<li class="sana_txt" style="width: 182px; word-wrap: break-word">
										<a href="/product/productDetail.sf?bid_code=<%=rMap.get("BID_CODE") %>&status=auction&item_code=<%=rMap.get("ITEM_CODE") %>" id="title_0" target="_blank"><%=rMap.get("BID_TITLE") %></a>
									</li>
									<li class="sana_nowprice"></li>
									<li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
									<li>현재 구매가 : <%=rMap.get("FINAL_PRICE") %>원</li>
									<li class="sana_saler">
										판매자 : <a href="#"><%=rMap.get("MEM_ID") %></a><br>
										남은시간 : <%=rMap.get("AUCT_ENDDATE") %>
									</li>
								</ul>
							</div>
						</li>
						<!-- </span> -->
<%
							}//end of for
						}//end of if
						else{
%>
	            <tr>
	               <td height="200" colspan="11">상품이 존재 하지 않습니다.</td>
	            </tr>
<%
				}//end of else
%>
					</ul>
				<!-- 줄사이에 간격주는거 -->
				<div style="height: 30px;"></div>
			</div>

<!-- 페이지네이션 -->
			<li class="paging">
				<table border="0" cellpadding="0" cellspacing="0" class="paging_comm" align="center"
			      style="margin: 0 auto;">
					<tbody>
		   				<tr>
			      			<td>
<%
						//String pagePath = "/product/itemStatusSeedList.sf?";
						String pagePath1 = "javascript:itemStatusAuctionList("; 
						PageBar pb1 = new PageBar(numPerPage1,totalsize1,nowPage1,pagePath1);
						String pagination1 = pb1.getPageBar1();
						out.print(pagination1);
%>
		       				</td>
		       			</tr>
			    	</tbody>
				 </table>
			 </li>