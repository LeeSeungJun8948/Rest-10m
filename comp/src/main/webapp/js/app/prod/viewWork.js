$(document).ready(function() {	
	document.getElementById('workDtS').valueAsDate = new Date();
	document.getElementById('workDtE').valueAsDate = new Date();
});

var dataSourceWork = {
	contentType: 'application/json',
	api: {
		readData: { url: 'searchWork.do', method: 'POST' },
  }
}

const workGrid = new tui.Grid({
	el: document.getElementById('workGrid'),
	scrollX: false,
	scrollY: false,
	data: dataSourceWork,
	columns: [ {
		header: '작업번호',
		name: 'workCode',
		hidden: true
		}, {
		header: '공정코드',
		name: 'processCode',
		hidden: true
		}, {
		header: '시작시간',
		name: 'startTime',
		hidden: true
		}, {
		header: '종료시간',
		name: 'endTime',
		hidden: true
		}, {
		header: '사원번호',
		name: 'empCode',
		hidden: true
		}, {
		header: '사원이름',
		name: 'employeeName',
		hidden: true
		}, {
		header: '불량코드',
		name: 'errorCode',
		hidden: true
		}, {
		header: '사원이름',
		name: 'empName',
		hidden: true
		}, {
		header: '주문번호',
		name: 'orderNo',
		hidden: true
		}, {
		header: '설비명',
		name: 'facilitiesName',
		hidden: true
		}, {
		header: '작업공정',
		name: 'processName',
		}, {
		header: '작업일자',
		name: 'workDate',
		}, {
		header: '제품코드',
		name: 'productCode',
		}, {
		header: '제품명',
		name: 'productName',
		}, {
		header: '제품LOT',
		name: 'productLot',
		}, {
		header: '작업량',
		name: 'workCount',
		}, {
		header: '불량량',
		name: 'errorCount',
		}, {
		header: '불량명',
		name: 'errorName',
		}, ], summary: {
			height: 40,
			position: 'bottom',
			columnContent: {
				productLot: {
					template(summary) {
						return '합계:';
					}
				},
				workCount: {
					template(summary) {
						return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					}
				},
				errorCount: {
					template(summary) {
						return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					}
				}
			}
		},
		columnOptions: {
			resizable: true
		}
});

// 조회 버튼
$('#btnSearch').on('click', function(){
	var param = $('#searchFrm').serializeObject();
	workGrid.readData(1, param, true);
});

// 초기화 버튼
$("#btnReset").click(function() {
	resetPage();
});

// 더블클릭 모달
workGrid.on('dblclick', (ev) => {
	var workCode = workGrid.getValue(ev.rowKey, 'workCode');
	var processCode = workGrid.getValue(ev.rowKey, 'processCode');
	var startTime = workGrid.getValue(ev.rowKey, 'startTime');
	var endTime = workGrid.getValue(ev.rowKey, 'endTime');
	var empCode = workGrid.getValue(ev.rowKey, 'empCode');
	var empName = workGrid.getValue(ev.rowKey, 'employeeName');
	var errorCode = workGrid.getValue(ev.rowKey, 'errorCode');
	var errorName = workGrid.getValue(ev.rowKey, 'errorName');
	var workDate = workGrid.getValue(ev.rowKey, 'workDate');
	var productCode = workGrid.getValue(ev.rowKey, 'productCode');
	var productName = workGrid.getValue(ev.rowKey, 'productName');
	var productLot = workGrid.getValue(ev.rowKey, 'productLot');
	var workCount = workGrid.getValue(ev.rowKey, 'workCount');
	var errorCount = workGrid.getValue(ev.rowKey, 'errorCount');
	var orderNo = workGrid.getValue(ev.rowKey, 'orderNo');
	var facilitiesName = workGrid.getValue(ev.rowKey, 'facilitiesName');
	$('#productLot').val(productLot);
	$('#workCode').val(workCode);
	$('#workDiv').val(processCode);
	$('#startTime').val(startTime);
	$('#endTime').val(endTime);
	$('#empCode').val(empCode);
	$('#empName').val(empName);
	$('#errorCode').val(errorCode);
	$('#errorName').val(errorName);
	$('#workDate').val(workDate);
	$('#productCode').val(productCode);
	$('#productName').val(productName);
	$('#workCount').val(workCount);
	$('#errorCount').val(errorCount);
	$('#facilitiesName').val(facilitiesName);
	$('#orderNo').val(orderNo);
	$("#workViewModal").modal();
});

// 초기화
function resetPage() {  
	$("form").each(function() {  
        this.reset();
		workGrid.clear();
    });  
}

// NULL값 체크, NULL이면 false
function checkNull(value) {
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}