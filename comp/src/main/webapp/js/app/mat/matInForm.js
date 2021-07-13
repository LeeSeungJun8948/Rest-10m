$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});


const dataSource = {
	api : {
		readData : {url: 'ajax/matInList.do' , method:'GET' },
		modifyData : { url: 'ajax/matInModify.do', method: 'PUT'}
	},
	contentType: 'application/json'
};
	
const grid = new tui.Grid({
	el : document.getElementById('matInList'),
	data : dataSource,
	scrollX : false,
	scrollY : true,
	bodyHeight: 360,
	rowHeaders: ['checkbox'],
	columns : [ 
		{
			header : '입고번호',
			name : 'ioCode',
			width : 80,
			align: 'center'
		},
		{
			header : '입고일자',
			name : 'ioDate',
			width : 120,
			align: 'center',
			editor: {
				type: 'datePicker',
				options: {
				language: 'ko',
				format: 'YYYY-MM-dd'
				}
			},
			onAfterChange(ev) {
        		makeLot(ev);
      		},
			validation: {
            	required: true
          	}
		}, {
			header : '발주번호',
			name : 'inorderCode',
			width : 80,
			align: 'center',
			className: 'white',
			onAfterChange(ev) {
				setMatInfo(ev);
        		makeLot(ev);
      		},
			validation: {
            	required: true
          	}
		}, {
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center'
		}, {
			header : '자재명',
			name : 'materialName',
			width : 120,
			align: 'center'
		}, {
			header : '단위',
			name : 'unitNo',
			width : 70,
			align: 'center'
		}, {
			header : '입고량',
			name : 'ioVolume',
			width : 120,
			align: 'right',
			editor:'text',
			formatter({value}) {
      			return format(value);
    		},
			onAfterChange(ev) {
        		calPrice(ev);
      		},
			validation: {
				dataType: 'number',
            	required: true
          	}
		}, {
			header : '단가',
			name : 'unitPrice',
			width : 120,
			align: 'right',
			editor:'text',
			formatter({value}) {
      			return format(value);
    		},
			onAfterChange(ev) {
        		calPrice(ev);
      		},
			validation: {
				dataType: 'number',
            	required: true
          	}
		}, {
			header : '총액',
			name : 'price',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : 'LOT_NO',
			name : 'lotNo',
			width : 140,
			align: 'center',
			validation: {
            	required: true
          	}
		}, {
			header : '자재재고',
			name : 'stock',
			width : 120,
			align: 'right'
			
			,formatter({value}) {
      			return format(value);
    		}
 			
		}
	],
	summary : {
		
		height: 40,
	   	position: 'bottom',
	   	columnContent: {
        	inorderCode: {
                template(summary) {
        			return '합 계';
                } 
            },	
			ioVolume: {
                template(summary) {
        			var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            },
			price: {
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

function makeLot(ev){
	var rowKey = ev.rowKey;
	
	var ioDate = grid.getValue(rowKey, 'ioDate');
	var ioCode =  grid.getValue(rowKey, 'ioCode');
	var materialCode = grid.getValue(rowKey, 'materialCode'); // 값 들어왔나 확인용 
	
	if(checkNull(ioDate) && checkNull(materialCode)){
		ioDate = ioDate.replace('-','').replace('-','').substr(2);
		var newLot = 'MAT-' + ioDate + '-' + ioCode;
		grid.setValue(rowKey, 'lotNo', newLot, false);
	}
}

function calPrice(ev){
	var rowKey = ev.rowKey;
	
	var ioVolume = grid.getValue(rowKey, 'ioVolume')
	var unitPrice =  grid.getValue(rowKey, 'unitPrice')
	var price = ioVolume * unitPrice;
	
	grid.setValue(rowKey, 'price', price, false);
}

function setMatInfo(ev){
	
	var rowKey = ev.rowKey;
	var inorderCode =  grid.getValue(rowKey, 'inorderCode');
	
	if(checkNull(inorderCode)){
		$.ajax({
			type : "get",
			data: {"inorderCode" : inorderCode},
			url : "ajax/getMatInfoForIn.do",
			dataType : "json",
			async : false,
			success : function(data) {
				console.log(data);
				grid.setValue(rowKey, 'materialCode', data.materialCode, false);
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
	for(var i = 0 ; i < grid.getRowCount() ; i++){
		
		if(checkEmpty(i, 'ioDate', '입고일자를 입력하세요.'));
		else if(checkDate(i, 'ioDate', '입고일자를 확인하세요.'));
		else if(checkEmpty(i, 'inorderCode', '발주번호를 입력하세요.'));
		else if(checkEmpty(i, 'ioVolume', '입고량을 확인하세요.'));
		else if(checkNum(i, 'ioVolume', '입고량을 확인하세요.'));
		else if(checkEmpty(i, 'unitPrice', '단가를 입력하세요.'));
		else if(checkNum(i, 'unitPrice', '단가를 확인하세요.'));
		else{
			if(i == grid.getRowCount()-1)
				grid.request('modifyData');
		}
	}
});

function checkEmpty(rowKey, columnName, text){
	if(!checkNull(grid.getValue(rowKey, columnName))){
		toast(text, 'No.'+grid.getValue(rowKey, 'ioCode'));
		focus(rowKey, columnName, true);
		return true;
	}else
		return false;
}

function checkDate(rowKey, columnName, text){
	var datatimeRegexp = /[0-9]{4}-[0-9]{2}-[0-9]{2}/;
	if(!datatimeRegexp.test(grid.getValue(rowKey, columnName))){
		toast(text, 'No.'+grid.getValue(rowKey, 'ioCode'));
		grid.setValue(rowKey, columnName, '', false);
		focus(rowKey, columnName, true);
		return true;
	}else
		return false;
}

function checkNum(rowKey, columnName, text){
	if(isNaN(grid.getValue(rowKey, columnName)) || grid.getValue(rowKey, columnName) < 0){
		toast(text, 'No.'+grid.getValue(rowKey, 'ioCode'));
		grid.setValue(rowKey, columnName, '', false);
		focus(rowKey, columnName, true);
		return true;
	}else
		return false;
	
}

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

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}


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

// 업체 돋보기
$("#btnCompModal").on("click", function(e) {
	$('#companyCode').val('');
	$('#companyName').val('');
    $('#compContent').load("compModal.do");
});

// 업체코드 입력창
$('#companyCode').on('click',function(){
	$('#companyCode').val('');
	$('#companyName').val('');
	$('#compModal').modal('show');
	$('#compContent').load("compModal.do");
	
});

var rowKey;
// 발주번호 입력창 그리드
grid.on('dblclick', function(ev){
	if(ev.columnName == 'inorderCode'){
		rowKey = ev.rowKey;
		inorderCode = grid.getValue(rowKey, 'inorderCode');
		$('#inorderModal').modal('show');
		$('#inorderContent').load("inorderModal.do");
	}

})



