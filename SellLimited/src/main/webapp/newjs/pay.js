


$('.det_btns a, .fix_btns a, .bl_big_btns li a, #goods_btns a , #auc_bn a').live('click', function(e){
	if ($(this).attr('rel') == 'btn_compare') {
		return;
	}
	e.preventDefault();

	var optionCart = {};
	optionCart = new Array();
	var optionAdd = {}
	optionAdd = [];

	var $goods_id		= $('#detail_frm input[name=goods_id]');
	var $goods_name		= $('#detail_frm input[name=goods_name]');
	var $goods_name_ori	= $('#detail_frm input[name=goods_name_ori]');
	var $qty			= $('#detail_frm select[name="quantity"]');
	var $price			= $('#detail_frm input[name="price"]');
	var $shop_url		= $('#detail_frm input[name="shop_url"]');
	var $shop_name		= $('#detail_frm input[name="shop_name"]');
	var $sell_date		= $('#detail_frm input[name="sell_date"]');
	var $option_name	= $('#detail_frm select[name="option_value"]');
	var $goods_img		= $('#detail_frm input[name=goods_img]');
	var $parse_url		= $('#detail_frm input[name=parser_url]');
	var $site			= $('#detail_frm input[name=site]');
	var cnt				= $('#detail_frm #goods_option option').size();
	var $user_id		= $('#detail_frm input[name=user_id]');
	var $shipping		= $('#detail_frm input[name=shipping]');
	var $order_memo		= $('#detail_frm #order_memo');

	if($site.val() == "ebay" || $site.val() == "ebay_buy" || $site.val() == "amazon" || $site.val() == "etc_us" || $site.val() == "mercari" ){
		alert('서비스 개선작업으로 인한 시스템 점검 중입니다.');
		return false;
	}

	if($user_id.val() == '') {
		SLB('/auth/login_pop','iframe', 512, 440, false, false);
		return false;
	}

	if($qty.val() <= 0) {
		alert('수량을 선택하셔야 합니다.');
		$qty.focus();
		return false;
	}

	if(cnt > 1 && $option_name.val() == '') {
		alert('옵션을 선택하셔야 합니다.');
		return false;
	}

	if($price.val() == '' || $price.val() == 0) {
		alert('가격이 0인 상품은 구매 하실수 없습니다.');
		return false;
	}

	optionCart.push({
		goods_id: $goods_id.val(),
		name: $goods_name.val(),
		name_ori: $goods_name_ori.val(),
		qty: $qty.val(),
		price: $($price).val(),
		option_name: $option_name.val(),
		id : $goods_id.val(),
		imgs : $goods_img.val(),
		sell_date : $sell_date.val(),
		site : $site.val(),
		shop_url : $parse_url.val(),
		shop_name : $shop_name.val(),
		delivery_free : $shipping.val(),
		memo : $order_memo.val()
	});

	
	$(this).attr('disabled', true);
	switch($(this).attr('rel')) {
		case 'btn_purchase' :
			buyNow();
		break;
		case 'btn_add_cart' :
			addCart(optionCart);
		break;
		case 'btn_add_wish' :
			addWish(optionCart);
		break;
	}
	$(this).removeAttr('disabled');
});

function buyNow()
{
	$.ajax({
		url: '/order/select',
		type: 'POST',
		dataType: 'json',
		data: $("#detail_frm").serialize()
	}).done(function(data){

		
		if (data.result == 'success') {

			location.href = "/order?q=" + data.q;

		}
		if (data.result == 'error') {
			switch(data.code) {
				case 'soldout' :
				case 'stock' :
				case 'purcharse_max' :
					alert(data.message);
					break;
				case 'users':
					location.href = "/auth/login?url=" + encodeURIComponent(location.href);
					break;
				default:
					alert("구매선택에 실패했습니다.");
					break;
			}
		}
	});
}


