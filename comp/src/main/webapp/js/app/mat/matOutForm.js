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
			editor:'text',
			onAfterChange(ev) {
        		setMatInfo(ev);
      		}
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
			editor:'text'
		}, {
			header : '출고공정',
			name : 'processName',
			width : 120,
			align: 'center',	
			editor: {
				type: 'radio',
				options: {
					listItems: []
            	}
			}
			/** 이거 안됨 ㅅㅂ
			,
			relations: {
				targetNames: ['materialCode'],
				listItems({ value }){
					console.log('여기가 문제냐?');
					if(checkNull(value)){
						console.log('여기는 if안');
						let items;
						items = makeProcessList(value);
						return items;	
					}
					console.log('아니면 여기?');
				}
			}
			 */
		}, {
			header : '자재재고',
			name : 'stock',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
 			
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

function setMatInfo(ev){
	
	var rowKey = ev.rowKey;
	var materialCode =  grid.getValue(rowKey, 'materialCode');
	
	if(checkNull(materialCode)){
		$.ajax({
			type : "get",
			data: {"materialCode" : materialCode},
			url : "ajax/getMatInfoForOut.do",
			dataType : "json",
			async : false,
			success : function(data) {
				console.log(data);
				grid.setValue(rowKey, 'materialName', data.materialName, false);
				grid.setValue(rowKey, 'unitNo', data.unitNo, false);
				grid.setValue(rowKey, 'stock', data.stock, false);
			},
			error:function(request, status, error){
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
		
	}
	
}

function makeProcessList(materialCode){
	
	let processList = [];
	
	console.log('여기까지뜸');
	
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
			console.log(processList);
		},
		error:function(request, status, error){
			alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
		}
	});	
	
	return processList;
}

$('#btnRead').on('click',  function(){
	var param = $('#searchFrm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});


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

	newRowData = {'ioCode' : newIoCode};
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
