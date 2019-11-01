<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Map, java.util.List,java.util.StringTokenizer, java.text.*" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상세페이지</title>
<script
  src="https://code.jquery.com/jquery-1.9.0.js"
  integrity="sha256-TXsBwvYEO87oOjPQ9ifcb7wn3IrrW91dhj6EMEtRLvM="
  crossorigin="anonymous"></script>
<!-- Web socket CDN -->
<script type="text/javascript" 
src="https://cdnjs.cloudflare.com/ajax/libs/sockjs-client/1.1.5/sockjs.min.js"></script>
<%@ include file="/common/cssJs.jsp" %>
<%  // 인증된 세션이 없는경우, 해당페이지를 볼 수 없게 함.
   String mem_name = null;
   int nowBalance = 0;
   String mem_id = null;
    if (session.getAttribute("mem_name") == null 
          ||session.getAttribute("nowBalance") == null) {
    }else{
        mem_name = (String)session.getAttribute("mem_name");
        nowBalance = (int)session.getAttribute("nowBalance");
        mem_id = (String)session.getAttribute("mem_id");
    }
    
   int size = 0;
   Map<String,Object> rMap = (Map<String,Object>)request.getAttribute("rMap");
   List<String> photoNameList = (List<String>)rMap.get("PHOTO_NAME");
   request.setAttribute("photoList", photoNameList);

   //_______________________________________________타임
   DecimalFormat formatter = new DecimalFormat("###,###");
   String now_price = formatter.format(Integer.parseInt(rMap.get("NOW_PRICE").toString()));
   String start_price = formatter.format(Integer.parseInt(rMap.get("START_PRICE").toString()));
   String buynow_price = formatter.format(Integer.parseInt(rMap.get("BUYNOW_PRICE").toString()));
   String strNowBalance = formatter.format(nowBalance);
   String mybid = formatter.format(Integer.parseInt(rMap.get("my_bid").toString()));
   String fprice = formatter.format(Integer.parseInt(rMap.get("FPRICE").toString()));
   
   String T_EndTime = rMap.get("AUCT_ENDDATE").toString();
   StringTokenizer st = new StringTokenizer(T_EndTime,"/");
   String YY = st.nextToken();
   String MM = st.nextToken();
   String DD = st.nextToken();
   String HH = st.nextToken();
   String MI = st.nextToken();
   String SS = st.nextToken();
   
   String photoName  = "";
   String onclickSub = "";
   String img_id     ="";
   
   String startArray[] = rMap.get("AUCT_STARTDATE").toString().split("/");
   String endArray[] = rMap.get("AUCT_ENDDATE").toString().split("/");
   String start_date = startArray[0]+"년 "+startArray[1]+"월 "+startArray[2]+"일";
   String end_date = endArray[0]+"년 "+endArray[1]+"월 "+endArray[2]+"일";
   
%>
<script>
$(document).ready(function(){
<%   for(int i=0; i<photoNameList.size();i++){
      photoName = photoNameList.get(i).toString();
      onclickSub = "clickSub"+i+"()";
      img_id = "sub_img"+i;
         if(i==0){   
   %>
         document.getElementById("d_big_img").innerHTML = '<img id="big_img" src="//192.168.0.187:8080/itemPhoto/<%=photoName%>" style="vertical-align:middle">';
   <%      }else{
   %>
            document.getElementById("d_small_img"+<%=i%>).innerHTML =
               "<span><a onclick='javascript:<%=onclickSub%>'><img id='<%=img_id%>' src='//192.168.0.187:8080/itemPhoto/<%=photoName%>'> </a></span>";
   <%   }      
   }%>   //__________________________________________________________________end of for
});//_______________________________________________________________________end of ready

function balance(){
    if(mem_name!='null'&&mem_name!='관리자'){
       $.ajax({
            method:'GET'
           ,url:'/rest/accountBalance.sf?mem_id=<%=mem_id%>'
           ,data:'data'
           ,success:function(data){
              if(<%=nowBalance%>!=data){
                 location.reload();
              }
           }      
        });
    }
 }

function openInNewTab(url) {
        var win = window.open(url, '_blank');
        win.focus();
    }
