<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"></script>
<title>회원상품수정</title>
</head>
<body>
	<script type="text/javascript">
		$(document).ready(function(){
			$("#insertProduct").click(function() {
				var productName = $("#productName").val();
				//var 대분류/소분류/브랜드/모델명/상품명/상품이미지/품질보증서/상품설명/시작가/낙찰가/
				if(productName == "") {
					alert("상품명을 입력해주세요");
					productName.focus();
				}else{
					return;
				}
				location.href="#";
			});
		});
		$(".custom-file-input").on("change", function() {
			  var fileName = $(this).val().split("\\").pop();
			  $(this).siblings(".custom-file-label").addClass("selected").html(fileName);
			});
	</script>
<div class="container-fluid">
	<h2>상품 등록</h2>
	<form id="insertProducts" name="insertProducts" enctype="multipart/form-data" method="post">
		<table class="table">
			<tbody>
				<tr><!-- 대분류/소분류/브랜드/모델명/상품명/상품이미지/품질보증서/상품설명/시작가/낙찰가/ -->
					<td width="110px">대분류</td>
					<td>
					    <select id="ProductSecssion" class="custom-select sm-3" style="width: auto">
							<option selected></option>
							<option value="classic">패션</option>
							<option value="limitedEdition">카메라</option>
							<option value="collaboration">악기</option>
							<option value="collaboration">키덜트</option>
							<option value="collaboration">연예인 굿즈</option>
							<option value="collaboration">골동품</option>
							<option value="collaboration">게임</option>
							<option value="collaboration">음반</option>
					    </select>
					</td>
				</tr>
				<tr>
					<td width="110px">소분류</td>
					<td>
					    <select id="classicSession" class="custom-select mb-3" style="width: auto">
							<option selected></option>
							<option value="before2000">before2000</option>
							<option value="after2001">after2001</option>
							<option value="after2011">after2011</option>
					    </select>
					</td>
				</tr>
				<tr>
					<td width="110px">브랜드</td>
					<td>
					    <select id="brandSession" class="custom-select mb-3" style="width: auto">
							<option selected></option>
							<option value="">1</option>
							<option value="">2</option>
							<option value="">3</option>
					    </select>
					</td>
				</tr>
				<tr>
					<td width="110px">경매기간</td>
					<td>
					    <select id="brandSession" class="custom-select mb-3" style="width: auto">
							<option selected></option>
							<option value="">6시간</option>
							<option value="">12시간</option>
							<option value="">24시간</option>
							<option value="">48시간</option>
							<option value="">72시간</option>
					    </select>
					</td>
				</tr>
				<tr>
					<td width="110px">상품명</td>
					<td><input type="text" name="productName" id="productName"></td>
				</tr>
				<tr>
					<td width="110px">모델명</td>
					<td><input type="text" name="productModel" id="productModel"></td>
				</tr>
				<tr>
					<td width="110px">상품 이미지</td>
					<td>
	    				<input type="file" id="productPhoto1" name="productPhoto1">
    				    <input type="file" id="productPhoto2" name="productPhoto2">
	    				<input type="file" id="productPhoto3" name="productPhoto3">
    				    <input type="file" id="productPhoto4" name="productPhoto4">   
    				    <input type="file" id="productPhoto5" name="productPhoto5">   
    				    <input type="file" id="productPhoto6" name="productPhoto6">   
					</td>
				</tr>
				<tr>
					<td width="110px">품질보증서</td>
					<td>
					    <div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="ThereIsQAS" name="ThereIsQAS">
							<label class="custom-control-label" for="ThereIsQAS">있음</label>
					    </div>
					    <div class="custom-control custom-radio custom-control-inline">
							<input type="radio" class="custom-control-input" id="ThereIsntQAS" name="ThereIsntQAS">
							<label class="custom-control-label" for="ThereIsntQAS">없음</label>
					    </div>
				    </td>
				</tr>
				<tr>
					<td width="110px">상품설명</td>
					<td><textarea rows="5" cols="100%" name="productDesc" id="productDesc"></textarea></td>
				</tr>
				<tr>
					<td width="110px">시작가</td>
					<td><input type="text" name="startingPrice" id="startingPrice"></td>
				</tr>
				<tr>
					<td width="110px">즉시구매가</td>
					<td><input type="text" name="imdBuyPrice" id="imdBuyPrice"></td>
				</tr>
			</tbody>
		</table>
	</form>
</div>

</body>
</html>