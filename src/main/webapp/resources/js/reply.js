
$(function(){
	let currentPage;
	let count;
	let rowCount;

	function selectData(pageNum, rate_num){
		currentPage = pageNum;
		$('#loading').show();
		$.ajax({
			type:'post',
			data:{pageNum:pageNum, rate_num:rate_num},
			url:'replyList.do',
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				$('#loading').hide();
				count = param.count;
				rowCount = param.rowCount;
				if(pageNum==1){
					$('#output').empty();
				}
			
				$(param.list).each(function(index,item){
					let output = '<div class = "item">';
					output += '<div class = "sub-item">'
					output += '<p>' + item.content.replace(/\r\n/g, '<br>') + '</p>';
					output += '<span class="modify-date">등록일 : '+ item.reg_date  + '</span>';
					if(param.user_num != item.user_num){
					output += '<hr style="width:600px; background-color:#d3d3d3;height:1px;border:0;margin-top:20px;">';
					}
				
					if(param.user_num == item.user_num){
					output += '<div class="re-option-btn">';	
					output += '<input type="button" data-num="'+item.reply_num+'" value="수정" class="modify-btn" id="listbtn">';
					output += '<input type="button" data-num="'+item.reply_num+'" value="삭제" class="delete-btn" id="listbtn">';
					output += '</div>';
					output += '<hr style="width:600px; background-color:#d3d3d3;height:1px;border:0;margin-top:20px;">';
					}
					
					output += '</div>';
					output += '</div>';
					
					$('#output').append(output);
				});
				if(currentPage >= Math.ceil(count/rowCount)){
					$('.paging-button').hide();
				}else{
					$('.paging-button').show();
				}
				
			},
			error:function(){
				$('#loading').hide();
				alert('네트워크 오류발생!');
			}
		});
	}

	$('.paging-button input').click(function(){
		pageNum = currentPage +1;
		selectData(pageNum, $('#rate_num').val());
	});

	$('#re_form').submit(function(event){

		if($('#content').val().trim()==''){
			alert('내용을 입력하세요');
			$('#content').val('').focus();
			return false;
		}
		let data = $(this).serialize();
		
		$.ajax({
			type : 'post',
			data : data,
			url : 'replyInsert.do',
			dataType : 'json',
			cache : false,
			timeout : 30000,
			success : function(param){
				if(param.result =='logout'){
					alert('로그인해야 작성할 수 있습니다.');
				}else if(param.result =='success'){
					initForm();
					selectData(1,$('#rate_num').val());
				}else{
					alert('등록시 오류 발생!');
				}
			},
			error:function(){
				alert('네트워크 오류발생!');
			}
		});	
		event.preventDefault();	
	});
	
	function initForm(){
		$('textarea').val('');
		$('#re_first .letter-count').text('300/300');
	}
	$(document).on('keyup','textarea',function(){
		let inputLength = $(this).val().length;
		
		if(inputLength>300){
			$(this).val($(this).val().substring(0,300));
		}else{
			let remain = 300 - inputLength;
			remain += '/300';
			if($(this).attr('id')=='content'){
				$('#re_first .letter-count').text(remain);
			}else{
				$('#mre_first .letter-count').text(remain);
			}
		}
	});
	
	$(document).on('click','.modify-btn',function(){
		let re_num = $(this).attr('data-num');
		let modifyUI = '<form id="mre_form">';
		modifyUI += '<input type ="hidden" name="reply_num" id="mre_num" value="'+re_num+'">';
		modifyUI += '<textarea rows="3" cols="50" name="content" id="mre_content" class="rep-content"></textarea>';
		modifyUI += '<div id="mre_first"><span class="letter-count">300/300</span></div>';		
		modifyUI += '<div id="mre_second" class="align-right">';
		modifyUI += '<input type="submit" class="reset-update-btn" value="수정">';
		modifyUI += '<input type="button" value="취소" class="re-reset reset-btn" id="listbtn">';
		modifyUI += '</div>';
		modifyUI += '</form>';
	
		initModifyForm();
		
		$(this).parent().hide();
		$(this).parents('.item').append(modifyUI);
		let inputLength = $('#mre_content').val().length;
		let remain = 300-inputLength;
		remain += '/300';
		$('#mre_first .letter-count').text(remain);
	});
		
	$(document).on('click','.re-reset',function(){
		initModifyForm();
	});

	function initModifyForm(){
		$('.sub-item').show();
		$('#mre_form').remove();
	}
	$(document).on('submit','#mre_form',function(event){
		if($('#mre_content').val().trim()==''){
			alert('내용을 입력하세요!');
			$('#mre_content').val('').focus();

			return false;
		}

		let data = $(this).serialize();
		
		$.ajax({
			url:'replyUpdate.do',
			type:'post',
			data:data,
			dataType:'json',
			cache:false,
			timeout:30000,
			success:function(param){
				if(param.result == 'logout'){
					alert('로그인하세요.');
				}else if(param.result =='notAdmin'){
					alert('관리자만 접근 가능합니다.');
				}else if(param.result =='success'){
					$('#mre_form').parent().find('p').html($('#mre_content').val().replace(/</g,'&lt;').replace(/>/g,'&gt;').replace(/\r\n/g,'<br>').replace(/\r/g,'<br>').replace(/\n/g,'<br>'));
					
					$('#mre_form').parent().find('.modify-date').text('최근 수정일 : 5초 미만');
					
					initModifyForm();
					
				}else if(param.result == 'wrongAccess'){
					alert('타인의 댓글은 수정불가합니다.');
				}else{
					alert('댓글 수정시 오류발생!');
				}
			},
			error:function(){
				alert('네트워크 오류발생!');
			}
		});
		
		event.preventDefault();
	});
	
	$(document).on('click','.delete-btn',function(){
	
		let re_num = $(this).attr('data-num');
		
		let choice = confirm('댓글을 삭제하시겠습니까?');
		if(choice){
			$.ajax({
				type:'post',
				url:'replyDelete.do',
				data:{re_num:re_num},
				dataType:'json',
				cache:false,
				timeout:30000,
				success:function(param){
					if(param.result=='logout'){
						alert('로그인하세요.');
					}else if(param.result =='success'){
						alert('삭제 완료!');
						selectData(1,$('#rate_num').val());
					}else if(param.result=='wrongAccess'){
						alert('타인의 댓글은 삭제불가합니다.');
					}else{
						alert('댓글 삭제시 오류발생!');
					}	
				},
				error:function(){
					alert('네트워크 오류발생!');
				}
			})};
	});
	
	selectData(1, $('#rate_num').val());
	
});










