$(function(){
	$.ajax({
		type:'post',
		url:'/projectMVC/board/GetBoardList.do',
		data: 'pg=' + $('#pg').val(),
		dataType: 'json',
		success: function(data){
			console.log(JSON.stringify(data));
			console.log(data.list[0].subject);
			
			$.each(data.list,function(index,items){
				
				$('<tr>').append($('<td/>',{
					align:'center',
					text: items.seq
					
				})).append($('<td/>',{}).append($('<a/>',{
						href:'#',
						text: items.subject,
						class:'subjectA subjectA_'+items.seq
					}))
				
				).append($('<td/>',{
					align:'center',
					text: items.id
				})).append($('<td/>',{
					align:'center',
					text: items.hit
				})).append($('<td/>',{
					align:'center',
					text: items.logtime
				})).appendTo($('#boardListTable'));
				
				/*var result = `<tr>` 
							+ `<td align="center">` + items.seq + `</td>` 
							+ `<td>` + items.subject+ `</td>` 
							+ `<td>` + items.id + `</td>` 
							+ `<td>` + items.hit + `</td>` 
							+ `<td>` + items.logtime + `</td>` 
							+ `</tr>`;
				$('#boardListTable').append(result);*/
				
			});//$.each
			
			//페이징 처리 
			$('#boardPagingDiv').html(data.pagingHTML);
			
			//제목을 클릭했을 때
			$('.subjectA').click(function(){
				//로그인 여부
				if($('#memId').val() == ''){
				alert('먼저 로그인하세요');
				location.href = '/projectMVC/member/loginForm.do';
				} else {
					
					var seq = $(this).parent().prev().text();
					var pg =$('#pg').val() ;
                 location.href = '/projectMVC/board/boardView.do?seq='+seq+'&pg='+pg;
                  }
			
			});
			
			
			
		},
		error: function(e){
			console.log(e);
		}
	});
	
});