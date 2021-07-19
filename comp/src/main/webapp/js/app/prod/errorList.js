var dataSource = {
	api: {
		readData: { url: 'ajax/detailErrorList.do', method: 'get' },
	},
	contentType: 'application/json'
};

var errorGrid = new tui.Grid({
	el: document.getElementById('errorGrid'),
	data: dataSource,
	scrollX: false,
	scrollY: false,
	columns: [{
		header: '공정명',
		name: 'processName'
	}, {
		header: '작업일자',
		name: 'workDate'
	}, {
		header: '작업량',
		name: 'workCount'
	}, {
		header: '불량량',
		name: 'errorCount'
	}, {
		header: '제품코드',
		name: 'productCode'
	}, {
		header: '제품명',
		name: 'productName'
	}, {
		header: '제품LOT',
		name: 'productLot'
	}, {
		header: '작업지시번호',
		name: 'workCode'
	}, {
		header: '불량명',
		name: 'errorName'
	}], summary: {
		height: 40,
		position: 'bottom',
		columnContent: {
			workDate: {
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

$('#btnRead').on('click', function() {
	var param = $('#frm').serializeObject();
	errorGrid.readData(1, param, true);
});

$("#btnProdModal").on("click", function() {
    $('#prodContent').load("prodSearchModal.do");
});

// NULL값 체크, NULL이면 false
function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}