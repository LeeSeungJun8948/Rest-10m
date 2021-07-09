$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});

const dataSource = {
	api : {
		readData : {url: 'ajax/matOutList.do' , method:'GET' },
		modifyData : { url: 'ajax/matOutModify.do', method: 'PUT'}
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
			align: 'center'
		},
		{
			header : '출고일자',
			name : 'ioDate',
			width : 120,
			align: 'center',
			editor: {
				type: 'datePicker',
				options: {
				language: 'ko',
				format: 'yyyy-MM-dd'
				}
			}
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
			relations: [ {
				targetNames: ['processCode'],
				listItems({ value }){
					
					let items = [];
					
					if(checkNull(value)){
						items = makeProcessList(value);
					}
					return items;	
				},
				disabled({ value }) {
                	return !value;
              	}
			} ]
		}, {
			header : '자재명',
			name : 'materialName',
			width : 150,
			align: 'center'
		}, {
			header : '단위',
			name : 'unitNo',
			width : 70,
			align: 'center'
		}, {
			header : '출고량',
			name : 'ioVolume',
			width : 120,
			align: 'right',
			editor:'text',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '자재LOT_NO',
			name : 'lotNo',
			width : 150,
			align: 'center',
			className: 'white'
		}, {
			header : '출고공정',
			name : 'processCode',
			width : 120,
			align: 'center',	
			className: 'white',
			formatter: 'listItemText',
			editor: {
				type: 'select',
				options: {
					listItems: []
            	}
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
			align: 'center',
			editor: 'text'
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

function setMatInfo(ev){
	
	rowKey = ev.rowKey;
	materialCode =  grid.getValue(rowKey, 'materialCode');
	
	if(checkNull(materialCode)){
		
		$.ajax({
			type : "get",
			data: {"materialCode" : materialCode},
			url : "ajax/getMatInfoForOut.do",
			dataType : "json",
			async : false,
			success : function(data) {
				grid.setValue(rowKey, 'materialName', data.materialName, false);
				grid.setValue(rowKey, 'unitNo', data.unitNo, false);
				grid.setValue(rowKey, 'stock', data.stock, false);
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
		rowKey = ev.rowKey;
		grid.setValue(rowKey, 'processCode', null, false);
		grid.setValue(rowKey, 'lotNo', null, false);
		$('#matLotModal').modal('show');
		$('#matLotContent').load("matLotModal.do");
	
	}
	
}

function makeProcessList(materialCode){
	
	let processList = [];
	
	$.ajax({
		type : "get",
		data: {"materialCode" : materialCode},
		url : "ajax/getProcessList.do",
		dataType : "json",
		async : false,
		success : function(datas) {
			for(let data of datas){
				processList.push({text: data.processName, value: data.processCode});
			}
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});	
	
	return processList;
}

(function($) {
	
$('#btnRead').on('click',  function(){
	var param = $('#searchFrm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});

})(jQuery);

var newIoCode;
	
$("#btnGridAdd").on("click", function(){
	
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

	newRowData = {'ioCode' : newIoCode, 'ioDate' : getFormatDate(new Date())};
	grid.appendRow(newRowData,{
		at : grid.getRowCount(),
		focus : true
	});
});


$("#btnGridDel").on("click", function(ev){
	grid.removeCheckedRows(true);
});


$("#btnSave").on("click", function(){
	grid.request('modifyData');
});

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
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

// 공정 돋보기
$('#btnProcModal').on('click',function(e){
	$('#procContent').load("procModal.do");
});

// 공정코드 입력창
$('#processCode').on('click', function(){
	$('#procModal').modal('show');
	$('#procContent').load("procModal.do");
});

grid.on('dblclick', function(ev){
	if(ev.columnName == 'materialCode'){
		rowKey = ev.rowKey;
		forGrid = true;
		$('#matModal').modal('show');
		$('#matContent').load("matModal.do");
	}
})

// lot검색 모달 열기(그리드에서)
grid.on('dblclick', function(ev){
	if(ev.columnName == 'lotNo'){
		rowKey = ev.rowKey;
		materialCode = grid.getValue(rowKey, 'materialCode');
		$('#matLotModal').modal('show');
		$('#matLotContent').load("matLotModal.do");
	}
})

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}

