$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});

// 그리드
const dataSource = {
	api : {
		readData : { url: 'ajax/inspectionList.do', method:'GET' },
		deleteData : { url : 'ajax/deleteIns.do', method : 'POST' },
		createData : { url : 'ajax/insertIns.do', method : 'POST' },
		updateData : { url : 'ajax/updateIns.do', method : 'PUT'},
		modifyData : { url : 'ajax/modifyIns.do', method : 'PUT'}
	},
	contentType: 'application/json'
}
const grid = new tui.Grid({
	el : document.getElementById('grid'),
	data : dataSource,
	scrollX : false,
	scrollY : false,
	rowHeaders : [ 'checkbox' ],
	columns : [ {
		header : '정기점검코드',
		name : 'inspectionCode'
	}, {
		header : '판정',
		name : 'judgement',
		editor: 'text'
	}, {
		header : '조치사항',
		name : 'insComment',
		editor: 'text'
	}, {
		header : '전점검일',
		name : 'beforeDate'
	}, {
		header : '점검일',
		name : 'today',
		editor: {
			type: 'datePicker',
			options: {
			language: 'ko',
			format: 'YYYY-MM-dd'
			}
		}
			
	}, {
		header : '차기점검일',
		name : 'afterDate'
	}, {
		header : '설비코드',
		name : 'facCode',
		editor: 'text'
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

// 조회
$('#btnRead').on('click',  function(){
	var param = $('#frm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});

//삭제
$("#btnDel").on("click", function() {
	grid.removeCheckedRows(true);
});

// 행추가
$("#btnAdd").on("click", function(){
	grid.appendRow({},{
		at : grid.getRowCount(),
		focus : true
	});
});

// 저장
$("#btnSave").on("click", function(){
	grid.request('modifyData');
});

