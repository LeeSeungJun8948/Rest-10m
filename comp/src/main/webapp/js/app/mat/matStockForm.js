
$( document ).ready(function() {	
	var	nowDate = new Date();
	document.getElementById('startDate').valueAsDate = new Date(nowDate.setDate(nowDate.getDate() - 7));
	document.getElementById('endDate').valueAsDate = new Date();
});

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
			width : 120,
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
		readData: {url: 'ajax/matAdjust.do', method: 'GET'},
		modifyData : { url: 'ajax/.do', method: 'PUT'}
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
			className: 'red'
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
    		},
			onAfterChange(ev) {
        		setIoVolume(ev);
      		},
			className: 'red'
		},  {
			header : '정산',
			name : 'inoutNo',
			align: 'center'
		}, {
			header : '단위',
			name : 'unitNo',
			align: 'center',
			width : 80
		}, {
			header : '정산일',
			name : 'ioDate',
			align: 'center',
		} 
	]
});


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

stockGrid.on('click',function(ev){
	
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
	var realLotStock = stockGrid.getValue(ev.rowKey, 'realLotStock');
	var lotStock = stockGrid.getValue(ev.rowKey, 'lotStock');
	
	var ioVolume = realLot
}
$("#btnGridDel").on("click", function(ev){
	adjustGrid.removeCheckedRows(false);
});

$("#btnSave").on("click", function(){
	adjustGrid.request('modifyData');
});


// 모달
// 자재 돋보기
$("#btnMatModal").on("click", function(e) {
    $('#matContent').load("matModal.do");
});

// 자재코드 입력창
$('#materialCode').on('click', function(){
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

