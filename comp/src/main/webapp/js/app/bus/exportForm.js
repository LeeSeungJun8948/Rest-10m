var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'readUnExport.do', method: 'POST' },
		modifyData: { url: 'gridSave.do', method: 'PUT' },
	}
}

const grid = new tui.Grid({
	el : document.getElementById('grid'),
	data : dataSource,
			scrollX : false,
			scrollY : false,
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
		name : 'stdId'
		}, {
		header : '단위',
		name : 'unitId'
		}, {
		header : '주문번호',
		name : 'orderNo',
		align : 'right' 
		}, {
		header : '기출고량',
		name : 'outCount'
		}, {
		header : '미출고량',
		name : 'unExport',
		}, {
		header : '출고량',
		name : 'exportCount',
		editor: 'text'
		}, {
		header : '현재고',
		name : 'dayCount'
		}, {
		header : '제품LOT.no',
		name : 'productLot'
		}, {
		header : '금액',
		name : 'price',
		
		},{
		header : '비고',
		name : 'comments',
		editor: 'text'
		}
	]
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
$('#btnView').on('click', function(){
});

// 새자료 버튼
$('#btnReset').on('click', function(){
	grid.clear();
});

// 저장 버튼
$('#btnSave').on('click', function(){
	$.ajax({
		type: 'POST',
		url: 'saveExport.do',
		data: $('#inputFrm').serialize(),
		dataType: 'json',
		success: function(data){
		}
	});
	grid.request('modifyData');
	toastr.success("저장되었습니다.");
});

// 삭제 버튼
$('#btnDel').on('click', function(){
	
});

// 미출고 읽기 버튼
$('#btnRead').on('click',  function(){
	var param = $('#dateForm').serializeObject();
	console.log(param)
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

