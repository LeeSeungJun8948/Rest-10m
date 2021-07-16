
const codeIdData = {
	api : {
		readData : {url: contextPath + '/ajax/getCodeIdList.do' , method:'GET' },
		modifyData : { url: contextPath + '/ajax/codeIdModify.do', method: 'PUT'}
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
			align: 'center',
			validation: {
            	required: true
          	},
			className: 'normal'
		}, {
			header : '코드ID명',
			name : 'codeIdNm',
			align: 'center',
			validation: {
            	required: true
          	},
			className: 'normal'
		}, {
			header : '코드ID설명',
			name : 'codeIdDc',
			hidden: true,
			validation: {
            	required: true
          	}
		}, {
			header : '코드ID사용여부',
			name : 'codeIdUseAt',
			hidden: true,
			validation: {
            	required: true
          	}
		} ]
});


const codeData = {
	api : {
		readData : {url: contextPath + '/ajax/getDetailCodeList.do' , method:'GET' },
		modifyData : { url: contextPath + '/ajax/codeModify.do', method: 'PUT'}
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
			align: 'center',
			validation: {
            	required: true
          	},
			editor: 'text',
			className: 'normal'	
		}, {
			header : '코드명',
			name : 'codeNm',
			align: 'center',
			editor : 'text',
			validation: {
            	required: true
          	}
		}, {
			header : '코드설명',
			name : 'codeDc',
			align: 'center',
			editor : 'text',
			validation: {
            	required: true
          	}
			
		}, {
			header : '사용여부',
			name : 'codeUseAt',
			align: 'center',
			width : 80,
			editor: {
                type: 'select',
				options: {
					 listItems: [
	                    { text: 'Y', value: 'Y' },
	                    { text: 'N', value: 'N' }
                	]
				}
            },
			validation: {
            	required: true
          	}
		}, {
			name : 'codeId',
			hidden: true
		}, {
			name: 'newRow',
			hidden: true,
			relations: [
				{
			        targetNames: ['code'],
			        editable({value}) {
						console.log(value == 'yes');
						return value == 'yes';
					}
		      }
			]
		} ]
});

var idRowKey;
var newRowKey;

codeIdGrid.on('click',function(e){
	// 똥꼬쇼...
	var change = true;	
	
	if(!checkNull(idRowKey))
		idRowKey = e.rowKey;
	
	if(e.rowKey != newRowKey && checkNull(newRowKey)){
		if(confirm('작성한 내용이 사라집니다. 정말로 이동하시겠습니까?')){
			idRowKey = e.rowKey;
			codeIdGrid.removeRow(newRowKey, {});
			newRowKey = null;
			$('#codeId').prop('readonly', true);
		}else{
			codeIdGrid.focusAt(newRowKey, 0, true);
			idRowKey = newRowKey;
		}
	}
			
	for(modified in codeGrid.getModifiedRows()){
		if(codeGrid.getModifiedRows()[modified].length > 0){
			change = false;
			if(confirm('변경된 값이 있습니다. 정말로 이동하시겠습니까?')){
				idRowKey = e.rowKey;
				grinOnEvent();
			}else{
				codeIdGrid.focusAt(idRowKey, 0, true);
			}
		}else{
			if(change && modified == 'deletedRows'){
				if(!checkNull(newRowKey)){
					idRowKey = e.rowKey;
					grinOnEvent();	
				}
			}
		}
	}
	
})

function grinOnEvent(){
	
	$('#codeId').val(codeIdGrid.getValue(idRowKey, 'codeId'));
	$('#codeIdNm').val(codeIdGrid.getValue(idRowKey, 'codeIdNm'));
	$('#codeIdDc').val(codeIdGrid.getValue(idRowKey, 'codeIdDc'));
	$('#codeIdUseAt').val(codeIdGrid.getValue(idRowKey, 'codeIdUseAt'));

	var param = {"codeId" : codeIdGrid.getValue(idRowKey, 'codeId')};
	console.log(param);
	codeGrid.readData(1, param, true);
}

$('#btnNewCodeId').on('click', function(){
	
	if(checkNull(newRowKey)){
		toast('한번에 하나의 코드만 추가할 수 있습니다. 저장 후 새입력 해주세요.','')
	}else{
		newRowKey = codeIdGrid.getRowCount();
		idRowKey = newRowKey;
		
		codeIdGrid.appendRow({},{
			at : codeIdGrid.getRowCount(),
			focus : true
		});
		
		$('input').val('');
		$('#codeId').prop('readonly', false);
		codeGrid.clear();
	}

})

$('#btnDelCodeId').on('click', function(){
	for(var checked of codeIdGrid.getCheckedRowKeys()){
		if(newRowKey == checked)
			newRowKey = null;	
	}
	codeIdGrid.removeCheckedRows(true);
})

$('#btnNewCode').on('click', function(){
	
	if(checkNull(codeIdGrid.getValue(idRowKey, 'codeId'))){
		newRowData = {"codeId" : codeIdGrid.getValue(idRowKey, 'codeId'),
						'newRow' : 'yes'}
		codeGrid.appendRow(newRowData,{
			at : codeGrid.getRowCount(),
			focus : true
		});	
	}else{
		toast('코드ID를 입력해주세요.','')
	}
	
})

$('#btnDelCode').on('click', function(){
	codeGrid.removeCheckedRows(true);
})

$('#btnSave').on('click',function(){
	
	for(var valid of codeIdGrid.validate()){
		for(var errors of valid.errors){
			var header;
			for(var column of codeIdGrid.getColumns()){
				if(column.name == errors.columnName)
					header = column.header;
			}
			toast(header+'를 확인하세요.',valid.rowKey*1+1);	
		}
	}
	
	for(var valid of codeGrid.validate()){
		for(var errors of valid.errors){
			var header;
			for(var column of codeGrid.getColumns()){
				if(column.name == errors.columnName)
					header = column.header;
			}
			toast(header+'를 확인하세요.',valid.rowKey*1+1);	
		}
	}
	
	var change = false;
	
	for(modified in codeIdGrid.getModifiedRows()){
		if(codeIdGrid.getModifiedRows()[modified].length > 0){
			change = true;
		}
	}
			
	if(change && codeIdGrid.validate().length == 0 && codeGrid.validate().length == 0){
		codeIdGrid.request('modifyData');
		newRowKey = null;
		change = false;
	}
	
	for(modified in codeGrid.getModifiedRows()){
		if(codeGrid.getModifiedRows()[modified].length > 0){
			change = true;
		}
	}
	
	if(change && codeIdGrid.validate().length == 0 && codeGrid.validate().length == 0){
		codeGrid.request('modifyData');
	}
})

$('input').on('propertychange change keyup paste input', function(){
	codeIdGrid.setValue(idRowKey, $(this).attr('id'), $(this).val(), false);
})

$('select').on('change', function(){
	codeIdGrid.setValue(idRowKey, $(this).attr('id'), $(this).val(), false);
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
	

