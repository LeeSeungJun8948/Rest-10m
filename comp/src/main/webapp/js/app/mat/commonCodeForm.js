
const codeIdData = {
	api : {
		readData : {url: 'ajax/getCodeIdList.do' , method:'GET' },
		modifyData : { url: 'ajax/codeIdModify.do', method: 'PUT'}
	},
	contentType: 'application/json'
};

const codeIdGrid = new tui.Grid({
	el : document.getElementById('codeIdGrid'),
	data : codeIdData,
	scrollX : false,
	scrollY : true,
	bodyHeight: 450,
	selectionUnit: 'row',
	rowHeaders: ['checkbox','rowNum'],
	columns : 
		[ {
			header : '코드ID',
			name : 'codeId',	
			width : 150,
			align: 'center'
		}, {
			header : '코드명',
			name : 'codeIdNm',
			align: 'center'
		} ]
});


const codeData = {
	api : {
		readData : {url: 'ajax/getDetailCodeList.do' , method:'GET' },
		modifyData : { url: 'ajax/codeModify.do', method: 'PUT'}
	},
	contentType: 'application/json'
};

const codeGrid = new tui.Grid({
	el : document.getElementById('codeGrid'),
	data : codeData,
	scrollX : false,
	scrollY : true,
	bodyHeight: 300,
	selectionUnit: 'row',
	rowHeaders: ['checkbox','rowNum'],
	columns : 
		[ {
			header : '코드',
			name : 'code',
			width : 150,
			align: 'center'
		}, {
			header : '코드명',
			name : 'codeNm',
			align: 'center',
			editor : 'text'
		}, {
			header : '코드설명',
			name : 'codeDc',
			align: 'center',
			editor : 'text'
			
		}, {
			header : '사용여부',
			name : 'codeUseAt',
			align: 'center',
			width : 80,
			editor: {
                type: 'select',
				options: {
					 listItems: [
	                    { text: 'YES', value: 'Y' },
	                    { text: 'NO', value: 'N' }
                	]
				}
            }
		}, {
			name : 'codeId',
			hidden: true
		} ]
});

codeIdGrid.on('click',function(e){
	
	$.ajax({
		type : "get",
		url : "ajax/getDetailCode.do",
		data : {"codeId" : codeIdGrid.getValue(e.rowKey, 'codeId')},
		dataType : "json",
		success : function(data) {
			$('#codeId').val(data.codeId);
			$('#codeIdNm').val(data.codeIdNm);
			$('#codeIddc').val(data.codeIdDc);
			$('#codeIdUseAt').val(data.codeIdUseAt);
		},
		error : function() {
		}
	});
	
	var param = {"codeId" : codeIdGrid.getValue(e.rowKey, 'codeId')};
	console.log(param);
	codeGrid.readData(1, param, true);
})

$('#btnNewCodeId').on('click', function(){
	codeIdGrid.appendRow(newRowData,{
		at : codeIdGrid.getRowCount(),
		focus : false
	});
})

$('#btnDelCodeId').on('click', function(){
	codeIdGrid.removeCheckedRows(true);
})

$('#btnNewCode').on('click', function(){
	codeGrid.appendRow(newRowData,{
		at : codeGrid.getRowCount(),
		focus : false
	});
})

$('#btnDelCode').on('click', function(){
	codeGrid.removeCheckedRows(true);
})

$('#btnSave').on('click',function(){
	
	for(var valid of codeGrid.validate()){
		for(var errors of valid.errors){
			var header;
			for(var column of codeGrid.getColumns()){
				if(column.name == errors.columnName)
					header = column.header;
			}
			toast(header+'를 확인하세요.',valid.rowKey * 1 + 1);	
		}
	}
	
	if(codeGrid.validate().length == 0){
		codeGrid.request('modifyData');
	}
	
})
function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "200"
 	};
	toastr.error(text,title);
}

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
	

