var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: 'viewExportSearch.do', method: 'POST' },
	}
}

const grid = new tui.Grid({
	el: document.getElementById('grid'),
	scrollX: false,
	scrollY: true,
	data: dataSource,
	columns: [{
		header: '출고일자',
		name: 'exportDate',
	}, {
		header: '제품코드',
		name: 'productCode',
	}, {
		header: '제품명',
		name: 'productName',
	}, {
		header: '출고코드',
		name: 'exportCode',
	}, {
		header: '규격',
		name: 'stdId'
	}, {
		header: '단위',
		name: 'unitId'
	}, {
		header: '주문번호',
		name: 'orderNo',
	}, {
		header: '업체명',
		name: 'companyName',
	}, {
		header: '주문량',
		name: 'orderCount'
	}, {
		header: '출고량',
		name: 'exportCount',
	}, {
		header: '금액',
		name: 'price',
	}, {
		header: '비고',
		name: 'comments',
	}]
});

// 조회 버튼
$('#btnSearch').on('click', function() {
	var param = $('#searchFrm').serializeObject();
	grid.readData(1, param, true);
});

// 초기화 버튼
$("#btnReset").click(function() {
	resetPage();
});

//모달
$("#btnCompModal").on("click", function() {
	$('#compContent').load("compModal.do");
});

$("#btnProdModal").on("click", function() {
	$('#prodContent').load("prodModal.do");
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
