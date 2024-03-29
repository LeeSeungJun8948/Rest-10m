function test() {
		/*var check = document.frm.facCode.value;
		if (!check) {
			alert("설비코드 필수입력");
			document.frm.facCode.focus();*/
	if(!checkNull($('#facCode').val())) {
			toastr.warning('설비코드를 입력해주십시오.');
			return false;
		} else if(!checkNull($('#companyCode').val())) {
			toastr.warning('업체코드를 입력해주십시오.');
			return false;
		}
			return true;
	}
 
const dataSource = { 
		api : {
			readData : {
				url : contextPath + '/ajax/repList.do',
				method : 'GET'
			},
			deleteData : {
				url : contextPath + '/ajax/deleteRep.do',
				method : 'POST'
			}
		},
		contentType : 'application/json'
	}

	const grid = new tui.Grid({
		el : document.getElementById('grid'),
		data : dataSource,
		rowHeaders : [ 'checkbox' ],
		scrollX : false,
		scrollY : false,
		columns : [ {
			header : '수리코드',
			name : 'repairCode',
			align: 'center'
		}, {
			header : '설비코드',
			name : 'facCode',
			align: 'center'
		}, {
			header : '설비명',
			name : 'facilitiesName',
			align: 'center'
		}, {
			header : '수리일자',
			name : 'repairDate',
			align: 'center'
		}, {
			header : '수리내역',
			name : 'repairComment',
			align: 'center'
		}, {
			header : '업체코드',
			name : 'companyCode',
			align: 'center'
		}, {
			header : '업체명',
			name : 'companyName',
			align: 'center'
		}, {
			header : '수리금액',
			name : 'cost',
			align: 'right'
		}, {
			header : '비고',
			name : 'etc',
			align: 'center'
		} ]
	});

	//삭제버튼	
	$("#btnDelete").on("click", function() {
		grid.removeCheckedRows(false);
		grid.request('deleteData');
	})

	// input 데이터 불러오기
	grid.on('click', function(ev) {
		var key = grid.getRow(ev.rowKey).repairCode;
		$.ajax({
			type : "get",
			url : contextPath + "/ajax/repInfo.do",
			data : {
				'repairCode' : key
			},
			dataType : "json",
			async : false,
			success : function(data) {
				$('#repairCode').val(data.repairCode);
				$('#facCode').val(data.facCode);
				$('#repairDate').val(data.repairDate);
				$('#repairComment').val(data.repairComment);
				$('#companyCode').val(data.companyCode);
				$('#cost').val(data.cost);
				$('#etc').val(data.etc);

			},
			error : function() {

			}

		});
	});

	// 수정
	$('#btnUpdate').on('click', function() {

		$.ajax({

			type : "get",
			url : contextPath + "/ajax/updateRep.do",
			data : $('#frm').serialize(),
			dataType : "json",
			async : false,
			success : function(data) {
				if(data == 1){
					alert('수정 완료');
					grid.readData(1, null, true);
				}
					
				else
					alert('수정 실패');
			},
			error : function(request, status, error) {
			}
		});
	});
	
	function checkNull(value){
		return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
	}
	
	// 모달
	var forGrid = false;
	
	$("#btnCompModal").on("click", function(e) {
	    $('#compContent').load(contextPath + "/modal/compModal.do");
	});
	
	$("#btnFacModal").on("click", function(e) {
	    $('#facContent').load(contextPath + "/modal/facModal.do");
	});

	function numberWithCommas(x) {
 	 x = x.replace(/[^0-9]/g,'');   
 	 x = x.replace(/,/g,'');        
 	 $("#cost").val(x.replace(/\B(?=(\d{3})+(?!\d))/g, ","));  
}