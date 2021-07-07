
var dataSource = {
	api : {
		readData : {url: 'ajax/busList.do', method:'POST' }
	},
	contentType: 'application/json'
			
};
	
	
const grid = new tui.Grid({
	el : document.getElementById('grid'),
	data : dataSource,
	scrollX : false,
	scrollY : false,
	rowHeaders: ['checkbox'],
	columns : [ {
		header : '진행구분',
		name : 'orderState'
	}, {
		header : '업체명',
		name : 'compName'
	}, {
		header : '주문번호',
		name : 'orderNo'
	}, {
		header : '제품코드',
		name : 'productCode'
	}, {
		header : '제품명',
		name : 'productName'
	}, {
		header : '규격',
		name : 'unitId'
	}, {
		header : '단위',
		name : 'stdId'
	}, {
		header : '접수일자',
		name : 'inDate'
	}, {
		header : '납기일자',
		name : 'outDate'
	}, {
	header : '주문량',
		name : 'orderCount'
	}, {
		header : '출고량',
		name : 'outCount'
	},{
		header : '미납품량',
		name : 'notCount'
	}, {
		header : '비   고',
		name : 'remark'
	} ], 
	summary:{
	    height:40,
	    position:'bottom',
	    columnContent:{
	    	companyName:{
	            template(summary) {
	                return '합계';
	            } 
	        },
	        orderCount:{
	            template(summary) {
	                return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	            }
	        },
	        kg:{
	            template(summary) {
	                return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	            }
	        },
	        notCount:{
	            template(summary) {
	                return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	            }
	        }
	    }
	},
	columnOptions: {
	    resizable : true
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
$('#searchBtn').on('click',function(){
		   var param = $('#dataForm').serializeObject();
		   console.log(param)
		   grid.readData(1, param, true);
		});
$('#resetBtn').on('click', function(){
	grid.clear();
});
	
function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

$("#btnCompModal").on("click", function(e) {
    $('#compContent').load("compModalForProd.do");
});

// ???????
$(document).on('show.bs.modal','#btnCompModal', function () {
});