$('#matNo').val('');
$('#unitNo').val('');

const listData = {
	api : {
		readData : {url: contextPath + '/ajax/matList.do' , method:'GET' },
		modifyData : {url: contextPath + '/ajax/matModify.do' , method:'PUT'}
	},
	contentType: 'application/json'
};

let grid;
let matNoList = [];
let unitNoList = [];


$.ajax({
	url: contextPath + '/ajax/matNo.do',
	type : "get",
	dataType : "json",
	async : false,
	dataSrc: "",
	success : function(data) {
		console.log(data);
		for(var value of data){
			matNoList.push({text: value.matNm, value: value.matNo});	
		}
	},
	error : function(request, status, error) {
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});
	
$.ajax({
	url: contextPath + '/ajax/unitNo.do',
	type : "get",
	dataType : "json",
	async : false,
	dataSrc: "",
	success : function(data) {
		for(var value of data){
			unitNoList.push({text: value.unitNm, value: value.unitNo});	
		}
	},
	error : function(request, status, error) {
		alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
	}
});

// grid 생성
grid = new tui.Grid({
	el : document.getElementById('matList'),
	data : listData,
	scrollX : false,
	scrollY : true,
	bodyHeight: 450,
	rowHeaders: ['checkbox'],
	selectionUnit: 'row',
	columns : [ {
			header : '자재코드',
			name : 'materialCode',
			width : 120,
			align: 'center',
			sortable: true,
			className: 'white',
			// listItems 값이 직접 넣으면 이유를 모르겠는데 안돼서 이걸로 넣음..
			relations: [ {
				targetNames: ['matNo'],
				listItems({ value }){
					
					let items = [];
					
					if(checkNull(value)){
						items = matNoList;
					}
					return items;	
				}
			} ]
		}, {
			header : '자재명',
			name : 'materialName',
			align: 'center',
			editor: 'text',
			validation: {
	           	required: true
	       	},
			sortable: true,
			className: 'white',
			relations: [ {
				targetNames: ['unitNo'],
				listItems({ value }){
					
					let items = [];
					
					if(checkNull(value)){
						items = unitNoList;
					}
					return items;	
				}
			} ]
		}, {
			header : '구분',
			name : 'matNo',
			width : 160,
			align: 'center',
			formatter: 'listItemText',
			editor: {
				type: 'select',
				options: {
					listItems: []
            	}
			},
			validation: {
				required: true
			},
			sortable: true
		}, {
			header : '입고업체',
			name : 'companyName',
			align: 'center',
			validation: {
				required: true
			}
		}, {
			header : '입고업체',
			name: 'companyCode',
			hidden: true
		}, {
			header : '관리단위',
			name : 'unitNo',
			align: 'center',
			width: 160,
			editor: {
				type: 'select',
				options: {
					listItmes: []
				}
			},
			validation: {
		  		required: true
			}
		}, {
			header : '안전재고',
			name : 'saveStock',
			align : 'right',
			editor: 'text',
			width : 160,
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : 'MIN재고',
			name : 'minStock',
			align : 'right',
			editor: 'text',
			width : 160,
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : 'MAX재고',
			name : 'maxStock',
			align : 'right',
			editor: 'text',
			width : 160,
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '1M소요량',
			name : 'monthStock',
			align : 'right',
			editor: 'text',
			width : 160,
			formatter({value}) {
      			return format(value);
    		}
		} 
	]
});


var rowKey;

$('#btnRead').on('click',function(){
	var param = {'materialName' : $('#materialName').val()}
	console.log(param)
	grid.readData(1, param, true);
})

$('#btnSave').on('click',function(){
	
	for(var valid of grid.validate()){
		for(var errors of valid.errors){
			var header;
			for(var column of grid.getColumns()){
				if(column.name == errors.columnName)
					header = column.header;
			}
			toast(header+'를 확인하세요.','No.' + grid.getValue(valid.rowKey,'materialCode'));
		}
	}
	
	if(grid.validate().length == 0)
		grid.request('modifyData');
	
});
	
function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "500"
 	};
	toastr.error(text, title);
}

var newMatCode;

// 새 자재 클릭시 matCode 불러오기
$('#btnGridAdd').on('click',function(){	
	if(checkNull(newMatCode)){
		newMatCode += 1;
	}else{
		$.ajax({
			type : "get",
			url : contextPath + "/ajax/newMatCode.do",
			dataType : "json",
			async : false,
			success : function(data) {
				newMatCode = data.materialCode;
			},
			error : function(request, status, error) {
				alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
			}
		});
	}
	
	newRowData = {"materialCode" : newMatCode}
	rowKey = grid.getRowCount();
	grid.appendRow(newRowData,{
		at : grid.getRowCount(),
		focus : true
	});

});
	
	
// 자재 정보 삭제
$('#btnGridDel').on('click',function(){
	grid.removeCheckedRows(true)
});

// 모달
var forGrid = false;

grid.on('dblclick', function(ev){
	rowKey = ev.rowKey;
	if(ev.columnName == 'companyName'){
		forGrid = true;
		$('#compModal').modal('show');
		$('#compContent').load(contextPath +"/modal/compModal.do");	
	}
})

function checkNull(value){
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}
	
function format(value){
	value = value * 1;
	return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}