<%@page import="java.util.ArrayList"%>
<%@page import="java.util.Map"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
	List<Map<String,Object>> TOP6List = new ArrayList<>();
 	if(request.getAttribute("TOP6List")!=null){
		TOP6List = (List<Map<String,Object>>)request.getAttribute("TOP6List");
 	}
 	List<Map<String,Object>> auctionTOP6List = new ArrayList<>();
 	if(request.getAttribute("auctionTOP6List")!=null){
 		auctionTOP6List = (List<Map<String,Object>>)request.getAttribute("auctionTOP6List");
 	}
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta http-equiv="X-UA-Compatible" content="ie=edge">
<title>메인뷰</title>
<%@ include file="/common/cssJs.jsp" %>
<style type="text/css">

    /* container - body */
    #container { width: 1000px; margin: auto; }
    .slide_wrap { position: relative; width: 900px; margin: auto; padding-bottom: 30px; }
    .slide_box { width: 100%; margin: auto; overflow-x: hidden; }
    .slide_content { display: table; float: left; width: 300px; height: 200px; }
    .slide_content > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }
    .slide_content.slide01 { background: #ddbdff; }
    .slide_content.slide02 { background: #9fd6c2; }
    .slide_content.slide03 { background: #abe2f7; }
    .slide_content.slide04 { background: #f08c78; }
    .slide_content.slide05 { background: #fbdb65; }
    .slide_btn_box > button { position: absolute; top: 50%; margin-top: -40px ; width: 50px; height: 60px; font-size: 16px; color: #999; background: none; border: 1px solid #ddd; cursor: pointer; }
    .slide_btn_box > .slide_btn_prev { left: -60px; }
    .slide_btn_box > .slide_btn_next { right: -60px; }
    .slide_pagination { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
    .slide_pagination .dot { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
    .slide_pagination .dot.dot_active { background: #333; }
    .slide_pagination .dot a { display: block; width: 100%; height: 100%; }
    
    /*두번째 슬라이더*/
        /* container - body */
    #container1 { width: 1000px; margin: auto; }
    .slide_wrap1 { position: relative; width: 900px; margin: auto; padding-bottom: 30px; }
    .slide_box1 { width: 100%; margin: auto; overflow-x: hidden; }
    .slide_content1 { display: table; float: left; width: 300px; height: 200px; }
    .slide_content1 > p { display: table-cell; vertical-align: middle; text-align: center; font-size: 100px; font-weight: bold; color: #555; }
    .slide_content1.slide01 { background: #ddbdff; }
    .slide_content1.slide02 { background: #9fd6c2; }
    .slide_content1.slide03 { background: #abe2f7; }
    .slide_content1.slide04 { background: #f08c78; }
    .slide_content1.slide05 { background: #fbdb65; }
    .slide_btn_box1 > button { position: absolute; top: 50%; margin-top: -40px ; width: 50px; height: 60px; font-size: 16px; color: #999; background: none; border: 1px solid #ddd; cursor: pointer; }
    .slide_btn_box1 > .slide_btn_prev1 { left: -60px; }
    .slide_btn_box1 > .slide_btn_next1 { right: -60px; }
    .slide_pagination1 { position: absolute; left: 50%; bottom: 0; list-style: none; margin: 0; padding: 0; transform: translateX(-50%); }
    .slide_pagination1 .dot1 { display: inline-block; width: 15px; height: 15px; margin: 0 5px; overflow: hidden; background: #ddd; border-radius: 50%; transition: 0.3s; }
    .slide_pagination1 .dot1.dot_active { background: #333; }
    .slide_pagination1 .dot1 a { display: block; width: 100%; height: 100%; }
</style>
</head>
<body>
<%@ include file="/common/top.jsp" %>
<!-- 현영작품 -->
<table>
 <tr>
  <td>
<span align="center" style="margin-top: 50px;">
   <ul>
      <li style="height:40px;"><!-- <img src="/images/logo.png"> --></li>
      <li class="ya_best" style="width:1020px;">
         <a href="" target="_self" banner-type="img" banner-idx="5"></a>
         <img src="/images/banner/main_map_w.png" usemap="#Map4" style="margin-right:10px;">
            <map name="Map4">
               <area shape="rect" coords="0,0,284,180"
                  href="/product/productList.sf?sub_category_code=0302">
               <area shape="rect" coords="0,190,284,370"
                  href="/product/productList.sf?sub_category_code=0103">
            </map> 
         <!-- 제일 큰 사이즈 사진. 중앙 . 피규어 -->
         <a href="/product/productList.sf?sub_category=%ED%82%A4%EB%8D%9C%ED%8A%B8"
            target="_self" banner-type="img" banner-idx="6">
            <img src="/images/banner/main_big.png" style="margin-right:10px;">
         </a>
         <!-- 신발 -->
         <a id="aa" href="/product/productList.sf?sub_category_code=0101"
            target="_self" banner-type="img" banner-idx="7">
            <img src="/images/banner/main_shoes_w10.png">
         </a> 
         <!-- 카메라 -->
         <a href="/product/productList.sf?sub_category_code=0202"
            target="_self" banner-type="img" banner-idx="8">
            <img src="/images/banner/main_camera_w.png">
         </a>
      </li>
   </ul>
</span>
<!-- 현영작품 -->
  </td>
 </tr>
 <tr>
  <td align="center" style="font-size: 14px;margin-bottom: 40px;margin-top: 40px;">
  <ul style="display: table;
    width: 1016px;
    background: #ffffff;
    margin-bottom: 10px;
    margin-top: 10px;
    font-size: 20px;
    height: 30px;
    padding: 22px 30px 26px 30px;
    border-bottom: 1px solid #4C376B;">
 	<strong>시드 모집 목록 TOP6</strong>
  </ul>
  </td>
 </tr>
 <tr>
  <td>
<!-- 추가분 -->
  <div id="container">
    <div class="slide_wrap">
      <div class="slide_box">
        <div class="slide_list clearfix" style="width: 900px; transform: translate3d(-700px, 0px, 0px);">
<%
	if(TOP6List.size() > 0){
		Map<String, Object> firstMap = TOP6List.get(0);
%>
		  <div class="slide_content slide01 slide_active">
            <img width="100%" height="100%" src="//192.168.0.187:8080/itemPhoto/<%=firstMap.get("PHOTO_NAME")%>">
          </div>
<%		
		if(TOP6List.size() > 1){
			for(int i=1;i<TOP6List.size();i++){
				if(TOP6List.size()==i) break;
				Map<String, Object> rMap = TOP6List.get(i);
%>
          <div class="slide_content slide0<%=i+1%>">
            <img width="100%" height="100%" src="//192.168.0.187:8080/itemPhoto/<%=rMap.get("PHOTO_NAME")%>">
          </div>
<%
			}
		}
	}
%>
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box">
        <button type="button" class="slide_btn_prev" style="background:#614190;color: white;"><strong><</strong></button>
        <button type="button" class="slide_btn_next" style="background:#614190;color: white;"><strong>></strong></button>
      </div>
      <!-- // .slide_btn_box -->
      <ul class="slide_pagination">
         <li class="dot dot_active" data-index="0"><a href="#"></a></li>
      </ul>
      <!-- // .slide_pagination -->
    </div>
    <!-- // .slide_wrap -->
  </div>
  <!-- // .container -->
  </td>
 </tr>
 
  <tr>
  <td align="center" style="font-size: 14px;margin-bottom: 40px;margin-top: 40px;">
  <br>
    <ul style="display: table;
    width: 1016px;
    background: #ffffff;
    margin-bottom: 10px;
    margin-top: 10px;
    font-size: 20px;
    height: 30px;
    padding: 22px 30px 26px 30px;
    border-bottom: 1px solid #4C376B;">
 	<strong>경매 진행 목록 TOP6</strong>
 	</ul>
  </td>
 </tr>
  <tr>
  <td>
<!-- 추가분 -->
  <div id="container1">
    <div class="slide_wrap1">
      <div class="slide_box1">
        <div class="slide_list1 clearfix" style="width: 900px; transform: translate3d(-300px, 0px, 0px);">
<%
	if(auctionTOP6List.size() > 0){
		Map<String, Object> firstMap = auctionTOP6List.get(0);
%>
		  <div class="slide_content1 slide01 slide_active">
            <img width="100%" height="100%" src="//192.168.0.187:8080/itemPhoto/<%=firstMap.get("PHOTO_NAME")%>">
          </div>
<%		
		if(auctionTOP6List.size() > 1){
			for(int i=1;i<auctionTOP6List.size();i++){
				if(auctionTOP6List.size()==i) break;
				Map<String, Object> rMap = auctionTOP6List.get(i);
%>
          <div class="slide_content1 slide0<%=i+1%>">
            <img width="100%" height="100%" src="//192.168.0.187:8080/itemPhoto/<%=rMap.get("PHOTO_NAME")%>">
          </div>
<%
			}
		}
	}
%>
        </div>
        <!-- // .slide_list -->
      </div>
      <!-- // .slide_box -->
      <div class="slide_btn_box1">
        <button type="button" class="slide_btn_prev1" style="background:#614190;color: white;"><strong><</strong></button>
        <button type="button" class="slide_btn_next1" style="background:#614190;color: white;"><strong>></strong></button>
      </div>
      <!-- // .slide_btn_box -->
      <ul class="slide_pagination1">
         <li class="dot1 dot_active" data-index="0"><a href="#"></a></li>
      </ul>
      <!-- // .slide_pagination -->
    </div>
    <!-- // .slide_wrap -->
  </div>
  <!-- // .container -->
  </td>
 </tr>

</table>
  <script type="text/javascript">
    (function () {
      const slideList = document.querySelector('.slide_list');  // Slide parent dom
      const slideContents = document.querySelectorAll('.slide_content');  // each slide dom
      const slideBtnNext = document.querySelector('.slide_btn_next'); // next button
      const slideBtnPrev = document.querySelector('.slide_btn_prev'); // prev button
      const pagination = document.querySelector('.slide_pagination');
      const slideLen = slideContents.length;  // slide length
      const slideWidth = 300; // slide width
      const slideSpeed = 100; // slide speed
      const startNum = 0; // initial slide index (0 ~ 4)
      
      slideList.style.width = slideWidth * (slideLen + 2) + "px";
      
      // Copy first and last slide
      let firstChild = slideList.firstElementChild;
      let lastChild = slideList.lastElementChild;
      let clonedFirst = firstChild.cloneNode(true);
      let clonedLast = lastChild.cloneNode(true);

      // Add copied Slides
      slideList.appendChild(clonedFirst);
      slideList.insertBefore(clonedLast, slideList.firstElementChild);

      // Add pagination dynamically
      let pageChild = '';
      for (var i = 0; i < slideLen; i++) {
        pageChild += '<li class="dot';
        pageChild += (i === startNum) ? ' dot_active' : '';
        pageChild += '" data-index="' + i + '"><a href="#"></a></li>';
      }
      pagination.innerHTML = pageChild;
      const pageDots = document.querySelectorAll('.dot'); // each dot from pagination

      slideList.style.transform = "translate3d(-" + (slideWidth * (startNum + 1)) + "px, 0px, 0px)";

      let curIndex = startNum; // current slide index (except copied slide)
      let curSlide = slideContents[curIndex]; // current slide dom
      curSlide.classList.add('slide_active');

      /** Next Button Event */
      slideBtnNext.addEventListener('click', function() {
        if (curIndex <= slideLen - 1) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 2)) + "px, 0px, 0px)";
        }
        if (curIndex === slideLen - 1) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + slideWidth + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = -1;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === -1) ? slideLen - 1 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[++curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Prev Button Event */
      slideBtnPrev.addEventListener('click', function() {
        if (curIndex >= 0) {
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * curIndex) + "px, 0px, 0px)";
        }
        if (curIndex === 0) {
          setTimeout(function() {
            slideList.style.transition = "0ms";
            slideList.style.transform = "translate3d(-" + (slideWidth * slideLen) + "px, 0px, 0px)";
          }, slideSpeed);
          curIndex = slideLen;
        }
        curSlide.classList.remove('slide_active');
        pageDots[(curIndex === slideLen) ? 0 : curIndex].classList.remove('dot_active');
        curSlide = slideContents[--curIndex];
        curSlide.classList.add('slide_active');
        pageDots[curIndex].classList.add('dot_active');
      });

      /** Pagination Button Event */
      let curDot;
      Array.prototype.forEach.call(pageDots, function (dot, i) {
        dot.addEventListener('click', function (e) {
          e.preventDefault();
          curDot = document.querySelector('.dot_active');
          curDot.classList.remove('dot_active');
          
          curDot = this;
          this.classList.add('dot_active');

          curSlide.classList.remove('slide_active');
          curIndex = Number(this.getAttribute('data-index'));
          curSlide = slideContents[curIndex];
          curSlide.classList.add('slide_active');
          slideList.style.transition = slideSpeed + "ms";
          slideList.style.transform = "translate3d(-" + (slideWidth * (curIndex + 1)) + "px, 0px, 0px)";
        });
      });
    })();
    //두번째 슬라이더
        (function () {
      const slideList1 = document.querySelector('.slide_list1');  // Slide parent dom
      const slideContents1 = document.querySelectorAll('.slide_content1');  // each slide dom
      const slideBtnNext1 = document.querySelector('.slide_btn_next1'); // next button
      const slideBtnPrev1 = document.querySelector('.slide_btn_prev1'); // prev button
      const pagination1 = document.querySelector('.slide_pagination1');
      const slideLen1 = slideContents1.length;  // slide length
      const slideWidth1 = 300; // slide width
      const slideSpeed1 = 100; // slide speed
      const startNum1 = 0; // initial slide index (0 ~ 4)
      
      slideList1.style.width = slideWidth1 * (slideLen1 + 2) + "px";
      
      // Copy first and last slide
      let firstChild1 = slideList1.firstElementChild;
      let lastChild1 = slideList1.lastElementChild;
      let clonedFirst1 = firstChild1.cloneNode(true);
      let clonedLast1 = lastChild1.cloneNode(true);

      // Add copied Slides
      slideList1.appendChild(clonedFirst1);
      slideList1.insertBefore(clonedLast1, slideList1.firstElementChild);

      // Add pagination dynamically
      let pageChild1 = '';
      for (var i = 0; i < slideLen1; i++) {
        pageChild1 += '<li class="dot1';
        pageChild1 += (i === startNum1) ? ' dot_active' : '';
        pageChild1 += '" data-index="' + i + '"><a href="#"></a></li>';
      }
      pagination1.innerHTML = pageChild1;
      const pageDots1 = document.querySelectorAll('.dot1'); // each dot from pagination

      slideList1.style.transform = "(-" + (slideWidth1 * (startNum1 + 1)) + "px, 0px, 0px)";

      let curIndex1 = startNum1; // current slide index (except copied slide)
      let curSlide1 = slideContents1[curIndex1]; // current slide dom
      curSlide1.classList.add('slide_active');

      /** Next Button Event */
      slideBtnNext1.addEventListener('click', function() {
        if (curIndex1 <= slideLen1 - 1) {
          slideList1.style.transition = slideSpeed1 + "ms";
          slideList1.style.transform = "translate3d(-" + (slideWidth1 * (curIndex1 + 2)) + "px, 0px, 0px)";
        }
        if (curIndex1 === slideLen1 - 1) {
          setTimeout(function() {
            slideList1.style.transition = "0ms";
            slideList1.style.transform = "translate3d(-" + slideWidth1 + "px, 0px, 0px)";
          }, slideSpeed1);
          curIndex1 = -1;
        }
        curSlide1.classList.remove('slide_active');
        pageDots1[(curIndex1 === -1) ? slideLen1 - 1 : curIndex1].classList.remove('dot_active');
        curSlide1 = slideContents1[++curIndex1];
        curSlide1.classList.add('slide_active');
        pageDots1[curIndex1].classList.add('dot_active');
      });

      /** Prev Button Event */
      slideBtnPrev1.addEventListener('click', function() {
        if (curIndex1 >= 0) {
          slideList1.style.transition = slideSpeed1 + "ms";
          slideList1.style.transform = "translate3d(-" + (slideWidth1 * curIndex1) + "px, 0px, 0px)";
        }
        if (curIndex1 === 0) {
          setTimeout(function() {
            slideList1.style.transition = "0ms";
            slideList1.style.transform = "translate3d(-" + (slideWidth1 * slideLen1) + "px, 0px, 0px)";
          }, slideSpeed1);
          curIndex1 = slideLen1;
        }
        curSlide1.classList.remove('slide_active');
        pageDots1[(curIndex1 === slideLen1) ? 0 : curIndex1].classList.remove('dot_active');
        curSlide1 = slideContents1[--curIndex1];
        curSlide1.classList.add('slide_active');
        pageDots1[curIndex1].classList.add('dot_active');
      });

      /** Pagination Button Event */
      let curDot1;
      Array.prototype.forEach.call(pageDots1, function (dot, i) {
        dot.addEventListener('click', function (e) {
          e.preventDefault();
          curDot1 = document.querySelector('.dot_active');
          curDot1.classList.remove('dot_active');
          
          curDot1 = this;
          this.classList.add('dot_active');

          curSlide1.classList.remove('slide_active');
          curIndex1 = Number(this.getAttribute('data-index'));
          curSlide1 = slideContents1[curIndex1];
          curSlide1.classList.add('slide_active');
          slideList1.style.transition = slideSpeed1 + "ms";
          slideList1.style.transform = "translate3d(-" + (slideWidth1 * (curIndex1 + 1)) + "px, 0px, 0px)";
        });
      });
    })();
  </script>
<!-- 추가분 -->
<%@ include file="/common/bottom.jsp" %>
</body>
</html>