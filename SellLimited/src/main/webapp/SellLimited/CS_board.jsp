<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
   <meta charset="UTF-8">
   <meta name= "viewport" content="width=device-width,initial-scale=1">   
   <title>1:1게시판</title>
   <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css" integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T" crossorigin="anonymous">
</head>
<body>
<div class="container">
<table class="table table-striped", "table table-bordered", "table table-hover","table table-striped">
   <thead>
   <tr>
      <th>번호</th>
      <th>제목</th>
      <th>작성자</th>
      <th>날짜</th>
      <th>조회수</th>
   </tr>
   </thead>   
   <tbody>
   <tr>
      <td>1</td>
      <td>배송관련 문의드립니다.</td>
      <td>길라임</td>
      <td>2019-08-16</td>
      <td>1</td>
   </tr>
   <tr>
      <td>2</td>
      <td>결제 문의드립니다.</td>
      <td>오스카</td>
      <td>2019-08-17</td>
      <td>3</td>
   </tr>
   <tr>
      <td>3</td>
      <td>회원가입 문의드립니다.</td>
      <td>윤슬</td>
      <td>2019-08-18</td>
      <td>5</td>
   </tr>
   <tr>
      <td>4</td>
      <td>마이캐쉬관련 문의드립니다.</td>
      <td>김주원</td>
      <td>2019-08-22</td>
      <td>1</td>
   </tr>
   <tr>
      <td>5</td>
      <td>주문관련 문의드립니다.</td>
      <td>이필립</td>
      <td>2019-08-24</td>
      <td>1</td>
   </tr>
   </tbody>
</table>

<hr/>
<button type="button" class="btn btn-outline-secondary">글쓰기</button>
<div class ="text-center">
  <ul class="pagination justify-content-center" style="margin:20px 0">
  <li class="page-item"><a class="page-link" href="#">Previous</a></li>
  <li class="page-item"><a class="page-link" href="#">1</a></li>
  <li class="page-item"><a class="page-link" href="#">2</a></li>
  <li class="page-item"><a class="page-link" href="#">3</a></li>
  <li class="page-item"><a class="page-link" href="#">4</a></li>
  <li class="page-item"><a class="page-link" href="#">5</a></li>
  <li class="page-item"><a class="page-link" href="#">Next</a></li>
</ul>
</div>
</div>
   <script src="https://code.jquery.com/jquery-3.3.1.slim.min.js" integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo" crossorigin="anonymous"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js" integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1" crossorigin="anonymous"></script>
    <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js" integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM" crossorigin="anonymous"></script>
</body>
</html>