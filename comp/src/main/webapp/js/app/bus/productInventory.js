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
	columns: [{
		header: '제품코드',
		name: 'productCode',
		align: 'center'
	}, {
		header: '제품명',
		name: 'productName',
		align: 'center'
	},  {
		header: '제품LOT',
		name: 'productLot',
		align: 'center'
	}, {
		header: '제품재고',
		name: 'productCount',
		align: 'right'
	},{
		header: '규격',
		name: 'stdNo',
		align: 'center'
	}, {
		header: '단위',
		name: 'unitNo',
		align: 'center'
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
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
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