//function buyNow
 function buyNow(){
   if(confirm('<%=rMap.get("BUYNOW_PRICE")%>원에 상품을 즉시 구매하시겠습니까?')){
      if(<%=rMap.get("BUYNOW_PRICE")%> > <%=nowBalance%>){
        //잔액이 부족할 때
         if(confirm("잔액이 부족해요. 충전하시겠어요?")){
            openInNewTab('/testview/cashCharge.jsp');
      }
   }else{
      $.ajax({
         method:'GET'
               ,url:'/rest/buyNow.sf?bid_code=<%=rMap.get("BID_CODE")%>&mem_id=<%=mem_id%>&trade_ammount=<%=rMap.get("BUYNOW_PRICE")%>'
               ,data:'data'
               ,success:function(data){
               alert(data);
               var bid_code = '<%=rMap.get("BID_CODE")%>';
               sock.send(bid_code+'?closeRoom');
               }
      });
      }
   }
}

//_________________________________________타임
function getTime(yy,mm,dd,hh,mi,ss) {
   now = new Date();
   dday = new Date(yy,mm-1,dd,hh,mi,ss); // 원하는 날짜, 시간 정확하게 초단위까지 기입.
   days = (dday - now) / 1000 / 60 / 60 / 24;
   daysRound = Math.floor(days);
   hours = (dday - now) / 1000 / 60 / 60 - (24 * daysRound);
   hoursRound = Math.floor(hours);
   minutes = (dday - now) / 1000 /60 - (24 * 60 * daysRound) - (60 * hoursRound);
   minutesRound = Math.floor(minutes);
   seconds = (dday - now) / 1000 - (24 * 60 * 60 * daysRound) - (60 * 60 * hoursRound) - (60 * minutesRound);
   secondsRound = Math.round(seconds);
   
   if(daysRound==-1 && hoursRound == 23 && minutesRound == 59 && secondsRound == 59){
      alert("경매가 종료 되었습니다.");
      window.close();
   }
   
   document.getElementById("counter0").innerHTML = daysRound;
   document.getElementById("counter1").innerHTML = (hoursRound<10 ? "0"+hoursRound:hoursRound);
   document.getElementById("counter2").innerHTML = (minutesRound<10 ? "0"+minutesRound:minutesRound);
   document.getElementById("counter3").innerHTML = (secondsRound<10 ? "0"+secondsRound:secondsRound);
   newtime = window.setTimeout("getTime(<%=YY%>,<%=MM%>,<%=DD%>,<%=HH%>,<%=MI%>,<%=SS%>);", 1000);

   }
   var mem_name = '<%=mem_name%>';
   var nowBalance = '<%=nowBalance%>';

      function logout(){
         location.href="/common/sessionDel.jsp";   
   }
   
   function clickSub1(){
      var big_img = document.getElementById("big_img");
      var sub_img1 = document.getElementById("sub_img1");
      
      var big_img_src= $("#big_img").attr('src');
      var sub_img1_src= $("#sub_img1").attr('src');
      
      big_img.src=sub_img1_src;
      sub_img1.src=big_img_src;
   }
   function clickSub2(){
      var big_img = document.getElementById("big_img");
      var sub_img2 = document.getElementById("sub_img2");
   
      var big_img_src= $("#big_img").attr('src');
      var sub_img2_src= $("#sub_img2").attr('src');
      
      big_img.src=sub_img2_src;
      sub_img2.src=big_img_src;
   }
   var cnt_bid = <%=rMap.get("CNTBID")%>;
   function bid(){
      var final_price = $("#h_final_price").html();
      var increase_rate = 0;
      var total = 0;
      if(final_price<=500000){
         increase_rate = 10000;
      }
      else if(500000<final_price){
         increase_rate = final_price/20
      }
      if(0==cnt_bid){
         total = <%=rMap.get("START_PRICE")%>;
         cnt_bid = 1;
      }else{
         total = final_price*1+increase_rate*1;
      }
         
       if(confirm("입찰가: "+total+ "\n입찰 하시겠습니까?")){
         if(total><%=nowBalance%>){
            if(confirm("잔액이 부족해요. 충전하시겠어요?")){
                openInNewTab('/testview/cashCharge.jsp');
             }
          }else{
             $.ajax({
                method:'GET'
                      ,url:'/rest/aucLogIns.sf?bid_code=<%=rMap.get("BID_CODE")%>&final_price='+total+'&mem_id=<%=mem_id%>&increase_rate='+increase_rate
                      ,data:'data'
                      ,success:function(data){
                         $("#h_my_price").html(total);
                         total = total.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                         $("#my_price").html(total);
                         sendMessage();
                      } 
             });      //_______________________________________________________________| END OF AJAX
             }
       }
      }            //_______________________________________________________________| END OF bid()
      
