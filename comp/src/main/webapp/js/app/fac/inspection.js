/*const dataSource = {
	api : {
		readData : {url: 'ajax/inspectionList.do',
					method:'GET' }
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
		name : 'judgement'
	}, {
		header : '조치사항',
		name : 'insComment'
	}, {
		header : '전점검일',
		name : 'beforeDate'
	}, {
		header : '점검일',
		name : 'today'
	}, {
		header : '차기점검일',
		name : 'afterDate'
	}, {
		header : '설비코드',
		name : 'facCode'
	}]
});

$('#btnRead').on('click',  function(){
	var param = $('#frm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});*/