
function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

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


var newErrorCode; 
$("#btnRowInsert").on("click", function(){
		if(checkNull(newErrorCode)){
		newErrorCode = newErrorCode * 1 + 1;
	}else{
		$.ajax({
			type : "get",
			url : "ajax/getNewErrorCode.do",
			dataType : "json",
			async : false,
			success : function(data) {
				newErrorCode = data.errorCode;
			},
			error : function() {
			}
		});		
	}

	var newRowData = {'errorCode' : newErrorCode};
	grid.appendRow(newRowData,{
		at : grid.getRowCount(),
		focus : true
	});
});

$("#btnInsert").on("click", function(){
		//grid.request('createData');
		grid.request('modifyData', {
		checkedOnly: true
		});
})

$("#btnDelete").on("click",function() {
	grid.removeCheckedRows(false);
	grid.request('deleteData');
})

$('#btnSearch').on('click', function() {
		var prm = $('#frm').serializeObject();
		grid.readData(1, prm, true);
	})
	
	//불량내역 리스트 검색
	$("#btnCheck").on("click", function() {
		var param = $('#errorListSearchForm').serializeObject();
		grid.readData(1, param, true);
		})
