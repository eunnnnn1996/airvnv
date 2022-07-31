
//결제 코드
function iamport(){
	const user_num = document.getElementById('user_num').innerText;
	const user_id = document.getElementById('user_id').innerText;
	const phone = document.getElementById('phone').innerText;
	const address1 = document.getElementById('address1').innerText;
	const address2 = document.getElementById('address2').innerText;
	const data = document.getElementById('data').innerText;
	const market_title = document.getElementById('market_title').innerText;

	if(user_num == ""){
		alert('로그인 후 구매 가능합니다.')
	}else if(user_num != null){
		//가맹점 식별코드
		IMP.init('imp62760166');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : market_title , //결제창에서 보여질 이름
		    amount : data, //실제 결제되는 가격, 최소금액 500원 이상 , 500이하시 결제 오류
		    buyer_name : user_id,
		    buyer_tel : phone,
		    buyer_addr : address1+address2
		    /* buyer_postcode : '123-456' */
		}, function(rsp) {
			console.log(rsp);
		    if ( rsp.success ) {
		    	var msg = '결제가 완료되었습니다.';
		        msg += '고유ID : ' + rsp.imp_uid;
		        msg += '상점 거래ID : ' + rsp.merchant_uid;
		        msg += '결제 금액 : ' + rsp.paid_amount;
		        msg += '카드 승인번호 : ' + rsp.apply_num;
		        document.getElementById('paymentData_btn').submit();
				document.getElementById('income_form').submit();
		    } else {
		    	 var msg = '결제에 실패하였습니다.';
		         msg += '에러내용 : ' + rsp.error_msg;
		    }
		    alert(msg);
		});
	
	}
}