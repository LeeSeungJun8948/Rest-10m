

$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});


	const dataSource = {
		api : {
			readData : {url: 'ajax/inorderList.do' , method:'GET' },
		},
		contentType: 'application/json'
	};
	
	const grid = new tui.Grid({
		el : document.getElementById('inorderList'),
		data : dataSource,
		scrollX : false,
		scrollY : true,
		bodyHeight: 360,
		columns : [ 
			{
				header : '발주번호',
				name : 'inorderCode',
				width : 80,
				align: 'center'
			}, {
				header : '발주일자',
				name : 'inorderDate',
				width : 120,
				align: 'center'
			}, {
				header : '자재코드',
				name : 'materialCode',
				width : 80,
				align: 'center'
			}, {
				header : '자재명',
				name : 'materialName',
				width : 120,
				align: 'left'
			}, {
				header : '발주업체',
				name : 'companyName',
				width : 120,
				align: 'center'
			}, {
				header : '입고일자',
				name : 'inDate',
				width : 120,
				align: 'center'
			}, {
				header : '발주량',
				name : 'inorderCount',
				width : 120,
				align: 'right',
				formatter({value}) {
	      			return format(value);
	    		}
			}, {
				header : '입고량',
				name : 'inCount',
				width : 120,
				align: 'right',
				formatter({value}) {
	      			return format(value);
	    		}
			}, {
				header : '미입고량',
				name : 'yetCount',
				width : 120,
				align: 'right',
				formatter({value}) {
	      			return format(value);
	    		}
			}, {
				header : '비고',
				name : 'comments',
				width : 210,
				align: 'right'
			} 
		],
		summary : {
			
			height: 40,
		   	position: 'bottom',
		   	columnContent: {
	        	inDate: {
	                template(summary) {
	        			return '합 계';
	                } 
	            },	
				inorderCount: {
	                template(summary) {
						var summaryResult = (summary.sum);
	        			return format(summaryResult);
	                } 
	            },
				inCount: {
	                template(summary) {
	        			var summaryResult = (summary.sum);
	        			return format(summaryResult);
	                } 
	            },
				yetCount: {
	                template(summary) {
	        			var summaryResult = (summary.sum);
	        			return format(summaryResult);
	                } 
	            }
			}
		}
	});
	
	function format(value){
		value = value * 1;
		return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}

$('#btnRead').on('click',  function(){
	var param = $('#frm').serializeObject();
	console.log(param);
	grid.readData(1, param, true);
});

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

// 모달 오픈
var forGrid = false;
// 자재 돋보기
$("#btnMatModal").on("click", function(e) {
	$('#materialCode').val('');
	$('#materialName').val('');
    $('#matContent').load("matModal.do");
});

// 자재코드 입력창
$('#materialCode').on('click', function(){
	$('#materialCode').val('');
	$('#materialName').val('');
	$('#matModal').modal('show');
	$('#matContent').load("matModal.do");
});

// 업체 돋보기
$("#btnCompModal").on("click", function(e) {
	$('#companyCode').val('');
	$('#companyName').val('');
    $('#compContent').load("compModal.do");
});

// 업체 코드 입력창
$('#companyCode').on('click', function(){
	$('#companyCode').val('');
	$('#companyName').val('');
	$('#compModal').modal('show');
	$('#compContent').load("compModal.do");
});

