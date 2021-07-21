$(document).ready(function() {
	document.getElementById('searchDtS').valueAsDate = new Date();
	document.getElementById('searchDtE').valueAsDate = new Date();
});


var dataSource = {
	contentType: 'application/json',
	api: {
		readData: { url: contextPath+'/ajax/viewExportSearch.do', method: 'POST' },
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
		name: 'stdNo'
	}, {
		header: '단위',
		name: 'unitNo'
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

var forGrid = false;
//모달
$("#btnCompModal").on("click", function() {
	$('#compContent').load(contextPath+"/modal/compModalForProd.do");
});

$("#companyCode").on("click", function() {
	$('#compContent').load(contextPath+"/modal/compModalForProd.do");
});

$("#companyName").on("click", function() {
	$('#compContent').load(contextPath+"/modal/compModalForProd.do");
});

$("#btnProdModal").on("click", function() {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
});

$("#productCode").on("click", function() {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
});

$("#productName").on("click", function() {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
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
