$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});


const dataSource = {
	api : {
		readData : {url: contextPath + '/ajax/matInList.do' , method:'GET' }
	},
	contentType: 'application/json'
};
	
const grid = new tui.Grid({
	el : document.getElementById('matInList'),
	data : dataSource,
	scrollX : false,
	scrollY : true,
	bodyHeight: 360,
	rowHeaders: ['checkbox'],
	columns : [ 
		{
			header : '입고번호',
			name : 'ioCode',
			width : 80,
			align: 'center'
		},
		{
			header : '입고일자',
			name : 'ioDate',
			width : 120,
			align: 'center',
			validation: {
            	required: true
          	}
		}, {
			header : '발주번호',
			name : 'inorderCode',
			width : 80,
			align: 'center',
			className: 'white',
			validation: {
            	required: true
          	}
		}, {
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center'
		}, {
			header : '자재명',
			name : 'materialName',
			width : 120,
			align: 'center'
		}, {
			header : '단위',
			name : 'unitNo',
			width : 70,
			align: 'center'
		}, {
			header : '입고량',
			name : 'ioVolume',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		},
			validation: {
				dataType: 'number',
            	required: true
          	}
		}, {
			header : '단가',
			name : 'unitPrice',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		},
			validation: {
				dataType: 'number',
            	required: true
          	}
		}, {
			header : '총액',
			name : 'price',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : 'LOT_NO',
			name : 'lotNo',
			width : 140,
			align: 'center',
			validation: {
            	required: true
          	}
		}, {
			header : '자재재고',
			name : 'stock',
			width : 120,
			align: 'right'
			,formatter({value}) {
      			return format(value);
    		}
 			
		}
	],
	summary : {
		
		height: 40,
	   	position: 'bottom',
	   	columnContent: {
        	inorderCode: {
                template(summary) {
        			return '합 계';
                } 
            },	
			ioVolume: {
                template(summary) {
        			var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            },
			price: {
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
	var param = $('#searchFrm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});

function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "500"
 	};
	toastr.error(text,title);
}

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}


// 모달
var forGrid = false;
// 자재 돋보기
$("#btnMatModal").on("click", function(e) {
	$('#materialCode').val('');
	$('#materialName').val('');
    $('#matContent').load(contextPath +"/matModal.do");
});

// 자재코드 입력창
$('#materialCode').on('click', function(){
	$('#materialCode').val('');
	$('#materialName').val('');
	$('#matModal').modal('show');
	$('#matContent').load(contextPath +"/matModal.do");
});

// 업체 돋보기
$("#btnCompModal").on("click", function(e) {
	$('#companyCode').val('');
	$('#companyName').val('');
    $('#compContent').load(contextPath +"/compModal.do");
});

// 업체코드 입력창
$('#companyCode').on('click',function(){
	$('#companyCode').val('');
	$('#companyName').val('');
	$('#compModal').modal('show');
	$('#compContent').load(contextPath +"/compModal.do");
	
});

var rowKey;
// 발주번호 입력창 그리드



