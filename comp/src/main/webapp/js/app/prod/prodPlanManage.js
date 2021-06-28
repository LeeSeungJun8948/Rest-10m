const grid = new tui.Grid({
	el : document.getElementById('grid'),
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
		header : '주문관리번호',
		name : 'orderNo'
		}, {
		header : '납기일자',
		name : 'outDate'
		}, {
		header : '주문량',
		name : 'orderCount' 
		}, {
		header : '기계획량',
		name : 'projectPlanned'
		}, {
		header : '미계획량',
		name : 'projectUnplanned'
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
              format: 'yyyy/MM/dd'
            }
          }
		}, {
		header : '비고',
		name : 'detail'
	}, ]
});

$(document).on('click', '#btnRead', function(){
	$.ajax({
		url : 'ajax/orderRead.do',
		type : 'post',
		dataType : 'json',
		success : function(data){
			gridData = [];
			data.forEach( function(item,index) {
				vo = {
					companyCode : item.companyCode,
					orderCount : item.orderCount,
					productCode : item.productCode
				}
				gridData.push(vo);
			});
			grid.resetData(gridData);
		}
	});
});