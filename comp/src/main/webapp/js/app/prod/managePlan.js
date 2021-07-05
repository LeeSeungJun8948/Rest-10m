var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'readUnplanOrders.do', method: 'POST' },
		modifyData: { url: 'saveGrid.do', method: 'PUT' },
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
	scrollY: true,
	data: dataSource, 
	rowHeaders: ['checkbox'],
	columns: [ {
		header: '제품코드',
		name: 'productCode',
		editor: 'text',
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
		header: '주문번호',
		name: 'orderNo'
		}, {
		header: '납기일자',
		name: 'outDate'
		}, {
		header: '주문량',
		name: 'orderCount',
		align: 'right' 
		}, {
		header: '기계획량',
		name: 'planCount'
		}, {
		header: '미계획량',
		name: 'unplanCount',
		}, {
		header: '작업량',
		name: 'workCount',
		editor: 'text',
		onAfterChange(ev) {
        	valueInput(ev);
      		}
		}, {
		header: '일생산량',
		name: 'dayCount'
		}, {
		header: '생산일수',
		name: 'workDay'
		}, {
		header: '작업일자',
		name: 'workDate',
		editor: {
            type: 'datePicker',
            options: {
				language: 'ko',
            	format: 'yyyy-MM-dd'
            }
          }
		}, {
		header: '제품LOT',
		name: 'productLot',
		}, {
		header: '비고',
		name: 'comments',
		editor: 'text'
		}, {
		header: '생산계획번호',
		name: 'planCode',
		hidden: true
		}
	]
});

const gridInput = new tui.Grid({
	el: document.getElementById('gridInput'),
	scrollX: false,
	scrollY: true,
	data: dataSourceInput,
	async: false,
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
		header: '순번',
		name: 'inputIdx',
		hidden: true
		}  ]
});

// 조회 버튼
$('#btnView').on('click', function(){
});

// 초기화 버튼
$(document).ready(function() {  
    $("#btnReset").click(function() {  
         $("form").each(function() {  
            this.reset();  
			grid.clear();
			gridInput.clear();
         });  
    });  
});  

// 계획저장 버튼
$('#btnSave').on('click', function(){
	grid.request('modifyData');
	gridInput.request('modifyData');
	$('#inputFrm').submit();
	toastr.success("저장되었습니다.");
});

// 계획삭제 버튼
$('#btnDel').on('click', function(){
	$.ajax({
		type: 'POST',
		url: 'deletePlan.do',
		data: $('#planCode').val(),
		dataType: 'json',
		success: function(data){
			toastr.success("삭제되었습니다.");
		}
	});
});

// 미생산 읽기 버튼
$('#btnRead').on('click',  function(){
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
	var productLot = grid.getValue(rowKey, 'productLot');
	var productCode = grid.getValue(rowKey, 'productCode');
	var productName = grid.getValue(rowKey, 'productName');
	var workCount = grid.getValue(rowKey, 'workCount');	
	var param = {'productCode': productCode, 'productLot': productLot};
	gridInput.readData(1, param, true);
	$('#workCount').val(workCount);
	$('#productCode').val(productCode);
	$('#productName').val(productName);
});

// 제품코드, 작업량 입력시 폼에 입력
function valueInput(ev) {
	var rowKey = ev.rowKey;
	var productCode = grid.getValue(rowKey, 'productCode');
	var productName = grid.getValue(rowKey, 'productName');
	var workCount = grid.getValue(rowKey, 'workCount');	
	$('#workCount').val(workCount);
	$('#productCode').val(productCode);
	$('#productName').val(productName);
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

// NULL값 체크, NULL이면 false
function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}