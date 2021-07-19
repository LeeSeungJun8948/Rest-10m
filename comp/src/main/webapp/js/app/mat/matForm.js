$('#matNo').val('');
$('#unitNo').val('');


function gridClear(){
	
}
	
const listData = {
	api : {
		readData : {url: contextPath + '/ajax/matList.do' , method:'GET' },
		modifyData : {url: contextPath + '/ajax/matModify.do' , method:'PUT'}
	},
	contentType: 'application/json'
};

// listGrid 생성
const listGrid = new tui.Grid({
	el : document.getElementById('matList'),
	data : listData,
	scrollX : false,
	scrollY : true,
	bodyHeight: 450,
	selectionUnit: 'row',
	columns : [ {
		header : '자재코드',
		name : 'materialCode',
		width : 120,
		align: 'center',
		validation: {
           	required: true
		},
		sortable: true
	}, {
		header : '자재명',
		name : 'materialName',
		validation: {
           	required: true
       	},
		sortable: true
	}, {
		header : '구분',
		name : 'matNm',
		width : 120,
		align: 'center',
		validation: {
			required: true
		},
		sortable: true
	}, {
		header : '자재구분',
		name : 'matNo',
		hidden: true,
		validation: {
	  		required: true
		}
	}, {
		header : '입고업체',
		name : 'companyCode',
		hidden: true,
		validation: {
			required: true
		}
	}, {
		header : '입고업체',
		hidden: true
	}, {
		header : '관리단위',
		name : 'unitNo',
		hidden: true,
		validation: {
	  		required: true
		}
	}, {
		name : 'saveStock',
		hidden: true
	}, {
		name : 'minStock',
		hidden: true
	}, {
		name : 'maxStock',
		hidden: true
	}, {
		name : 'monthStock',
		hidden: true
	} ]
});

var rowKey;
// list에서 선택한 자재 정보 가져오기
listGrid.on('click',function(e){
	
	rowKey = e.rowKey;
		
	$('#materialCode').val(listGrid.getValue(rowKey, 'materialCode'));
	$('#materialName').val(listGrid.getValue(rowKey, 'materialName'));
	$('#matNo').val(listGrid.getValue(rowKey, 'matNo')).prop("selected",true);
	$('#companyCode').val(listGrid.getValue(rowKey, 'companyCode'));
	$('#companyName').val(listGrid.getValue(rowKey, 'companyName'));
	$('#unitNo').val(listGrid.getValue(rowKey, 'unitNo')).prop("selected",true);
	$('#saveStock').val(listGrid.getValue(rowKey, 'saveStock'));
	$('#minStock').val(listGrid.getValue(rowKey, 'minStock'));
	$('#maxStock').val(listGrid.getValue(rowKey, 'maxStock'));
	$('#monthStock').val(listGrid.getValue(rowKey, 'monthStock'));
	
});


//readonly 값도 실시간 감지하기위해.. 원리는 모름
$(document).ready(function(){
    var $input = $("#companyCode"); // readonly inputBox  
        $("#companyCode").on('input', function() {
			listGrid.setValue(rowKey, $(this).attr('id'), $(this).val(), false);
        });
});

(function ($) {
    var originalVal = $.fn.val;
    $.fn.val = function (value) {
        var res = originalVal.apply(this, arguments);
 
        if (this.is('input[readonly="readonly"]') && arguments.length > 0) {
            this.trigger("input");
        }
        return res;
    };
})(jQuery);


$('input').on('propertychange change keyup paste input', function(){
	listGrid.setValue(rowKey, $(this).attr('id'), $(this).val(), false);
})

$(document).on('change','#matNo',function(){
	listGrid.setValue(rowKey, 'matNo', $(this).val(), false);
	listGrid.setValue(rowKey, 'matNm',$(this).find("option[value='"+$(this).val() +"']").html() , false);
});

$(document).on('change','#unitNo',function(){
	listGrid.setValue(rowKey, 'unitNo', $(this).val(), false);
});
	
$('#btnSave').on('click',function(){
	
	for(var valid of listGrid.validate()){
		for(var errors of valid.errors){
			var header;
			for(var column of listGrid.getColumns()){
				if(column.name == errors.columnName)
					header = column.header;
			}
			toast(header+'를 확인하세요.','No.' + listGrid.getValue(valid.rowKey,'materialCode'));
		}
	}
	
	if(listGrid.validate().length == 0)
		listGrid.request('modifyData');
	
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
$('#btnNew').on('click',function(){	
	
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
	rowKey = listGrid.getRowCount();
	listGrid.appendRow(newRowData,{
		at : listGrid.getRowCount(),
		focus : true
	});
	$('input').val('');
	$('select').val('');
	$('#materialCode').val(newMatCode); // 이거 지워보기
});
	
	
// 자재 정보 삭제
$('#btnDel').on('click',function(){
	if(confirm(listGrid.getValue(rowKey, 'materialName') +' 자재를 정말로 삭제하시겠습니까?(저장시 적용)')){
		listGrid.removeRow(rowKey, {});
		$('input').val('');
		$('select').val('');
	}
});


// 모달
var forGrid = false;

$("#btnCompModal").on("click", function(e) {
    $('#compContent').load(contextPath + "/modal/compModal.do");
});

$('#companyCode').on('click',function(){
	$('#compModal').modal('show');
	$('#compContent').load(contextPath + "/modal/compModal.do");
	
})

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}
	
	
