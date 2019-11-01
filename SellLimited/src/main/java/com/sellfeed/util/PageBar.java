package com.sellfeed.util;
/*
 * 화면에서 받아와야 하는 정보에는 어떤 것들이 있을까?
 * 1)전체레코드수(totalRecord), 2)페이지당 레코드 수(numberPerPage), 3)현재페이지(nowPage)
 * 4)페이지이름(XXX.jsp)
 *  
 * 
 * 공식을 세우는데 필요한 인자는 누구?
 * 1)전체페이지(totalPage) : total/numberPerpage(ceil)
 * 2)현재블럭(nowBlock) : nowPage/pageBlock (ceil)
 * 
 * 강사님 답 : 화면(jsp), 생성자에서 초기화 시켜줌.
 * 
 * 세워진 공식들은 어디에서 적용하면 되는 거지?
 * 페이지네이션
 * 
 * 화면에 내보내져야 하는 언어는 html 아님 자바 중에서 무엇????
 * html
 * 
 * 내보내지는 정보는 어디에 담으면 될까??
 */

public class PageBar {
   //전체레코드 갯수
   private int totalRecord;
   //페이지당 레코드 수
   private int numPerPage;
   //블럭당 페이지 수
   private int pagePerBlock;
   //총페이지수
   private int totalPage;
   //총블럭 수 
   private int totalBlock;
   //현재 내가 바라보는 페이지
   private int nowPage;
   //현재 내가 바라보는 블럭 수
   private int nowBlock;
   //적용할 페이지 이름
   private String pagePath;
   //Stringbuffer생성
   private String pagination;
   
   //페이지 네비게이션 초기화
   public PageBar(int numberPerPage, int totalRecord, int nowPage,String pagePath) {
	   this.numPerPage = numberPerPage;
	   this.totalRecord = totalRecord;
	   this.nowPage = nowPage;
	   this.pagePath = pagePath;
	   if(totalRecord/numberPerPage>=10) {
		   this.pagePerBlock = 10;
	   }
	   else {
		   this.pagePerBlock = totalRecord/numberPerPage+1;
	   }
	   this.totalPage = (int)Math.ceil((double)this.totalRecord/this.numPerPage);
	   this.totalBlock = (int)Math.ceil((double)this.totalPage/this.pagePerBlock);
	   this.nowBlock = (int)((double)this.nowPage/this.pagePerBlock);
   }
   //setter메소드 선언
   public void setPageBar() {
	   StringBuilder pageLink = new StringBuilder();
	   //전체 레코드 수가 0보다 클때 처리하기
	   if(totalRecord>0) {
		   //nowBlock이 0보다 클때 처리
		   //이전페이지로 이동해야 하므로 페이지 번호에 a태그를 붙여야 하고
		   //pagePath뒤에 이동할 페이지 번호를 붙여서 호출해야함.
		   if(nowBlock > 0) {
			   pageLink.append("<a href='"+pagePath+"nowPage="+((nowBlock-1)*pagePerBlock+(pagePerBlock-1))+"' class='btn_page btn_prev' title='이전'>");
			   pageLink.append("</a>");
		   }
		   for(int i=0;i<pagePerBlock;i++) {
			   //현재 내가 보고있는 페이지 블록일때와
			   if(nowBlock*pagePerBlock+i==nowPage) {
				   pageLink.append("<a href='"+pagePath+"nowPage="+((nowBlock*pagePerBlock)+i)+"' class='btn_page _current' title='page "+(nowBlock*pagePerBlock+i+1)+"'>");
				   pageLink.append((nowBlock*pagePerBlock+i+1));
				   pageLink.append("</a>");
			   }
			   //그렇지 않을때를 나누어 처리해야 함.
			   else {
				   pageLink.append("<a href='"+pagePath+"nowPage="+((nowBlock*pagePerBlock)+i)+"' class='btn_page' title='page "+(nowBlock*pagePerBlock+i+1)+"'>");
				   pageLink.append((nowBlock*pagePerBlock+i+1));
				   pageLink.append("</a>");
			   }
			   //모든 경우에 pagePerBlock만큼 반복되지 않으므로 break처리해야 함.
			   if((nowBlock*pagePerBlock)+i+1==totalPage) break;
		   }
		   //현재 블록에서 다음 블록이 존재할 경우 이미지 추가하고 페이지 이동 할 수 있도록
		   //a태그 활용하여 링크처리하기.
		   if(totalBlock > nowBlock+1) {
			   pageLink.append("<a href='"+pagePath+"nowPage="+((nowBlock+1)*pagePerBlock)+"' class='btn_page btn_next' title='다음'>");
			   pageLink.append("</a>");
		   }
	   }
	   pagination = pageLink.toString();
   }
   //getter메소드 선언
   public String getPageBar() {
	   this.setPageBar();
	   return pagination;
   }
   //setter메소드 선언
   public void setPageBar1() {
	   StringBuilder pageLink = new StringBuilder();
	   //전체 레코드 수가 0보다 클때 처리하기
	   if(totalRecord>0) {
		   //nowBlock이 0보다 클때 처리
		   //이전페이지로 이동해야 하므로 페이지 번호에 a태그를 붙여야 하고
		   //pagePath뒤에 이동할 페이지 번호를 붙여서 호출해야함.
		   if(nowBlock > 0) {
			   pageLink.append("<a href='"+pagePath+((nowBlock-1)*pagePerBlock+(pagePerBlock-1))+");"+"' class='btn_page btn_prev' title='이전'>");
			   pageLink.append("</a>");
		   }
		   for(int i=0;i<pagePerBlock;i++) {
			   //현재 내가 보고있는 페이지 블록일때와
			   if(nowBlock*pagePerBlock+i==nowPage) {
				   pageLink.append("<a href='"+pagePath+((nowBlock*pagePerBlock)+i)+");"+"' class='btn_page _current' title='page "+(nowBlock*pagePerBlock+i+1)+"'>");
				   pageLink.append((nowBlock*pagePerBlock+i+1));
				   pageLink.append("</a>");
			   }
			   //그렇지 않을때를 나누어 처리해야 함.
			   else {
				   pageLink.append("<a href='"+pagePath+((nowBlock*pagePerBlock)+i)+");"+"' class='btn_page' title='page "+(nowBlock*pagePerBlock+i+1)+"'>");
				   pageLink.append((nowBlock*pagePerBlock+i+1));
				   pageLink.append("</a>");
			   }
			   //모든 경우에 pagePerBlock만큼 반복되지 않으므로 break처리해야 함.
			   if((nowBlock*pagePerBlock)+i+1==totalPage) break;
		   }
		   //현재 블록에서 다음 블록이 존재할 경우 이미지 추가하고 페이지 이동 할 수 있도록
		   //a태그 활용하여 링크처리하기.
		   if(totalBlock > nowBlock+1) {
			   pageLink.append("<a href='"+pagePath+((nowBlock+1)*pagePerBlock)+");"+"' class='btn_page btn_next' title='다음'>");
			   pageLink.append("</a>");
		   }
	   }
	   pagination = pageLink.toString();
   }
   //getter메소드 선언
   public String getPageBar1() {
	   this.setPageBar1();
	   return pagination;
   }
}