</script>
</head>
<body>

<div id="mypage">
   <form action="#" id="detail_frm" method="post" accept-charset="utf-8">
      <div id="dv">
         <ul class="dv_title" style="margin-top:20px;">
            <li class="dv_title_left" id="trans_after_subject" style="vertical-align:middle;height:50px;padding:0px;background-color:#614190;color:white;font-weight:bold;">
               <div style="margin:13px;"><%=rMap.get("BID_TITLE")%></div>
            </li>
            <li class="dv_title_right" style="height:50px;width:218px;background-color:#614190;color:white;">
               <div style="margin-top:24px;margin-right:13px">경매상품ID : <%=rMap.get("ITEM_CODE") %></div>
            </li>
         </ul>
         <ul>
            <li>
               <table class="dv_out_table">
                  <tr>
                     <!-- 상세페이지 네모안에 왼쪽부분전체 -->
                     <td class="dot_left" style="position:relative;">
                        <table class="dotl_in">
                           <!-- 상세페이지 네모안에 사진나오는 부분 -->
                           <tr>
                              <table class="dotl_in">
                           <!-- 상세페이지 네모안에 사진나오는 부분 -->
                           <tr>
                              <td class="dotl_in_thumb">
                                 <!-- 제일 큰 메인사진 -->
                         <div class="ditbigthumb" id="d_big_img" onclick="javascript:changePhoto(big_img)" style="line-height: 400px;">
                         </div>
                                 <!-- 밑에 조그만한 서브사진 클릭하면 메인되게 하기 -->
                                 <div class="ditsmallthumb" id="d_small_img1" style="height: 100px">
                                 </div>
                                 <div class="ditsmallthumb" id="d_small_img2" style="height: 100px">
                                 </div>
                              </td>
                           </tr>
                           <tr style="height:10px;">
                           </tr>
                           <tr>
                              <td>
                                 <!-- 제품상세설명 간단히 적는부분 -->
                                 <table class="dr_step1" style="border:1px solid #E7E7E7;">
                                    <colgroup>
                                       <col width="50%;" />
                                       <col width="50%;" />
                                    </colgroup>
                                    <tr>
                                       <td style="border-right:1px solid #E7E7E7;height:20px;font-size:15px;text-align:center;font-weight:bold;">현재 최고 입찰금액
                                       </td>
                                       <td style="height:20px;font-size:15px;text-align:center;font-weight:bold;">나의 입찰금액
                                       </td>
                                    </tr>
                                 </table>
                              </td>
                           </tr>
                           <tr>
                              <td>
                                 <!-- 제품상세설명 간단히 적는부분 -->
                                 <table class="dr_step1" style="border:1px solid #E7E7E7;">
                                    <colgroup>
                                       <col width="50%;" />
                                       <col width="50%;" />
                                    </colgroup>
                                    <tr>
                                       <td style="border-right:1px solid #E7E7E7;height:90px;text-align:center;">
                                          <p id="final_price" style="font-size:25px;margin-top:20px;"><%=fprice %></p>
                                          <p id="h_final_price" hidden="true"><%=rMap.get("FPRICE") %></p>
                                       </td>
                                       <td style="border-right:1px solid #E7E7E7;">
                                          <p id="my_price" style="font-size:25px;margin-top:20px;text-align:center;"><%=mybid%></p>
                                          <p id="h_my_price" hidden="true"><%=rMap.get("my_bid")%></p>
                                       </td>
                                    </tr>
                                 </table>
                              </td>
                           </tr>
                        </table>
                     </td>
                     <!-- 상세페이지 네모안에 오른쪽부분전체 -->
                     <td class="dot_right">
                        <!-- 입찰건수, 남은시간 나오는 부분 -->
                        <span>
                           <table class="dr_step1">
                              <colgroup>
                                 <col width="50%;" />
                                 <col width="50%;" />
                              </colgroup>
                              <tr>
                                 <td style="border-right:1px solid #E7E7E7;">참여인원<br>
                                    <p id="enterCnt" style="display:inline;"></p><p style="display:inline;"> / <%=rMap.get("SEEDCNT") %></p>
                                 </td>
                                 <td>남은시간
                <p style="font-size:20px; margin-top:5px; ">
                  <SPAN id=counter0></SPAN>일+
                  <SPAN id=counter1></SPAN>:<SPAN id=counter2></SPAN>:<SPAN id=counter3></SPAN></p>
                                 </td>
                              </tr>
                           </table>
                        </span>
                        <!-- 시작가격~종료일 나오는 부분 -->
                             <span>
                                <table class="dr_step2">
                                   <colgroup>
                                      <col width="105px;" />
                                      <col width="" />
                                   </colgroup>
                                   <tr>
                                      <th>시작가격<br> 즉시구매가<br> 시작시간<br> 종료일
                                      </th>
                                      <!-- 시작가격 -->
                                      <td><%=start_price%>원<br> 
                                      <!-- 바로구매가격 -->
                                      <%=buynow_price%>원<br> 
                                      <!-- 시작시간 -->    
                                          <%=start_date%><br>
                                      <!-- 종료일 -->
                                          <%=end_date%><br>
                                      </td>
                                   </tr>
                                </table>
                             </span>
                        <!-- 현재가격,입찰하기,관심등록 버튼부분 -->
                        <span>
                           <table class="dr_step2" style="border-top:1px solid #E7E7E7;">
                              <colgroup>
                                 <col width="120px;" />
                                 <col width="" />
                              </colgroup>
                              <tr>
                                 <th>
                                     <strong>제품정보</strong><br> 
                                     수량<br> 
                                     반품가능여부<br> 
                                     총 입찰건수<br><br>
                                     <strong>판매자정보</strong><br> 
                                     아이디<br><br>
                                     <strong>입찰자정보</strong><br>
                                     잔액
                                 </th>
                                 <td>
                                    <br>1 개<br> 
                                    반품불가<br><br><br><br>
                                    <%=rMap.get("MEM_ID") %><br><br><br>
                                    <%=strNowBalance%>원
                                 </td>
                              </tr>
                           </table>
                           <button type="button" onclick="javascript:openInNewTab('/testview/cashCharge.jsp')" class="btn_nigeria" style="width:360px;height:70px;margin-left:25px;margin-top:15px">캐시충전</button>
                        </span>
                         <!--  수량,반품가능여부,출품자정보 부분 -->
                        <span class="dotbot_all">
                           <table class="corona" style="margin-top:20px">
                              <colgroup>
                                 <col width="85px;" />
                              </colgroup>
                              <tr>
                                 <button onclick="javascript:bid()" type="button" class="btn_algerie" style="width:360px;height:70px;margin-top:3px;">입찰하기</button>
                                 <br>
                                 <button onclick="javascirpt:buyNow()" type="button" class="btn_nigeria" style="width:360px;height:70px">즉시구매</button>
                              </tr>
                           </table>
                        </span>
                     </td>
                  </tr>
               </table>
            </li>
         </ul>
      </div>
   </form>
