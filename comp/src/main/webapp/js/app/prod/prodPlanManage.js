var dataSource = {
  withCredentials: false,  
  initialRequest: true,
  api: {
      readData: { url: 'unplanOrderRead.do', method: 'POST' },
      modifyData: { url: 'gridSave.do', method: 'POST' }
      deleteData: { url: '', method: 'DELETE' },
  },
	contentType: 'application/json'
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
		header : '주문관리번호',
		name : 'orderNo'
		}, {
		header : '납기일자',
		name : 'outDate'
		}, {
		header : '주문량',
		name : 'orderCount',
		align : 'right' 
		}, {
		header : '기계획량',
		name : 'orderPlanCount'
		}, {
		header : '미계획량',
		name : 'orderUnplanCount',
		}, {
		header : '작업량',
		name : 'toWork',
		editor: 'text'
		}, {
		header : '일생산량',
		name : 'dayCount'
		}, {
		header : '생산일수',
		name : 'workingDay'
		}, {
		header : '작업일자',
		name : 'workDate',
		editor: {
            type: 'datePicker',
            options: {
				language: 'ko',
            	format: 'yyyy-MM-dd'
            }
          }
		}, {
		header : '비고',
		name : 'detail',
		editor: 'text'
	}, ],
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
	var param = $('#inputFrm').serializeObject();
	$.ajax({
		url: 'planSave.do',
		data: param,
		success: function(data){
			console.log('성공')
		}
	})
	
	/*grid.request('modifyData');*/
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

