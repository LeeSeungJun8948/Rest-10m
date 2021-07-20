var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'viewProrderSearch.do', method: 'POST' },
  }
}

const grid = new tui.Grid({
	el: document.getElementById('grid'),
	scrollX: false,
	scrollY: true,
	data: dataSource,
	columns: [ {
		header: '지시일자',
		name: 'prorDate',
		}, {
		header: '지시명',
		name: 'prorName'
		}, {
		header: '제품코드',
		name: 'productCode',
		}, {
		header: '제품명',
		name: 'productName',
		}, {
		header: '주문번호',
		name: 'orderNo',
		}, {
		header: '업체명',
		name: 'companyName',
		}, {
		header: '납기일자',
		name: 'outDate',
		}, {
		header: '주문량',
		name: 'orderCount',
		}, {
		header: '지시량',
		name: 'prorCount',
		}, {
		header: '작업일자',
		name: 'workDate',
		}, {
		header: '비고',
		name: 'comments',
		}], summary: {
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
				prorCount: {
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
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