function addCart(item)
{

	$.ajax({
		url: '/order/cart_add',
		type: 'POST',
		dataType: 'json',
		data: { item: item }
	}).done(function(data){
		/* 네이버 프리미엄로그 전환 설정 */
		var _nasa={};
		 _nasa["cnv"] = wcs.cnv("3","1"); 

		if (data.result == 'success') {
			if (confirm("장바구니에 상품이 담겼습니다. 지금 확인하시겠습니까?")) {
				location.href = "/order/cart";
			}
				return false;
			
		}
		if (data.result == 'error') {
			switch(data.code) {
				case 'soldout' :
				case 'stock' :
				case 'purcharse_max' :
					alert(data.message);
					break;
				case 'already' :
					if (confirm(data.message)) {
						location.href = "/order/cart";
					}
					break;
				default:
					alert("장바구니 담기에 실패했습니다.");
					break;
			}
		}
		return false;
	});
}

// 장바구니 바로구매
function cart_buy()
{
	
	var detail_frm = $('#detail_frm');

	var checkbox = $('#detail_frm input[name=chk_box]');
	var str = new Array();
	var chk_count = 0;
	var cart_seller = '';
	checkbox.each(function(key, val) {
		if ($(this).attr("checked") == 'checked'){
			cart_seller = $('input[name=cart_' +val.value+']').val();
			str[chk_count] = val.value;				
			chk_count++;
		}
	});

	

	if (chk_count == 0) {
		alert('바로구매 하실 주문건을 선택하셔야 합니다.');
		return false;
	}


	if (chk_count > 3) {
		alert('같은 판매자라 하더라도 3개까지만 묶음주문이 가능합니다');
		return false;
	}


	$.ajax({
		url: '/order/cart_select',
		type: 'POST',
		dataType: 'json',
		data: {chk_box: str }

	}).done(function(data){

		if (data.result == 'success') {
			location.href = "/order?q=" + data.q;
		}
		if (data.result == 'error') {
			switch(data.code) {
				case 'soldout' :
				case 'stock' :
				case 'purcharse_max' :
					alert(data.message);
					break;
				case '_overlap' :
					alert('묶음상품외에는 한 상품에 한번만 주문 가능 합니다. ');
					return false;
				break;
				case '_us' :
					alert('서비스 개선 작업으로 인한 시스템 점검 중 입니다.');
					return false;
				break;
				default:
					alert("구매선택에 실패했습니다.");
					break;
			}
		}
	});

}


// 장바구니 바로구매
function cart_buy_new()
{
	var detail_frm = $('#detail_frm');

	var checkbox = $('#detail_frm input[name=chk_box]');
	var str = new Array();
	var chk_count = 0;
	var cart_seller = '';
	checkbox.each(function(key, val) {
		if ($(this).attr("checked") == 'checked'){
			cart_seller = $('input[name=cart_' +val.value+']').val();
			str[chk_count] = val.value;				
			chk_count++;
		}
	});

	

	if (chk_count == 0) {
		alert('바로구매 하실 주문건을 선택하셔야 합니다.');
		return false;
	}

	if(chk_count > 1) {
		if(cart_seller == '' || cart_seller == undefined) {
			alert('묶음상품외에는 한 상품에 한번만 주문 가능 합니다. ');
			return false;
		}
	}

	

	$.ajax({
		url: '/order/cart_select_new',
		type: 'POST',
		dataType: 'json',
		data: {chk_box: str }

	}).done(function(data){

		if (data.result == 'success') {
			location.href = "/order?q=" + data.q;
//			if (confirm("감사합니다. \n\r구매신청이 정상적으로 완료 되었습니다. \n\r마이페이지 구매신청목록을 보시겠습니까?")) {
//				location.href = "/mypage/index";
//			}
		}
		if (data.result == 'error') {
			switch(data.code) {
				case 'soldout' :
				case 'stock' :
				case 'purcharse_max' :
					alert(data.message);
					break;
				default:
					alert("구매선택에 실패했습니다.");
					break;
			}
		}
	});

}





