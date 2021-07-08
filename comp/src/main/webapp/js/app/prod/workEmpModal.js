const dataSource = {
	api : {
		readData : {
		url : 'ajax/bomList.do',
		method : 'GET'
		},
	},
	contentType : 'application/json'
};

const matGrid = new tui.Grid({
	el : document.getElementById('matGrid'),
	data : dataSource,
	scrollX : false,
	scrollY : false,
	rowHeaders : [ 'rowNum' ],
	columns : [ {
		header : '제품코드',
		name : 'productCode',
		}, {
		header : '제품명',
		name : 'productName',
		}, {
		header : '규격',
		name : 'unitNo',
		} ]
});

matGrid.on('click', function(ev) {
	var values = matGrid.getRow(ev.rowKey);
	var prdCode = values.productCode;
	$('#productCode').val(prdCode);
	console.log(prdCode);
});

$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
				}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

$("#btnCheck").on("click", function() {
	var param = $('#productSearchForm').serializeObject();
	matGrid.readData(1, param, true);
})

function fnSearch() {
	$("#frm").submit();
}

// bom 자재리스트 버튼
$('#btnSearch').on('click', function() {
	var prm = $('#frm').serializeObject();
	grid.readData(1, prm, true);
})