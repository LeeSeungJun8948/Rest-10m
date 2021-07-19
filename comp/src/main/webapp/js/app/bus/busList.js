$(document).ready(function() {
	document.getElementById('fromDate').valueAsDate = new Date();
	document.getElementById('toDate').valueAsDate = new Date();
});

var dataSource = {
	api : {
		readData : {url: contextPath+'/ajax/busList.do', method:'POST' }
	},
	contentType: 'application/json'
			
};
	
	
const grid = new tui.Grid({
	el : document.getElementById('grid'),
	data : dataSource,
	scrollX : false,
	scrollY : false,
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
		name : 'stdId'
	}, {
		header : '단위',
		name : 'unitId'
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
		name : 'comments'
	} ], 
	summary:{
	    height:40,
	    position:'bottom',
	    columnContent:{
	    	productName:{
	            template(summary) {
	                return '합 계';
	            } 
	        },
	        orderCount:{
	            template(summary) {
	                return (summary.sum).toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	            }
	        },
	        outCount:{
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
	resetPage();
});
	
function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

// 초기화
// 초기화
function resetPage() {
	$("form").each(function() {
		this.reset();
	});
	grid.clear();
}


//모달
var forGrid = false;
$("#companyCode").on("click", function(e) {
    $('#compContent').load(contextPath+"/modal/compModalForProd.do");
});
$("#companyName").on("click", function(e) {
    $('#compContent').load(contextPath+"/modal/compModalForProd.do");
});
$("#productCode").on("click", function(e) {
    $('#prodContent').load(contextPath+"/modal/prodModal.do");
});
$("#productName").on("click", function(e) {
    $('#prodContent').load(contextPath+"/modal/prodModal.do");
});
$("#btnCompModal").on("click", function(e) {
	$('#compContent').load(contextPath+"/modal/compModalForProd.do");
});
$("#btnProdModal").on("click", function(e) {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
});
// ???????
$(document).on('show.bs.modal','#btnCompModal', function () {
});


