$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});

const dataSource = {
	api : {
		readData : {url: contextPath + '/ajax/matOutList.do' , method:'GET' }
	},
	contentType: 'application/json'
};
	
const grid = new tui.Grid({
	el : document.getElementById('matOutList'),
	data : dataSource,
	scrollX : false,
	scrollY : true,
	bodyHeight: 360,
	rowHeaders: ['checkbox'],
	columns : [ 
		{
			header : '출고번호',
			name : 'ioCode',
			width : 80,
			align: 'center',
			sortable: true
		},
		{
			header : '출고일자',
			name : 'ioDate',
			width : 120,
			align: 'center',
			validation: {
            	required: true
          	},
			sortable: true
		},
		{
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center',
			className: 'white',
			onAfterChange(ev) {
        		setMatInfo(ev);
      		},
			validation: {
            	required: true
          	},
			sortable: true
		}, {
			header : '자재명',
			name : 'materialName',
			width : 150,
			align: 'center',
			sortable: true
		}, {
			header : '출고량',
			name : 'ioVolume',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		},
			validation: {
				dataType: 'number',
            	required: true
          	},
			sortable: true
		}, {
			header : '단위',
			name : 'unitNo',
			width : 70,
			align: 'center'
		}, {
			header : '자재LOT_NO',
			name : 'lotNo',
			width : 150,
			align: 'center',
			className: 'white',
			validation: {
            	required: true
          	}
		}, {
			header : '출고공정',
			name : 'processName',
			width : 120,
			align: 'center',	
			className: 'white',
			validation: {
            	required: true
          	}
		}, {
			header : '자재재고',
			name : 'stock',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '비고',
			name : 'comments',
			width : 160,
			align: 'center'
		}

	],
	summary : {
		
		height: 40,
	   	position: 'bottom',
	   	columnContent: {
        	ioCode: {
                template(summary) {
        			return '합 계';
                } 
            },	
			ioVolume: {
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

var rowKey;
var materialCode;

(function($) {
	
$('#btnRead').on('click',  function(){
	var param = $('#searchFrm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});

})(jQuery);

function checkNull(value){
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}

function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "200"
 	};
	toastr.error(text,title);
}

//excel
$("#btnExcel").on("click", function(e) {

	var data = grid.getData();
	for(var i = 0 ; i < data.length ; i++){
		delete data[i]._attributes;
		delete data[i].rowKey;
	}
	
	$('#param').val(JSON.stringify(data));
	console.log($('#param').val());
	frmExcel.submit();	
})

// 모달
var forGrid = false;
// 자재 돋보기
$("#btnMatModal").on("click", function(e) {
	$('#materialCode').val('');
	$('#materialName').val('');
    $('#matContent').load(contextPath +"/modal/matModal.do");
});

// 자재코드 입력창
$('#materialCode').on('click', function(){
	$('#materialCode').val('');
	$('#materialName').val('');
	$('#matModal').modal('show');
	$('#matContent').load(contextPath +"/modal/matModal.do");
});

// 공정 돋보기
$('#btnProcModal').on('click',function(e){
	$('#processCode').val('');
	$('#processName').val('');
	$('#procContent').load(contextPath +"/modal/procModal.do");
});

// 공정코드 입력창
$('#processCode').on('click', function(){
	$('#processCode').val('');
	$('#processName').val('');
	$('#procModal').modal('show');
	$('#procContent').load(contextPath +"/modal/procModal.do");
});


function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}

