$(document).ready(function() {	
	document.getElementById('searchDtS').valueAsDate = new Date();
	document.getElementById('searchDtE').valueAsDate = new Date();
});

var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'viewPlanSearch.do', method: 'POST' },
  }
}

const grid = new tui.Grid({
	el: document.getElementById('grid'),
	scrollX: false,
	scrollY: false,
	data: dataSource,
	columns: [ {
		header: '계획일자',
		name: 'planDate',
		align: 'center'
		}, {
		header: '계획명',
		name: 'planName',
		align: 'center'
		}, {
		header: '제품코드',
		name: 'productCode',
		align: 'center'
		}, {
		header: '제품명',
		name: 'productName',
		align: 'center'
		}, {
		header: '주문번호',
		name: 'orderNo',
		align: 'center'
		}, {
		header: '업체명',
		name: 'companyName',
		align: 'center'
		}, {
		header: '납기일자',
		name: 'outDate',
		align: 'center'
		}, {
		header: '주문량',
		name: 'orderCount',
		align: 'right'
		}, {
		header: '계획량',
		name: 'planCount',
		align: 'right'
		}, {
		header: '작업일자',
		name: 'workDate',
		align: 'center'
		}, {
		header: '비고',
		name: 'comments',
		align: 'center'
		} ], summary: {
			height: 40,
			position: 'bottom',
			columnContent: {
				outDate: {
					template(summary) {
						return '합계:';
					}
				},
				orderCount: {
					template(summary) {
						return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
					}
				},
				planCount: {
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
	grid.readData(1, param, true);
});

// 초기화 버튼
$("#btnReset").click(function() {
	resetPage();
});

//모달
var forGrid = false;
$("#btnCompModal").on("click", function() {
    $('#compContent').load("compSearchModal.do");
});

$("#btnProdModal").on("click", function() {
    $('#prodContent').load("prodSearchModal.do");
});

// 초기화
function resetPage() {  
	$("form").each(function() {  
        this.reset();
		grid.clear();
    });  
	$("#companyCode").val("");
	$("#productCode").val("");
}

// NULL값 체크, NULL이면 false
function checkNull(value) {
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}