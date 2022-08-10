$(function(){
	$(".country-btn-p").click(function(){
		/*$(".address-btn").toggle();*/
		const addressBtn = document.getElementById('add-btn');
		const map = document.getElementById('map');
		const country = document.getElementById('country-1');

		if(addressBtn.style.visibility === 'hidden' && map.style.visibility === 'hidden')  {
		    addressBtn.style.visibility = 'visible';
			map.style.visibility = 'visible';
			document.getElementById("sample5_address").placeholder = "주소";
			document.getElementById("address1-1").placeholder = "동";
			document.getElementById("address1-2").placeholder = "호수";
			document.getElementById("sample5_address").setAttribute("onClick", "sample5_execDaumPostcode()");
			document.getElementById('sample5_address').readOnly = true;
			$('.country-btn-p').text("해외 주소라면 여기를 클릭!");
			country.remove();
		  }else {
		    addressBtn.style.visibility = 'hidden';
			map.style.visibility = 'hidden';
			document.getElementById("sample5_address").placeholder = "해외 주소 입력";
			document.getElementById("address1-1").placeholder = "address1";
			document.getElementById("address1-2").placeholder = "address2";
			document.getElementById("sample5_address").onclick = null;
			document.getElementById('sample5_address').readOnly = false;
			$('.country-btn-p').text("국내 주소라면 여기를 클릭!");
			var appendHtml = '';
			appendHtml += '<input id="country-1" name="country" placeholder="국가명" class="country-input-first" type="text" value>';

			$('#country-input').append(appendHtml);
		  }
			
	});
});