
$( document ).ready(function() {
   	showMatList();
});

function gridClear(){
	
}
	
function showMatList(){
	var listData; // list그리드에 넣을 데이터

	// listData 가져오기
	$.ajax({
		type : "get",
		url : "ajax/matList.do",
		dataType : "json",
		async : false,
		success : function(data) {
			listData = data;
		},
		error : function() {
		}
	});


	// listGrid 생성
	const listGrid = new tui.Grid({
		el : document.getElementById('matList'),
		data : listData,
		scrollX : false,
		scrollY : true,
		bodyHeight: 450,
		selectionUnit: 'row',
		columns : [ {
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center'
		}, {
			header : '자재명',
			name : 'materialName'
		}, {
			header : '구분',
			name : 'matNm',
			width : 80,
			align: 'center'
		} ]
	});
}
	
// list에서 선택한 자재 정보 가져오기
$(matList).on('click','tr',function(){
	
	$.ajax({
		
		type : "get",
		url : "ajax/matInfo.do",
		data : {
			'materialCode' : $(this).children().eq(0).children().eq(0).html()
		},
		dataType : "json",
		async : false,
		success : function(data) {
			$('#materialCode').val(data.materialCode);
			$('#materialName').val(data.materialName);
//			$('#matNo').val(data.matNo)
			$('#matNo').val(data.matNo).prop("selected",true);
			$('#companyCode').val(data.companyCode);
			$('#companyName').val(data.companyName);
//			$('#unitNo').val(data.unitNo);
			$('#unitNo').val(data.unitNo).prop("selected",true);
			$('#saveStock').val(data.saveStock);
			$('#minStock').val(data.minStock);
			$('#maxStock').val(data.maxStock);
			$('#monthStock').val(data.monthStock);
			
		},
		error : function() {
		}
	});
	
});
	
// 입력 / 수정 form 전송
$('#btnSave').on('click',function(){
	
	$.ajax({
		
		type : "get",
		url : "ajax/matSave.do",
		data : $('#frm').serialize(),
		dataType : "json",
		async : false,
		success : function(data) {
			if(data == 1)
				alert('1건 입력 완료');
			else
				alert('입력 실패 : 지속될 시 관리자에게 문의');
				
			$("#matList").empty()
			showMatList();
		},
		error : function(request, status, error) {
		}
	});
});
	
// 새 자재 클릭시 matCode 불러오기
$('#btnNew').on('click',function(){
	
	$.ajax({
		
		type : "get",
		url : "ajax/newMatCode.do",
		dataType : "json",
		async : false,
		success : function(data) {
			$('input').val('');
			$('#materialCode').val(data.materialCode);

		},
		error : function(request, status, error) {
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});
});
	
	
// 자재 정보 삭제
$('#btnDel').on('click',function(){
	
	if($('#materialCode').val() != null && $('#materialCode').val() != ''){
		if(confirm("정말로 " + $('#materialCode').val() + "번 자재를 삭제하겠습니까?")){
		
    		$.ajax({
			
				type : "get",
				url : "ajax/matDel.do",
				data : $('#frm').serialize(),
				dataType : "json",
				async : false,
				success : function(data) {
					if(data == 1)
						alert('삭제되었습니다.');
					else
						alert('삭제 실패 : 지속될 시 관리자에게 문의');
					
					$('input').val('');
					$("#matList").empty()
					showMatList();
				},
				error : function(request, status, error) {
					alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
				}
			});
	
		}else
			return;

	} // end if
	
});


// 모달
var forGrid = false;

$("#btnCompModal").on("click", function(e) {
    $('#compContent').load("compModal.do");
});

$(document).on('show.bs.modal','#btnCompModal', function (){});

$('#companyCode').on('click',function(){
	$('#compModal').modal('show');
	$('#compContent').load("compModal.do");
	
})


function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
	
	
