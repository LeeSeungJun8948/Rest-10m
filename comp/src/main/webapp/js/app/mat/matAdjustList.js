$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});

const dataSource = {
	api : {
		readData : {url: 'ajax/matAdjustList.do' , method:'GET'},
		modifyData : { url: 'ajax/matAdjustModify.do', method: 'PUT'}
	},
	contentType: 'application/json'
};
	
const adjustGrid = new tui.Grid({
	el : document.getElementById('adjustGrid'),
	data : dataSource,
	scrollX : false,
	scrollY : true,
	bodyHeight: 360,
	rowHeaders: ['checkbox'],
	columns : [ 
		{
			header : '정산코드',
			name : 'ioCode',
			align: 'center',
			width : 120
		},
		{
			header : '자재코드',
			name : 'materialCode',
			align: 'center',
			width : 120
		},
		{
			header : '자재명',
			name : 'materialName',
			align: 'center'
		},
		{
			header : 'LOT',
			name : 'lotNo',
			align: 'center'
		}, {
			header : '단가',
			name : 'unitPrice',
			align: 'right',
			width : 120,
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '정산수량',
			name : 'ioVolume',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		},
			editor: 'text',
			onAfterChange(ev) {
        		setInoutNo(ev);
      		}
		},  {
			header : '정산',
			name : 'inoutNo',
			align: 'center',
			formatter: 'listItemText',
			className: 'blackText',
			editor: {
                type: 'select',
				options: {
					 listItems: [
	                    { text: '정산입고', value: '03' },
	                    { text: '정산출고', value: '04' },
	                    { text: '', value: '' }
                	]
				}
            }
		}, {
			header : '총액',
			name : 'stock', // 걍 변수이름만 사용한거지 재고가 아니라 총액임
			align: 'right',
			width: 120,
			formatter({value}) {
      			return format(value);
    		},
		}, {
			header : '단위',
			name : 'unitNo',
			align: 'center',
			width : 80
		}, {
			header : '현재고',
			name : 'lotStock',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);	
    		}
		}, {
			header : '정산일',
			name : 'ioDate',
			align: 'center',
			width : 120,
			editor: {
				type: 'datePicker',
				options: {
				language: 'ko',
				format: 'yyyy-MM-dd'
				}
			}
		}, {
			header : '비고',
			name : 'comments',
			align: 'center',
			editor: 'text'
		}  
	],
	summary : {
		
		height: 40,
	   	position: 'bottom',
	   	columnContent: {
        	materialName: {
                template(summary) {
        			return '합 계';
                } 
            },	
			unitPrice: {
                template(summary) {
        			var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            },
			ioVolume: {
                template(summary) {
        			var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            },
			stock: {
                template(summary) {
        			var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            }
		}
	}
});

	
adjustGrid.disableColumn('inoutNo');

function format(value){
	value = value * 1;
	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

$('#btnRead').on('click',  function(){
	
	var param = $('#searchFrm').serializeObject();
	console.log(param)
	adjustGrid.readData(1, param, true);
	
});


function setInoutNo(ev){
	
	var ioVolume = adjustGrid.getValue(ev.rowKey, 'ioVolume');
	
	if(ioVolume == 0){
		adjustGrid.setValue(ev.rowKey, 'inoutNo', '',false);
	}else if(!checkNull(adjustGrid.getValue(ev.rowKey, 'inoutNo'))){
		var ioCode = adjustGrid.getValue(ev.rowKey, 'ioCode');
		$.ajax({
			type : "get",
			url : "ajax/getInoutNo.do",
			data: {"ioCode" : ioCode},
			dataType : "json",
			async : false,
			success : function(data) {
				adjustGrid.setValue(ev.rowKey, 'inoutNo', data.inoutNo, false);
			},
			error : function() {
			}
		});
	}
	
	adjustGrid.setValue(ev.rowKey, 'stock', 
						adjustGrid.getValue(ev.rowKey, 'ioVolume')
						* adjustGrid.getValue(ev.rowKey, 'unitPrice'), false);
};

$("#btnGridDel").on("click", function(ev){
	adjustGrid.removeCheckedRows(true);
});

$("#btnSave").on("click", function(){
	adjustGrid.request('modifyData');
});


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
    $('#matContent').load("matModal.do");
});

// 자재코드 입력창
$('#materialCode').on('click', function(){
	$('#matModal').modal('show');
	$('#matContent').load("matModal.do");
});

