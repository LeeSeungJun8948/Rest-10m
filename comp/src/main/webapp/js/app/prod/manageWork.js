var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'searchWork.do', method: 'POST' },
		deleteData: { url: 'deleteWork.do', method: 'POST' },
  }
}

const grid = new tui.Grid({
	el: document.getElementById('grid'),
	scrollX: false,
	scrollY: true,
	data: dataSource, 
	rowHeaders: ['checkbox'],
	columns: [ {
		header: '작업번호',
		name: 'workNo',
		hidden: true
		}, {
		header: '작업공정',
		name: 'workDiv',
		}, {
		header: '작업일자',
		name: 'workDate',
		}, {
		header: '제품코드',
		name: 'productCode',
		}, {
		header: '작업량',
		name: 'workCount',
		}, {
		header: '불량량',
		name: 'errorCount',
		}
	]
});

// 작업등록 모달
$("#btnModal").on("click", function(e) {
    $('#workContent').load("workModal.do");
});

// 조회 버튼
$('#btnSearch').on('click', function(){
	var param = $('#frm').serializeObject();
	grid.readData(1, param, true);
});

// 초기화 버튼
$("#btnReset").click(function() {
	resetPage();
});

// 행삭제버튼
$('#btnGridDel').on('click', function(){
	grid.removeCheckedRows(false);
	grid.request('deleteData');
});

// 초기화
function resetPage() {  
	$("form").each(function() {  
        this.reset();
		grid.clear();
    });  
}

// NULL값 체크, NULL이면 false
function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}