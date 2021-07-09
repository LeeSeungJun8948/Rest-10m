$(document).ready(function() {
	document.getElementById('fromDate').valueAsDate = new Date();
	document.getElementById('toDate').valueAsDate = new Date();
});


var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'readExport.do', method: 'POST' },
		modifyData: { url: 'gridExport.do', method: 'PUT' },
	}
}

const grid = new tui.Grid({
	el: document.getElementById('grid'),
	data: dataSource,
	scrollX: false,
	scrollY: true,
	rowHeaders: ['checkbox'],
	columns: [
		{
			header: '출고번호',
			name: 'exportCode',
		}, {
			header: '출고날짜',
			name: 'exportDate',
			editor: {
				type: 'datePicker',
				options: {
					language: 'ko',
					format: 'yyyy-MM-dd'
				}
			},
			validation: {
				required: true
			}
		},
		{
			header: '제품코드',
			name: 'productCode',
			editor: 'text',
			validation: {
				required: true
			},
			onAfterChange(ev) {
				findProductName(ev);
				valueInput(ev);
			}
		}, {
			header: '제품명',
			name: 'productName',
			onAfterChange(ev) {
				valueInput(ev);
			}
		}, {
			header: '규격',
			name: 'stdId'
		}, {
			header: '단위',
			name: 'unitId'
		}, {
			header: '주문번호',
			name: 'orderNo',
			align: 'right'
		}, {
			header: '기출고량',
			name: 'outCount'
		}, {
			header: '미출고량',
			name: 'unExport',
		}, {
			header: '출고량',
			name: 'exportCount',
			editor: 'text',
			validation: {
				dataType: 'number',
				required: true
			},
			onAfterChange(ev) {
				valueInput(ev);
			}
		}, {
			header: '현재고',
			name: 'dayCount'
		}, {
			header: '제품LOT',
			name: 'productLot'
		}, {
			header: '금액',
			name: 'price',

		}, {
			header: '비고',
			name: 'comments',
			editor: 'text'
		}
	],
	summary: {

		height: 40,
		position: 'bottom',
		columnContent: {
			unExport: {
				template(summary) {
					return '합 계';
				}
			},
			exportCount: {
				template(summary) {
					return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				}
			},
			price: {
				template(summary) {
					return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
				}
			}
		}
	}
});

$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};


// 조회 버튼
$('#btnView').on('click', function() {
	var param = $('#inputFrm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});

// 새자료 버튼
$('#btnReset').on('click', function() {
	grid.clear();
});

// 저장 버튼
$('#btnSave').on('click', function() {
	$.ajax({
		type: 'POST',
		url: 'saveExport.do',
		data: $('#inputFrm').serialize(),
		dataType: 'json',
		success: function(data) {
		var exportCode = data.data.contents.exportCode;
			$('#exportCode').val(exportCode);
			grid.setColumnValues('exportCode', exportCode);
		}
	});
	grid.request('modifyData');
	grid.on('successResponse', function(ev){
		var text = JSON.parse(ev.xhr.responseText);
		if(text.check == 'save') {
			grid.readData(1, {exportCode: $('#exportCode').val()}, true);
		}
	});
	toastr.success("저장되었습니다.");
});


// 삭제 버튼
$('#btnDel').on('click', function() {
	$.ajax({
		type: 'POST',
		url: 'deleteExport.do',
		data: {exportCode:$('#exportCode').val()},
		dataType: 'json',
		success: function(data) {
			toastr.success("삭제되었습니다.");
			resetPage();
		}
	});
});

// 미출고 읽기 버튼
$('#btnunExportModal').on('click', function() {
	$('#unExportContent').load("unExportModal.do");
});
//제품코드입력창
$('#productCode').on('click', function() {
	$('#unExportModal').modal('show');
	$('#unExportContent').load("unExportModal.do");
});

// 추가버튼
$('#btnGridAdd').on('click', function() {
	grid.appendRow();
});

// 행삭제버튼
$('#btnGridDel').on('click', function() {
	grid.removeCheckedRows(false);
});

// 전체체크 선택
grid.on('check', ev => {
});

// 전체체크 해제
grid.on('uncheck', ev => {
});
// 제품명찾기
function findProductName(ev){
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');
	
	if(checkNull(productCode)){
		$.ajax({
			type: 'POST',
			url: 'findProductName.do',
			data: {'productCode': productCode},
			success: function(data) {
				grid.setValue(rowKey, 'productName', data, false);
			}
		});	
	}
}

// 제품코드, 작업량 입력시 폼에 입력
function valueInput(ev) {
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');
	var productName = grid.getValue(rowKey, 'productName');
	var exportCount = grid.getValue(rowKey, 'exportCount');
	var productLot = grid.getValue(rowKey, 'productLot');
	var exportCode = grid.getValue(rowKey, 'exportCode');
	if (productLot != null) {
		$('#exportCount').val(exportCount);
		$('#productCode').val(productCode);
		$('#productName').val(productName);
		gridInput.setColumnValues('productLot', productLot);
		gridInput.setColumnValues('planCode', exportCode);
	}
}


function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
$("#btnCompModal").on("click", function(e) {
	$('#compContent').load("compModalForProd.do");
	console.log("dddd")
});

// ???????
$(document).on('show.bs.modal', '#btnCompModal', function() {
});