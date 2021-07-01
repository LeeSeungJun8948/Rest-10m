var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'unplanOrderRead.do', method: 'POST' },
		modifyData: { url: 'gridSave.do', method: 'PUT' },
	}
}
const grid = new tui.Grid({
	el : document.getElementById('grid'),
	scrollX : false,
	scrollY : false,
	data : dataSource, 
	rowHeaders: ['checkbox'],
	columns : [ {
		header : '제품코드',
		name : 'productCode',
		editor: 'text'
		}, { 
		header : '제품명',
		name : 'productName'
		}, {
		header : '규격',
		name : 'orderNo'
		}, {
		header : '단위',
		name : 'outDate'
		}, {
		header : '주문번호',
		name : 'orderCount',
		align : 'right' 
		}, {
		header : '기출고량',
		name : 'planCount'
		}, {
		header : '미출고량',
		name : 'unplanCount',
		}, {
		header : '출고량',
		name : 'workCount',
		editor: 'text'
		}, {
		header : '현재고',
		name : 'dayCount'
		}, {
		header : '소재LOT.no',
		name : 'workingDay'
		}, {
		header : '단가',
		name : 'workDate',
		
		}, {
		header : '금액',
		name : 'workDate',
		
		},{
		header : '비고',
		name : 'detail',
		editor: 'text'
		}
	]
});

// 조회 버튼
$('#btnView').on('click', function(){
});

// 새자료 버튼
$('#btnReset').on('click', function(){
	grid.clear();
});

// 저장 버튼
$('#btnSave').on('click', function(){
	$.ajax({
		type: 'post',
		url: 'planSave.do',
		data: $('#inputFrm').serialize(),
		dataType: 'json',
		async: false,
		success: function(data){
		alert("저장되었습니다.");
		}
	});
	grid.request('modifyData');
});

// 삭제 버튼
$('#btnDel').on('click', function(){
	
});

// 미생산 읽기 버튼
$('#btnRead').on('click',  function(){
	var param = $('#dateFrm').serializeObject();
	grid.readData(1, param, true);
});

// 추가버튼
$('#btnGridAdd').on('click', function(){
	grid.appendRow();
});

// 삭제버튼
$('#btnGridDel').on('click', function(){
	grid.removeCheckedRows(false);
});

// 전체체크 선택
grid.on('check', ev => {
});

// 전체체크 해제
grid.on('uncheck', ev => {
});

