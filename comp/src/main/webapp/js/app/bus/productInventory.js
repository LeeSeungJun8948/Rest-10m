var dataSource = {
	api: {
		readData: { url: contextPath+'/ajax/productInventory.do', method: 'POST' }
	},
	contentType: 'application/json'

};


const grid = new tui.Grid({
	el: document.getElementById('grid'),
	data: dataSource,
	dataType:'local',
	scrollX: false,
	scrollY: false,
	rowHeaders: ['checkbox'],
	columns: [{
		header: '제품코드',
		name: 'productCode'
	}, {
		header: '제품명',
		name: 'productName'
	},  {
		header: '제품LOT_NO',
		name: 'productLot'
	}, {
		header: '제품재고',
		name: 'productCount'
	},{
		header: '규격',
		name: 'stdId'
	}, {
		header: '단위',
		name: 'unitId'
	},
	], summary: {
		height: 40,
		position: 'bottom',
		columnContent: {
			productName: {
				template(summary) {
					return '합계';
				}
			},
			productCount: {
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


//조회버튼
$('#btnView').on('click', function() {
	var param = $('#inputFrm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});
$('#btnReset').on('click', function() {
	resetPage();
});
function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

// 초기화
function resetPage() {
	$("form").each(function() {
		this.reset();
	});
	grid.clear();
}
//모달
var forGrid = false;
$("#btnProdModal").on("click", function(e) {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
});
$("#productCode").on("click", function(e) {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
});

$("#productName").on("click", function(e) {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
});
$("#productLot").on("click", function(e) {
	$('#modalContent').load(contextPath+"/modal/prodLotModal.do");
});

$("#btnProdLotModal").on("click", function(e) {
	$('#modalContent').load(contextPath+"/modal/prodLotModal.do");
});
// ???????
$(document).on('show.bs.modal','#btnProdLotModal', function () {
});

