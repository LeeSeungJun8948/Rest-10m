var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'readUnfinPlans.do', method: 'POST' },
		modifyData: { url: 'saveDetailProrder.do', method: 'PUT' },
  }
}

var dataSourceInput = {
	contentType: 'application/json',
	api: {
		readData: { url: 'getInputMat.do', method: 'POST', },
		modifyData: { url: 'saveInput.do', method: 'PUT' },
  }
}

const grid = new tui.Grid({
	el: document.getElementById('grid'),
	scrollX: false,
	scrollY: false,
	data: dataSource, 
	rowHeaders: ['checkbox'],
	columns: [ {
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
		header: '계획번호',
		name: 'planCode'
		}, {
		header: '계획명',
		name: 'planName'
		}, {
		header: '계획일자',
		name: 'planDate'
		}, {
		header: '계획량',
		name: 'planCount',
		}, {
		header: '기지시량',
		name: 'prorCount'
		}, {
		header: '미지시량',
		name: 'unprorCount',
		}, {
		header: '작업량',
		name: 'workCount',
		editor: 'text',
		validation: {
			dataType: 'number',
            required: true
          },
		onAfterChange(ev) {
        	valueInput(ev);
      		}
		}, {
		header: '작업일자',
		name: 'workDate',
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
		}, {
		header: '제품LOT',
		name: 'productLot'
		}, {
		header: '비고',
		name: 'comments',
		editor: 'text'
		}, {
		header: '생산지시번호',
		name: 'prorCode',
		hidden: true
		}, {
		header: '순번',
		name: 'deplanIdx',
		hidden: true
		}
	]
});

const gridInput = new tui.Grid({
	el: document.getElementById('gridInput'),
	scrollX: false,
	scrollY: true,
	data: dataSourceInput,
	columns: [ {
		header: '자재코드',
		name: 'materialCode'
		}, {
		header: '자재명',
		name: 'materialName'
		}, {
		header: '자재 LOT',
		name: 'materialLot'
		}, {
		header: '재고량',
		name: 'materialCount',
		}, {
		header: '투입량',
		name: 'inputCount',
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
		header: '제품LOT',
		name: 'productLot',
		hidden: true
		}, {
		header: '생산지시번호',
		name: 'prorCode',
		hidden: true
		}, {
		header: '순번',
		name: 'inputIdx',
		hidden: true
		} ]
});

// 조회버튼 (모달)
$("#btnProrModal").on("click", function() {
	$('#prorContent').load("prorModal.do");
});

// 초기화 버튼
$("#btnReset").click(function() {
	resetPage();
});


// 지시저장 버튼
$('#btnSave').on('click', function() {
	if(confirm("저장하시겠습니까?")) {
		if (formCheck()) {
			$.ajax({
				type: 'POST',
				url: 'saveProrder.do',
				data: $('#inputFrm').serialize(),
				dataType: 'json',
				async: false,
				success: function(data){
					var prorCode = data.data.contents.prorCode;
					$('#prorCode').val(prorCode);
					grid.setColumnValues('prorCode', prorCode);
				}
			});
			grid.request('modifyData');
			grid.on('successResponse', function(ev){
				var text = JSON.parse(ev.xhr.responseText);
				if(text.check == 'save') {
					grid.readData(1, {prorCode: $('#prorCode').val()}, true);
				}
			});
			gridInput.request('modifyData');
			gridInput.clear();
			toastr.success("저장되었습니다.");
		}
	}
});

// 지시삭제 버튼
$('#btnDel').on('click', function(){
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type: 'POST',
			url: 'deleteProrder.do',
			data: {prorCode: $('#prorCode').val()},
			dataType: 'json',
			success: function(){
				toastr.success("삭제되었습니다.");
				resetPage();
			}
		});
	}
});

// 미지시계획 읽기 버튼
$('#btnRead').on('click', function(){
	var param = $('#dateFrm').serializeObject();
	grid.readData(1, param, true);
});

// 행추가버튼
$('#btnGridAdd').on('click', function(){
	grid.appendRow();
});

// 행삭제버튼
$('#btnGridDel').on('click', function(){
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

// 더블클릭해서 투입자재 설정
grid.on('dblclick', (ev) => {
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');
	var productName = grid.getValue(rowKey, 'productName');
	var workCount = grid.getValue(rowKey, 'workCount');
	var productLot = grid.getValue(rowKey, 'productLot');
	var prorCode = grid.getValue(rowKey, 'prorCode');
	if (productLot != null) {
		$('#workCount').val(workCount);
		$('#productCode').val(productCode);
		$('#productName').val(productName);
		var param = {'productCode': productCode, 'productLot': productLot, 'prorCode': prorCode};
		gridInput.readData(1, param, true);
	}
});

// 제품코드, 작업량 입력시 폼에 입력
function valueInput(ev) {
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');
	var productName = grid.getValue(rowKey, 'productName');
	var workCount = grid.getValue(rowKey, 'workCount');
	var productLot = grid.getValue(rowKey, 'productLot');
	var prorCode = grid.getValue(rowKey, 'prorCode');
	if (productLot != null) {
		$('#workCount').val(workCount);
		$('#productCode').val(productCode);
		$('#productName').val(productName);
		gridInput.setColumnValues('productLot', productLot);
		gridInput.setColumnValues('prorCode', prorCode);
	}
}

// 투입량 합계
function countSum(){
	var inputCount = gridInput.getColumnValues('inputCount');
	var sum = 0;
	for(count of inputCount){
		if (checkNull(count)){
			sum += parseInt(count);
		}
	}
	$('#totalCount').val(sum);
}

// 초기화
function resetPage() {  
	$("form").each(function() {  
        this.reset();
		grid.clear();
		gridInput.clear();
    });  
	$('#prorCode').val('prorCode');
}

// 폼체크
function formCheck() {
	if(!checkNull($('#prorDate').val()) || !checkNull($('#prorName').val())) {
		toastr.warning('지시 정보를 입력해주십시오.');
		return false;
	} else if(checkNull($('#workCount').val()) && ($('#workCount').val() > $('#totalCount').val()) && $('#totalCount').val() != 0) {
		toastr.warning('투입량이 부족합니다.');
		return false;
	} else if(checkNull($('#workCount').val()) && ($('#workCount').val() < $('#totalCount').val())) {
		toastr.warning('투입량이 작업량보다 많습니다.');
		return false;		
	} else {
		return true;
	}
}

// NULL값 체크, NULL이면 false
function checkNull(value) {
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}