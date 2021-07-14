
const codeIdData = {
	api : {
		readData : {url: 'ajax/getCodeIdList.do' , method:'GET' },
		modifyData : { url: '', method: 'PUT'}
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
		modifyData : { url: '', method: 'PUT'}
	},
	contentType: 'application/json'
};

const codeGrid = new tui.Grid({
	el : document.getElementById('codeGrid'),
	data : codeIdData,
	scrollX : false,
	scrollY : true,
	bodyHeight: 450,
	selectionUnit: 'row',
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

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
	

