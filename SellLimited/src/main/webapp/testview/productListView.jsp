<%@page import="com.sellfeed.util.PageBar"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%	
//시드참여중 리스트
	List<Map<String,Object>> itemStatusSeedList = 
		(List<Map<String,Object>>)request.getAttribute("itemStatusSeedList");
	int totalsize = 0;
	if(itemStatusSeedList != null && itemStatusSeedList.size()>0){
		totalsize = itemStatusSeedList.size();
	}
	/* 페이지네이션 추가 */
	int numPerPage = 15; 
	int nowPage = 0;
	if(request.getParameter("nowPage")!=null){
		nowPage = Integer.parseInt(request.getParameter("nowPage"));
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
	String result = null;
	String status = null;
	if(request.getParameter("sub_category")!=null){
		status = "sub_category";
		result = request.getParameter("sub_category");
	}
	if(request.getParameter("sub_category_code")!=null){
		status = "sub_category_code";
		result = request.getParameter("sub_category_code");
	}
	if(request.getParameter("keyword")!=null){
		status = "keyword";
		result = request.getParameter("keyword");
	}
	//시작가 null이면 0으로 바꿔주기
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품리스트 페이지</title>
<%@ include file="/common/cssJs.jsp" %>
<script type="text/javascript">
	function itemStatusSeedList(pageNumber) {
		$.ajax({
			method:'GET'
				,url:'/product/itemStatusSeedList.sf?nowPage='+pageNumber+'&<%=status%>=<%=result%>'
			,success:function(data){
				$("#contents1").html(data);
			}
		});
	}
	function itemStatusAuctionList(pageNumber1) {
		$.ajax({
			method:'GET'
			,url:'/product/itemStatusAuctionList.sf?nowPage1='+pageNumber1+'&<%=status%>=<%=result%>'
			,success:function(data){
				$("#contents2").html(data);
			}
		});
	}
	   /* 관심상품 등록 추가 함수 */
	var bid_code, seller_id, my_id = null;
	function addFavProduct(bid_code,seller_id,my_id){
		loginSessionCheck(my_id);
 		$.ajax({
 			 method:'GET'
 			,url:'/rest/favProductAdd.sf?fav_bidcode='+bid_code+'&mem_id='+seller_id
 			,data:'data'
 			,success:function(data){
 				alert(data);
 			}		
 		});
	}
    function loginSessionCheck(my_id){
		if(my_id==null){	
			alert("로그인이 필요합니다");
			location.href="/testview/login.jsp";
		}
	}
</script>
</head>
<body>
<%@ include file="/common/top.jsp" %>
<!-- 경매물품리스트 나오는 전체 폼테이블 -->
<div id="mypage">
<table border="0" cellpadding="0" cellspacing="0" style="margin-bottom:40px;width:1018px;">
	<tbody>
		<tr><td height="46"></td>
		</tr>
		<tr><td id="contents"><span class="omahabeach" style="color: white;background:#614190;margin-left: 1px;">시드 모집 상품</span></td>
		</tr>
		<tr>
			<!-- 실제 상품들 나오기 시작하는 부분 전체 -->
			<td id="contents1" style="display: table-cell;">
				<!-- 총 상품, 몇개씩 상품볼건지 콤보박스 부분 --><br>
				총<strong><%=totalsize %></strong>개의 상품이 검색 되었습니다.
				<!-- 상품박스들 전체-->
				<!-- 여기안에 리스트들을 반복처리로 html코드로 찍어서 뿌려야 한다.-->
				<div id="itemStatusSeedList" class="twice" style="text-align:left;">
					<!-- 상품 한 줄 -->
					<!-- 상품 5개에 한번씩 반복 -->
					<ul>
						<!-- <span class="chaeyoung"> -->
							<!-- 상품 한 개 -->
<%
				if(totalsize>0){
					for(int i=nowPage*numPerPage;i<(nowPage*numPerPage)+numPerPage;i++){
						if(totalsize == i) break;
						Map<String, Object> rMap = itemStatusSeedList.get(i);
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
																<a href="/product/productDetail.sf?bid_code=<%=rMap.get("BID_CODE") %>&status=seed&item_code=<%=rMap.get("ITEM_CODE") %>" target="_blank">
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
											<a href="/product/productDetail.sf?bid_code=<%=rMap.get("BID_CODE") %>&status=seed&item_code=<%=rMap.get("ITEM_CODE") %>" ><img src="/images/integ/magnifier.png"></a>
										</span>
									</li>
									<li class="sana_txt" style="width: 182px; word-wrap: break-word">
										<a href="/product/productDetail.sf?bid_code=<%=rMap.get("BID_CODE") %>&status=seed&item_code=<%=rMap.get("ITEM_CODE") %>" id="title_0" target="_blank"><%=rMap.get("BID_TITLE") %></a>
									</li>
									<li class="sana_nowprice"></li>
									<li style="color:red;">즉시 구매가: <%=rMap.get("BUYNOW_PRICE") %>원</li>
									<li>시드 모집 중</li>
									<li class="sana_saler">
										판매자 : <a href="#"><%=rMap.get("MEM_ID") %></a><br>
										남은시간 : <%=rMap.get("END_SEED") %>
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
			</div>
<%
				if(totalsize!=0){
%>
<!-- 페이지네이션 -->
				<!-- 줄사이에 간격주는거 -->
			<li class="paging">
				<table border="0" cellpadding="0" cellspacing="0" class="paging_comm" align="center"
			      style="margin: 0 auto;">
					<tbody>
						<tr><td height="30"/>
						</tr>
		   				<tr>
			      			<td>
<%
						//String pagePath = "/product/itemStatusSeedList.sf?";
						String pagePath = "javascript:itemStatusSeedList("; 
						PageBar pb = new PageBar(numPerPage,totalsize,nowPage,pagePath);
						String pagination = pb.getPageBar1();
						out.print(pagination);
%>
		       				</td>
		       			</tr>
			    	</tbody>
				 </table>
			 </li>
<%
				}
%>
			</td>
		</tr>
		<tr><td height="60px">&nbsp;</td>
		</tr>
<!-- 경매진행 중 리스트 -->
		<tr><td id="contents"><span class="omahabeach" style="color: white;background:#614190;margin-left: 1px;">경매 진행 상품</span></td>
		</tr>
		<tr>
			<!-- 실제 상품들 나오기 시작하는 부분 전체 -->
			<td id="contents2" style="display: table-cell;">
				<!-- 총 상품, 몇개씩 상품볼건지 콤보박스 부분 --><br>
				총<strong><%=totalsize1 %></strong>개의 상품이 검색 되었습니다.
				<!-- 상품박스들 전체-->
				<!-- 여기안에 리스트들을 반복처리로 html코드로 찍어서 뿌려야 한다.-->
				<div id="itemStatusAuctionList" class="twice" style="text-align:left;">
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
											<a href="javascript:addFavProduct('<%=rMap.get("BID_CODE")%>','<%=rMap.get("MEM_ID")%>','<%=mem_id %>')" ><img src="/images/integ/20151029_09.png"></a>
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
			</div>
<%
				if(totalsize1!=0){
%>
<!-- 페이지네이션 -->
				<!-- 줄사이에 간격주는거 -->
				<div style="height: 30px;"></div>
			<li class="paging">
				<table border="0" cellpadding="0" cellspacing="0" class="paging_comm" align="center"
			      style="margin: 0 auto;">
					<tbody>
						<tr><td height="30"/>
						</tr>
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
<%
				}
%>
			</td>
		</tr>
		<tr><td height="5px">&nbsp;</td></tr>
	</tbody>
</table> 
</div>
<%@ include file="/common/bottom.jsp" %>
</body>
</html>