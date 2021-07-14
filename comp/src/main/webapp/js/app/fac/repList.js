function test() {
		/*var check = document.frm.facCode.value;
		if (!check) {
			alert("설비코드 필수입력");
			document.frm.facCode.focus();*/
	if(!checkNull($('#facCode').val())) {
		toastr.warning('설비코드를 입력해주십시오.');
			return false;
		} else
			return true;
	}

const dataSource = {
		api : {
			readData : {
				url : 'ajax/repList.do',
				method : 'GET'
			},
			deleteData : {
				url : 'ajax/deleteRep.do',
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
			name : 'repairCode'
		}, {
			header : '설비코드',
			name : 'facCode'
		}, {
			header : '수리일자',
			name : 'repairDate'
		}, {
			header : '수리내역',
			name : 'repairComment'
		}, {
			header : '업체코드',
			name : 'companyCode'
		}, {
			header : '수리금액',
			name : 'cost'
		}, {
			header : '비고',
			name : 'etc'
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
		console.log(key);
		$.ajax({
			type : "get",
			url : "ajax/repInfo.do",
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
			url : "ajax/updateRep.do",
			data : $('#frm').serialize(),
			dataType : "json",
			async : false,
			success : function(data) {
				if (data == 1)
					alert('수정 완료');
				else
					alert('수정 실패');
			},
			error : function(request, status, error) {
			}
		});
	});
	
	function checkNull(value){
		return value != null && value != '' && value != '[object HTMLInputElement]';
	}

	$("#btnCompModal").on("click", function(e) {
	    $('#compContent').load("compModal.do");
	});
	

	