</div>
<script type="text/javascript">
        $(document).ready(function() {
               $("#sendBtn").click(function() {
                       sendMessage();
                       $('#message').val('')
               });

               $("#message").keydown(function(key) {
                       if (key.keyCode == 13) {// 엔터
                              sendMessage();
                              $('#message').val('')
                       }
               });
        });

        // 웹소켓을 지정한 url로 연결한다.
        // 콜백함수 (커스텀)
        let sock = new SockJS('/echo?roomIn:<%=rMap.get("BID_CODE")%>');
        sock.onmessage = onMessage;
        sock.onclose = onClose;

        // 메시지 전송
        function sendMessage() {
            var bid_code = '<%=rMap.get("BID_CODE")%>';
               sock.send(bid_code+'?'+$("#h_my_price").text());
        }

        // 서버로부터 메시지를 받았을 때
        function onMessage(msg) {
               var data = msg.data;
               var result = data.split(':')[0];
               var status = data.split(':')[1];
               //몇명인지
               if(status=='enterCnt'){
                  $("#enterCnt").text(result);
               //문닫을떄
               }else if(status=='closeRoom'){
                  opener.location.href="/product/mainViewTOP6.sf";
                  window.close();
               }
               //현재 가격 
               else{
                   $("#h_final_price").text(result);
                  result = result.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ",");
                   $("#final_price").text(result);
               }
        }

        // 서버와 연결을 끊었을 때
        function onClose(evt) {
               $("#data").append("연결 끊김");
        }

</script>
   <script>getTime(<%=YY%>,<%=MM%>,<%=DD%>,<%=HH%>,<%=MI%>,<%=SS%>)</script>
   <script>balance()</script>
</body>
</html>