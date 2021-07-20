$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});


const dataSource = {
	api : {
		readData : {url: contextPath + '/ajax/getInorderList.do' , method:'GET' },
		modifyData : {url: contextPath + '/ajax/modifyInorder.do' , method:'POST' }
	},
	contentType: 'application/json'
};
	
const grid = new tui.Grid({
	el : document.getElementById('inorderList'),
	data : dataSource,
	scrollX : false,
	scrollY : true,
	bodyHeight: 360,
	columns : [ 
		{
			header : '발주번호',
			name : 'inorderCode',
			width : 80,
			align: 'center'
		}, {
			header : '발주일자',
			name : 'inorderDate',
			width : 120,
			align: 'center',
			editor: {
				type: 'datePicker',
				options: {
				language: 'ko',
				format: 'yyyy-MM-dd'
				}
			},
			validation: {
            	required: true
          	}
		}, {
			header : '자재코드',
			name : 'materialCode',
			width : 80,
			align: 'center',
			className: 'white',
			validation: {
            	required: true
          	}
		}, {
			header : '자재명',
			name : 'materialName',
			width : 120,
			align: 'center'
		},{
			header : '발주코드',
			name : 'companyCode',
			hidden : true
		}, {
			header : '발주업체',
			name : 'companyName',
			width : 120,
			align: 'center',
			className: 'white'
		}, {
			header : '입고일자',
			name : 'inDate',
			width : 120,
			align: 'center'
		}, {
			header : '발주량',
			name : 'inorderCount',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		},
			editor: 'text',
			validation: {
				dataType: 'number',
            	required: true
          	}
		}, {
			header : '입고량',
			name : 'inCount',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '미입고량',
			name : 'yetCount',
			width : 120,
			align: 'right',
			formatter({value}) {
      			return format(value);
    		}
		}, {
			header : '비고',
			name : 'comments',
			width : 210,
			align: 'right'
		} 
	],
	summary : {
		
		height: 40,
	   	position: 'bottom',
	   	columnContent: {
        	inDate: {
                template(summary) {
        			return '합 계';
                } 
            },	
			inorderCount: {
                template(summary) {
					var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            },
			inCount: {
                template(summary) {
        			var summaryResult = (summary.sum);
        			return format(summaryResult);
                } 
            },
			yetCount: {
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

$('#btnRead').on('click',  function(){
	var param = $('#frm').serializeObject();
	console.log(param);
	grid.readData(1, param, true);
});

var newInorderCode;
	
$("#btnGridAdd").on("click", function(){
	
	if(checkNull(newInorderCode)){
		newInorderCode = newInorderCode * 1 + 1;
	}else{
		$.ajax({
			type : "get",
			url : contextPath + "/ajax/getNewInorderCode.do",
			dataType : "json",
			async : false,
			success : function(data) {
				console.log(data)
				console.log(data+"=========================")
				newInorderCode = data.inorderCode;
			},
			error : function() {
				console.log("아작스실패");
			}
		});		
	}

	newRowData = {'inorderCode' : newInorderCode, 'inorderDate' : getFormatDate(new Date())};
	grid.appendRow(newRowData,{
		at : grid.getRowCount(),
		focus : true
	});
});


$("#btnGridDel").on("click", function(ev){
	grid.removeCheckedRows(true);
});


$("#btnSave").on("click", function(){

	for(var valid of grid.validate()){
		for(var errors of valid.errors){
			var header;
			for(var column of grid.getColumns()){
				if(column.name == errors.columnName)
					header = column.header;
			}
			toast(header+'를 확인하세요.',grid.getValue(valid.rowKey, 'ioCode'));	
		}
	}
	
	if(grid.validate().length == 0){
		grid.request('modifyData');
	}

});

//excel
$("#btnExcel").on("click", function(e) {
	var data = grid.getData();
	for(var i = 0 ; i < data.length ; i++){
		delete data[i]._attributes;
		delete data[i].rowKey;
	}
	
	$('#param').val(JSON.stringify(data));
	console.log($('#param').val());
	frmExcel.submit();	
})

// 모달 오픈
var forGrid = false;
// 자재 돋보기
$("#btnMatModal").on("click", function(e) {
	$('#materialCode').val('');
	$('#materialName').val('');
    $('#matContent').load(contextPath +"/modal/matModal.do");
});

// 자재코드 입력창
$('#materialCode').on('click', function(){
	$('#materialCode').val('');
	$('#materialName').val('');
	$('#matModal').modal('show');
	$('#matContent').load(contextPath +"/modal/matModal.do");
});

// 업체 돋보기
$("#btnCompModal").on("click", function(e) {
	$('#companyCode').val('');
	$('#companyName').val('');
    $('#compContent').load(contextPath +"/modal/compModal.do");
});

// 업체 코드 입력창
$('#companyCode').on('click', function(){
	$('#companyCode').val('');
	$('#companyName').val('');
	$('#compModal').modal('show');
	$('#compContent').load(contextPath +"/modal/compModal.do");
});

// 그리드에서 자재코드
grid.on('dblclick', function(ev){
	if(ev.columnName == 'materialCode'){
		rowKey = ev.rowKey;
		forGrid = true;
		$('#matModal').modal('show');
		$('#matContent').load(contextPath +"/modal/matModal.do");
	}else if(ev.columnName == 'companyName'){
		rowKey = ev.rowKey;
		forGrid = true;
		$('#compModal').modal('show');
		$('#compContent').load(contextPath +"/modal/compModal.do");
	}
})

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "200"
 	};
	toastr.error(text,title);
}

function getFormatDate(date){
    var year = date.getFullYear();              //yyyy
    var month = (1 + date.getMonth());          //M
    month = month >= 10 ? month : '0' + month;  //month 두자리로 저장
    var day = date.getDate();                   //d
    day = day >= 10 ? day : '0' + day;          //day 두자리로 저장
    return  year + '-' + month + '-' + day;
}
