$(document).ready(function() {
	document.getElementById('fromDate').valueAsDate = new Date();
	document.getElementById('toDate').valueAsDate = new Date();
});


var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'readUnExport.do', method: 'POST' },
		modifyData: { url: 'saveDetailExport.do', method: 'PUT' },
	}
}

var dataSourceInput = {
	contentType: 'application/json',
	api: {
		readData: { url: 'getExportLot.do', method: 'POST', },
		modifyData: { url: 'saveExportLot.do', method: 'PUT' },
	}
}
const grid = new tui.Grid({
	el: document.getElementById('grid'),
	data: dataSource,
	scrollX: false,
	scrollY: false,
	rowHeaders: ['checkbox'],
	columns: [{
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
		header: '출고코드',
		name: 'exportCode',
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
		name: 'unExportCount',
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
		header: '금액',
		name: 'price',
		editor: 'text',
		validation: {
			dataType: 'number',
			required: true
		},
		onAfterChange(ev) {
			valueInput(ev);
		}

	}, {
		header: '비고',
		name: 'comments',
		editor: 'text'
	}, {
		header: '순번',
		name: 'deIdx',
	}
	]
});
const gridInput = new tui.Grid({
	el: document.getElementById('gridInput'),
	scrollX: false,
	scrollY: true,
	data: dataSourceInput,
	columns: [{
		header: '제품코드',
		name: 'productCode'
	}, {
		header: '제품명',
		name: 'productName'
	}, {
		header: '제품 LOT',
		name: 'productLot'
	}, {
		header: '출고코드',
		name: 'exportCode',
	}, {
		header: '재고량',
		name: 'productCount',
	}, {
		header: '출고량',
		name: 'exportCount',
		editor: 'text',
		validation: {
			dataType: 'number',
			required: true
		},
		onAfterChange(ev) {
			countSum();
		}
	}, {
		header: '비고',
		name: 'comments',
		editor: 'text'
	}, {
		header: 'Lot순번',
		name: 'lotIdx',
	}, {
		header: '세부기록순번',
		name: 'deIdx',
	}]
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
$("#btnExportModal").on("click", function() {
	$('#ExportContent').load("exportModal.do");
});

// 새자료 버튼
$('#btnReset').on('click', function() {
	resetPage();
});

// 계획저장 버튼
$('#btnSave').on('click', function() {
	if (formCheck()) {
		$.ajax({
			type: 'POST',
			url: 'saveExport.do',
			data: $('#inputFrm').serialize(),
			dataType: 'json',
			async: false,
			success: function(data) {
				var exportCode = data.data.contents.exportCode;
				$('#exportCode').val(exportCode);
				grid.setColumnValues('exportCode', exportCode);
			}
		});
		grid.request('modifyData');
		grid.on('successResponse', function(ev) {
			var text = JSON.parse(ev.xhr.responseText);
			if (text.check == 'save') {
				grid.readData(1, { exportCode: $('#exportCode').val() }, true);
			}
		});
		gridInput.request('modifyData');
		gridInput.clear();
		toastr.success("저장되었습니다.");
	}
});

// 삭제 버튼
$('#btnDel').on('click', function() {
	$.ajax({
		type: 'POST',
		url: 'deleteExport.do',
		data: { exportCode: $('#exportCode').val() },
		dataType: 'json',
		success: function() {
			resetPage();
			toastr.success("삭제되었습니다.");
		}
	});
});

// 미출고 읽기 버튼
$('#btnRead').on('click', function() {
	var param = $('#dateForm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});

/*//제품코드입력창
$('#productCode').on('click', function(){
	$('#unExportModal').modal('show');
	$('#unExportContent').load("unExportModal.do");
});*/



// 삭제버튼
$('#btnGridDel').on('click', function() {
	grid.removeCheckedRows(false);
});

// 전체체크 선택
grid.on('check', ev => {
});

// 전체체크 해제
grid.on('uncheck', ev => {
});
// ???????

// 제품명찾기
function findProductName(ev) {
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');

	if (checkNull(productCode)) {
		$.ajax({
			type: 'POST',
			url: 'findProductName.do',
			data: { 'productCode': productCode },
			success: function(data) {
				grid.setValue(rowKey, 'productName', data, false);
			}
		});
	}
}

// 더블클릭해서 투입자재 설정
grid.on('dblclick', (ev) => {
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');
	var productName = grid.getValue(rowKey, 'productName');
	var exportCount = grid.getValue(rowKey, 'exportCount');
	var deIdx = grid.getValue(rowKey, 'deIdx');
	var exportCode = grid.getValue(rowKey, 'exportCode');
	if (deIdx != null) {
		$('#exportCount').val(exportCount);
		$('#productCode').val(productCode);
		$('#productName').val(productName);
		$('#exportCode').val(exportCode);
		var param = { 'productCode': productCode, 'deIdx': deIdx, 'exportCode': exportCode };
		gridInput.readData(1, param, true);
	}
});
// 제품코드, 작업량 입력시 폼에 입력
function valueInput(ev) {
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');
	var productName = grid.getValue(rowKey, 'productName');
	var exportCount = grid.getValue(rowKey, 'exportCount');
	var price = grid.getValue(rowKey, 'price');
	var deIdx = grid.getValue(rowKey, 'deIdx');
	var exportCode = grid.getValue(rowKey, 'exportCode');
	if (deIdx != null) {
		$('#exportCount').val(exportCount);
		$('#productCode').val(productCode);
		$('#productName').val(productName);
		$('#exportCode').val(exportCode);
		$('#price').val(price);
		gridInput.setColumnValues('deIdx', deIdx);
		gridInput.setColumnValues('exportCode', exportCode);
	}
}

// 투입량 합계
function countSum() {
	var exportCount = gridInput.getColumnValues('exportCount');
	var sum = 0;
	for (count of exportCount) {
		if (checkNull(count)) {
			sum += parseInt(count);
		}
	}
	$('#totalCount').val(sum);
}

function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
//모달
var forGrid = false;
$("#btnCompModal").on("click", function(e) {
	$('#compContent').load("compModalForProd.do");
});
$(document).on('show.bs.modal', '#btnCompModal', function() {
});

// 초기화
function resetPage() {
	$("form").each(function() {
		this.reset();
	});
	grid.clear();
	gridInput.clear();
	$('#exportCode').val('exportCode');
}

// 폼체크
function formCheck() {
   if (!checkNull($('#exportDate').val()) || !checkNull($('#companyName').val())) {
      toastr.warning('지시 정보를 입력해주십시오.');
      return false;
   } else if(checkNull($('#exportCount').val()) && ($('#exportCount').val() > $('#totalCount').val()) && $('#totalCount').val() != 0) {
      toastr.warning('총 출고량이 부족합니다.');
      return false;
   } else if(checkNull($('#exportCount').val()) && ($('#exportCount').val() < $('#totalCount').val())) {
      toastr.warning('총 출고량이 초과합니다.');
      return false;      
   } else {
      return true;
   }
}

