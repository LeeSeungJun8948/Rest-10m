$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});

// 그리드
const dataSource = {
	api : {
		readData : { url: 'ajax/inspectionList.do', method:'GET' },
		deleteData : { url : 'ajax/deleteIns.do', method : 'POST' },
		createData : { url : 'ajax/insertIns.do', method : 'POST' },
		updateData : { url : 'ajax/updateIns.do', method : 'PUT'},
		modifyData : { url : 'ajax/modifyIns.do', method : 'PUT'}
	},
	contentType: 'application/json'
}    
const grid = new tui.Grid({ 
	el : document.getElementById('grid'),
	data : dataSource,
	scrollX : false,
	scrollY : false,
	rowHeaders : [ 'checkbox' ],
	columns : [ {
		header : '정기점검코드',
		name : 'inspectionCode'
	}, {
		header : '설비명',
		name : 'facilitiesName',
		validation: { required: true }
	}, {
		header : '설비코드',
		name : 'facCode',
	},  {
		header : '설비점검주기',
		name : 'facInspection'
	}, {
		header : '전점검일',
		name : 'beforeDate',
	}, {
		header : '점검일',
		name : 'today',
		editor: {
			type: 'datePicker',
			options: {
			language: 'ko',
			format: 'YYYY-MM-dd'
			}
		}
			
	}, {
		header : '차기점검일',
		name : 'afterDate'
	}, {
		header : '판정',
		name : 'judgement',
		editor: { type: 'select',
        options: {
        listItems: [
          { text: '적합', value: '적합' },
          { text: '부적합', value: '부적합' }
          ]}
		}
	}, {
		header : '조치사항',
		name : 'insComment',
		editor: 'text'
	}]
});

$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [o[this.name]];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};

// 조회
$('#btnRead').on('click',  function(){
	var param = $('#frm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});

//삭제
$("#btnDel").on("click", function() {
	grid.removeCheckedRows(true);
});

//저장
$("#btnSave").on("click", function(){
	grid.request('modifyData');
});

// 행추가
var newInsCode;

$("#btnAdd").on("click", function(){
	if(checkNull(newInsCode)){
		newInsCode = newInsCode * 1 + 1;
	}else{
		$.ajax({
			type : "get",
			url : "ajax/getInsCode.do",
			dataType : "json",
			async : false,
			success : function(data) {
				newInsCode = data.inspectionCode;
			},
			error : function() {
			}
		});		
	}
	
	newRowData = {'inspectionCode' : newInsCode, 
				 // 'today' : getFormatDate(new Date()),
				 // 'beforeDate' :
				 };
	grid.appendRow(newRowData,{
		at : grid.getRowCount(),
		focus : true
	});
});


// 행추가시 insCode, 날짜 추가시 자동입력때 필요한 함수
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

// 그리드 설비명 클릭
var rowKey;
grid.on('dblclick', function(ev){
	if(ev.columnName == 'facilitiesName'){
		rowKey = ev.rowKey;
		facilitiesName = grid.getValue(rowKey, 'facilitiesName');
		$('#facModal').modal('show');
		$('#facContent').load("facModel.do");
	}
});

// 점검일 설정시 전점검일/차기점검일 계산
grid.on('afterChange', function(ev){
		//console.log(ev);
	if(ev.changes[0].columnName == 'today') {
		rowKey = ev.changes[0].rowKey;
		//console.log(ev.changes[0].value);
		today = grid.getValue(rowKey, 'today');
		inspec = grid.getValue(rowKey, 'facInspection');
		
		date = new Date(today);
		date.setDate(date.getDate()-inspec);
		before = getFormatDate(date);
		//console.log('before: ' + before);
		grid.setValue(rowKey, 'beforeDate', before);
		
		date = new Date(today);
		//console.log('inspec: ' + parseInt(inspec));
		date.setDate(date.getDate()+parseInt(inspec));
		after =getFormatDate(date);
		//console.log('after: ' + after);
		grid.setValue(rowKey, 'afterDate', after);
	}
});

// 적합/부적합 select값 넣기
grid.on('dblclick', function(ev){
	if(ev.columnName == 'judgement') {
		rowKey = ev.columnName;
		judgement = grid.getValue(rowKey, 'judgement');
	}
});

grid.on('dblclick', function(ev){
	rowKey = ev.rowKey;
	facilitiesName = grid.getValue(rowKey, 'facilitiesName');
	if(ev.columnName == 'today') {
		if(!checkNull(facilitiesName)) {
		toastr.warning('설비명을 선택해주십시오.');
			return false;
		} else
			return true;	
	}
});
function checkNull(value){ 
		return value != null && value != '' && value != '[object HTMLInputElement]';
	}; 