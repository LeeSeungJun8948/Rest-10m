/**
$( document ).ready(function() {	
	var	nowDate = new Date();
	document.getElementById('startDate').valueAsDate = new Date(nowDate.setDate(nowDate.getDate() - 7));
	document.getElementById('endDate').valueAsDate = new Date();
});
 */

// 재고 리스트 
const stockDataSource = {
	api : {
		readData : {url: 'ajax/matLotStock.do' , method:'GET' },
	},
	contentType: 'application/json'
};
	
const stockGrid = new tui.Grid({
	el : document.getElementById('stockGrid'),
	data : stockDataSource,
	scrollX : false,
	scrollY : true,
	bodyHeight: 200,
	columns : [ 
		{
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center'
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
			header : '입고단가',
			name : 'unitPrice',
			align: 'right',
			width : 100,
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '정산일자',
			name : 'ioDate',
			align: 'center'
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
	]
		
});

const adjustDataSource = {
	api : {
		readData: {url: 'ajax/matAdjustNull.do', method: 'GET'},
		modifyData : { url: 'ajax/matAdjustModify.do', method: 'PUT'}
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
			align: 'center'
		},
		{
			header : '자재코드',
			name : 'materialCode',
			align: 'center'
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
				dataType: 'number',
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
		if($('#ckExceptZeroStock').is(":checked")){
			$('#exceptZeroStock').val($('#ckExceptZeroStock').val());
		}else{
			$('#exceptZeroStock').val('');
		}

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
			url : "ajax/getNewIoCode.do",
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

$("#btnSave").on("click", function(){
	adjustGrid.request('modifyData');
	
	(function($) {
		if($('#ckExceptZeroStock').is(":checked")){
			$('#exceptZeroStock').val($('#ckExceptZeroStock').val());
		}else{
			$('#exceptZeroStock').val('');
		}

		var param = $('#searchFrm').serializeObject();
		console.log(param)
		stockGrid.readData(1, param, true);
	})(jQuery);
	
	alert('작성완료');	
	adjustGrid.resetData([],{});
});

// 모달
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

