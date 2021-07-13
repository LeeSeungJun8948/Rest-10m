var dataSource = {
	api: {
		readData: { url: 'ajax/productInventory.do', method: 'POST' }
	},
	contentType: 'application/json'

};


const grid = new tui.Grid({
	el: document.getElementById('grid'),
	data: dataSource,
	scrollX: false,
	scrollY: false,
	rowHeaders: ['checkbox'],
	columns: [{
		header: '제품코드',
		name: 'productCode'
	}, {
		header: '제품명',
		name: 'productName'
	}, {
		header: '규격',
		name: 'stdId'
	}, {
		header: '단위',
		name: 'unitId'
	}, {
		header: '제품LOT_NO',
		name: 'productLot'
	}, {
		header: '제품재고',
		name: 'productCount'
	}, {
		header: '제품상태',
		name: 'productState'
	}, {
		header: '비   고',
		name: 'remark'
	}
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
$('#resetBtn').on('click', function() {
	grid.clear();
});
function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
//모달
var forGrid = false;
$("#btnProdModal").on("click", function(e) {
	$('#prodContent').load("prodModal.do");
});
// ???????
$(document).on('show.bs.modal', '#btnCompModal', function() {
});

