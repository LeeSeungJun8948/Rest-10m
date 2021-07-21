$( document ).ready(function() {	
	var	nowDate = new Date();
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});

const planDataSource = {
	api : {
		readData : {url: contextPath + '/ajax/planGrid.do' , method:'GET' },
	},
	contentType: 'application/json'
};
	
const planGrid = new tui.Grid({
	el : document.getElementById('planGrid'),
	data : planDataSource,
	scrollX : false,
	scrollY : true,
	bodyHeight: 250,
	columns : [ 
		{
			header : '생산계획코드',
			name : 'prorCode',
			width : 120,
			align: 'center'
		},
		{
			header : '제품코드',
			name : 'productCode',
			align: 'center',
			width : 120,
		},
		{
			header : '제품명',
			name : 'productName',
			align: 'center'
		}, {
			header : '제품LOT',
			name : 'productLot',
			align: 'center'

		}, {
			header : '지시량',
			name : 'prorCount',
			align: 'center'
		}, {
			header : '작업일자',
			name : 'workDate',
			align: 'center'
		}, {
			header : '고객사',
			name : 'companyName',
			align: 'center'
		} 
	]
});
	
const inputGrid = new tui.Grid({
	el : document.getElementById('inputGrid'),
	scrollX : false,
	scrollY : true,
	bodyHeight: 250,
	columns : [ 
		{
			header : '자재명',
			name : 'materialName',
			align: 'center'
		},
		{
			header : '자재LOT',
			name : 'materialLot',
			align: 'center'
		},
		{
			header : '투입량',
			name : 'inputCount',
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}
	]
});

const procGrid = new tui.Grid({
	el : document.getElementById('procGrid'),
	scrollX : false,
	scrollY : true,
	bodyHeight: 250,
	columns : [ 
		{
			header : '순번',
			name : 'idx',
			align: 'center',
			width: 80
		},
		{
			header : '공정명',
			name : 'processName',
			align: 'center'
		},
		{
			header : '작업번호',
			name : 'workCode',
			align: 'center'
		},
		{
			header : '진행',
			name : 'status',
			align: 'center'
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
		planGrid.readData(1, param, true);
	});
})(jQuery);

var rowKey;

planGrid.on('click',function(ev){
	rowKey = ev.rowKey;
	console.log(rowKey + "그리드클릭")
	inputGrid.resetData([],{});
	
	$.ajax({
		type : "get",
		url : contextPath + "/ajax/getInputMatList.do",
		data: {"productLot" : planGrid.getValue(ev.rowKey, 'productLot')},
		dataType : "json",
		async : false,
		success : function(data) {
			for(var i = 0 ; i < data.length ; i++){
				newRowData = {
					'materialName' : data[i].materialName, 
					'materialLot' : data[i].materialLot,
					'inputCount' : data[i].inputCount
				};
				inputGrid.appendRow(newRowData, {
					at : inputGrid.getRowCount(),
					focus : true
				});
			}
		},
		error : function() {
		}
	});		
	
	procGrid.resetData([],{});
	
	$.ajax({
		type : "get",
		url : contextPath + "/ajax/getProcStatus.do",
		data: {"productLot" : planGrid.getValue(ev.rowKey, 'productLot'),
				"productCode" : planGrid.getValue(ev.rowKey, 'productCode')},
		dataType : "json",
		async : false,
		success : function(data) {
			for(var i = 0 ; i < data.length ; i++){
				newRowData = {
					'idx' : data[i].idx, 
					'processName' : data[i].processName,
					'workCode' : data[i].workCode,
					'status' : data[i].status
				};
				procGrid.appendRow(newRowData, {
					at : procGrid.getRowCount(),
					focus : true
				});
			}
		},
		error : function() {
		}
	});		
	
});

$('#btnPrint').on('click',  function(){
	if(checkNull(rowKey) || rowKey == 0){ //왠진 모르겠는데 0이면 null취급됨
		var url = contextPath + '/pro/view/printProcessMove.do?productLot='+ planGrid.getValue(rowKey, 'productLot')
				+ "&productName=" + planGrid.getValue(rowKey, 'productName')
				+ "&companyName=" + planGrid.getValue(rowKey, 'companyName')
				+ "&prorCount=" + planGrid.getValue(rowKey, 'prorCount')
				+ "&prorCode=" + planGrid.getValue(rowKey, 'prorCode');
				
		var _width = '550';
	    var _height = '400';
	 
	    var _left = Math.ceil(( window.screen.width - _width )/2);
	    var _top = Math.ceil(( window.screen.height - _height )/2); 
	
		window.open(url,'공정이동표', 'width='+ _width +', height='+ _height +', left=' + _left + ', top='+ _top); 
	}else{
		toast('생산계획을 선택해주세요.',null);
	}
	
});


function checkNull(value){
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}	

function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "500"
 	};
	toastr.error(text,title);
}

