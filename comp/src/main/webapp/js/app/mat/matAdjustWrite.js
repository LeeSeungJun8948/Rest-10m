$( document ).ready(function() {	
	$('#ckExceptZeroStock').prop("checked", true);
	$('#exceptZeroStock').val($('#ckExceptZeroStock').val());
	
	var param = $('#searchFrm').serializeObject();
	console.log(param)
	stockGrid.readData(1, param, true);
});

toastr.options = {
	closeButton: true,
	showDuration: "500",
	 positionClass: "toast-top-center"
 };

$("#ckExceptZeroStock").change(function(){
	if($("#ckExceptZeroStock").is(":checked")){
	    $('#exceptZeroStock').val($('#ckExceptZeroStock').val());
	}else{
	    $('#exceptZeroStock').val('');
	}
});

// 재고 리스트 
const stockDataSource = {
	api : {
		readData : {url: contextPath + '/ajax/matLotStock.do' , method:'GET' },
	},
	contentType: 'application/json'
};
	
const stockGrid = new tui.Grid({
	el : document.getElementById('stockGrid'),
	data : stockDataSource,
	scrollX : false,
	scrollY : true,
	rowHeaders: ['checkbox'],
	columns : [ 
		{
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center',
			sortable: true
		},
		{
			header : '자재명',
			name : 'materialName',
			align: 'center',
			sortable: true
		},
		{
			header : 'LOT',
			name : 'lotNo',
			align: 'center',
			sortable: true
		}, {
			header : '입고단가',
			name : 'unitPrice',
			align: 'right',
			width : 100,
			formatter({value}) {
      			return format(value);
    		},
			sortable: true
		}, {
			header : '정산일자',
			name : 'ioDate',
			align: 'center',
			sortable: true
		}, {
			header : '현재고',
			name : 'lotStock',
			width : 180,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '단위',
			name : 'unitNo',
			align: 'center',
			width : 80
		} 
	],
	summary : {
		
		height: 40,
	   	position: 'bottom',
	   	columnContent: {
        	ioDate: {
                template(summary) {
        			return '합 계';
                } 
            },	
			lotStock: {
                template(summary) {
        			var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            }
		}
	}
		
});

const adjustDataSource = {
	api : {
		readData: {url: contextPath + '/ajax/matAdjustNull.do', method: 'GET'},
		modifyData : { url: contextPath + '/ajax/matAdjustModify.do', method: 'PUT'}
	},
	contentType: 'application/json'
};
	
const adjustGrid = new tui.Grid({
	el : document.getElementById('adjustGrid'),
	data : adjustDataSource,
	rowHeaders: ['checkbox'],
	scrollX : false,
	scrollY : true,
	bodyHeight: 300,
	columns : [ 
		{
			header : '정산코드',
			name : 'ioCode',
			align: 'center',
			sortable: true
		},
		{
			header : '자재코드',
			name : 'materialCode',
			align: 'center',
			sortable: true
		},
		{
			header : '자재명',
			name : 'materialName',
			align: 'center',
			sortable: true
		},
		{
			header : 'LOT',
			name : 'lotNo',
			align: 'center',
			sortable: true
		}, {
			header : '단가',
			name : 'unitPrice',
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '실재고',
			name : 'realLotStock',
			width : 120,
			align: 'right',
			editor: 'text',
			className: 'red',
			onAfterChange(ev) {
        		setIoVolume(ev);
      		},
			validation: {
				dataType: 'number',
            	required: true
          	}
		}, {
			header : '현재고',
			name : 'lotStock',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '조정수량',
			name : 'ioVolume',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
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
			header : '단위',
			name : 'unitNo',
			align: 'center',
			width : 80
		}, {
			header : '정산일',
			name : 'ioDate',
			align: 'center',
			editor: {
				type: 'datePicker',
				options: {
				language: 'ko',
				format: 'yyyy-MM-dd'
				}
			},
			validation: {
            	required: true
          	}
		}, {
			header : '비고',
			name : 'comments',
			align: 'center',
			editor: 'text'
		}  
	]
});

adjustGrid.disableColumn('inoutNo');

function format(value){
	value = value * 1;
	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}

(function($) {
	$('#btnRead').on('click',  function(){
		var param = $('#searchFrm').serializeObject();
		console.log(param)
		stockGrid.readData(1, param, true);
	});
})(jQuery);

var newIoCode;

stockGrid.on('dblclick',function(ev){
	
	if(checkNull(newIoCode)){
		newIoCode = newIoCode * 1 + 1;
	}else{
		$.ajax({
			type : "get",
			url : contextPath + "/ajax/getNewIoCode.do",
			dataType : "json",
			async : false,
			success : function(data) {
				newIoCode = data.ioCode;
			},
			error : function() {
			}
		});		
	}
	
	newRowData = {'ioCode' : newIoCode, 
					'materialCode' : stockGrid.getValue(ev.rowKey, 'materialCode'),
					'materialName' : stockGrid.getValue(ev.rowKey, 'materialName'),
					'lotNo' : stockGrid.getValue(ev.rowKey, 'lotNo'),
					'unitPrice' : stockGrid.getValue(ev.rowKey, 'unitPrice'),
					'lotStock' : stockGrid.getValue(ev.rowKey, 'lotStock'),
					'unitNo' : stockGrid.getValue(ev.rowKey, 'unitNo'),
					'ioDate' : getFormatDate(new Date()),
					};
	adjustGrid.appendRow(newRowData,{
		at : adjustGrid.getRowCount(),
		focus : true
	});
});

function setIoVolume(ev){
	
	var realLotStock = adjustGrid.getValue(ev.rowKey, 'realLotStock');
	var lotStock = adjustGrid.getValue(ev.rowKey, 'lotStock');
	
	var ioVolume = realLotStock - lotStock;
	
	if(ioVolume > 0){
		adjustGrid.setValue(ev.rowKey, 'inoutNo', '03', false);
		adjustGrid.setValue(ev.rowKey, 'ioVolume', ioVolume, false);
	}else if(ioVolume < 0){
		adjustGrid.setValue(ev.rowKey, 'inoutNo', '04', false);
		adjustGrid.setValue(ev.rowKey, 'ioVolume', ioVolume*-1, false);
	}else{
		adjustGrid.setValue(ev.rowKey, 'inoutNo', '', false);
		adjustGrid.setValue(ev.rowKey, 'ioVolume', ioVolume, false);
	}
}

$("#btnGridDel").on("click", function(ev){
	adjustGrid.removeCheckedRows(false);
});

$('#btnWrite').on('click',function(){
	
	for(var writeRowKey of stockGrid.getCheckedRowKeys()){
		if(checkNull(newIoCode)){
			newIoCode = newIoCode * 1 + 1;
		}else{
			$.ajax({
				type : "get",
				url : contextPath + "/ajax/getNewIoCode.do",
				dataType : "json",
				async : false,
				success : function(data) {
					newIoCode = data.ioCode;
				},
				error : function() {
				}
			});		
		}
		
		newRowData = {'ioCode' : newIoCode, 
						'materialCode' : stockGrid.getValue(writeRowKey, 'materialCode'),
						'materialName' : stockGrid.getValue(writeRowKey, 'materialName'),
						'lotNo' : stockGrid.getValue(writeRowKey, 'lotNo'),
						'unitPrice' : stockGrid.getValue(writeRowKey, 'unitPrice'),
						'lotStock' : stockGrid.getValue(writeRowKey, 'lotStock'),
						'unitNo' : stockGrid.getValue(writeRowKey, 'unitNo'),
						'ioDate' : getFormatDate(new Date()),
						};
		adjustGrid.appendRow(newRowData,{
			at : adjustGrid.getRowCount(),
			focus : true
		});
	}
})

$("#btnSave").on("click", function(){
	
	for(var valid of adjustGrid.validate()){
		for(var errors of valid.errors){
			var header;
			for(var column of adjustGrid.getColumns()){
				if(column.name == errors.columnName)
					header = column.header;
			}
			toast(header+'를 확인하세요.',adjustGrid.getValue(valid.rowKey, 'ioCode'));	
		}
	}
	
	if(adjustGrid.validate().length == 0){
		
		if(confirm('저장하시겠습니까?')){
			adjustGrid.request('modifyData', {
	            showConfirm: false
	         });
			toastr.success("저장되었습니다.");
			
			var param = $('#searchFrm').serializeObject();
			console.log(param)
			stockGrid.readData(1, param, true);
	
			adjustGrid.resetData([],{});
		
		}
		

	}

});

// 모달
var forGrid = false;
// 자재 돋보기
$("#btnMatModal").on("click", function(e) {
	$('#materialCode').val('');
	$('#materialName').val('');    
	$('#matContent').load(contextPath + "/modal/matModal.do");
});

// 자재코드 입력창
$('#materialCode').on('click', function(){
	$('#materialCode').val('');
	$('#materialName').val('');	
	$('#matModal').modal('show');
	$('#matContent').load(contextPath + "/modal/matModal.do");
});

function checkNull(value){
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}	

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}

function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "200"
 	};
	toastr.error(text,title);
}
