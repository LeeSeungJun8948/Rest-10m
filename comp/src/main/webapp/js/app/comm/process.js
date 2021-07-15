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

function checkNull(value){
	return value != null && value != '' && value != '[object HTMLInputElement]';
}


var newProCode;
$("#btnRowInsert").on("click", function(){
	//행추가시 코드+1
	if(checkNull(newProCode)){
		newProCode = newProCode * 1 + 1;
	}else{
		$.ajax({
			type : "get",
			url : "ajax/maxProcessCode.do",
			dataType : "json",
			async : false,
			success : function(data) {
				newProCode = data.processCode;
				
			},
			error : function() {
			
			}
		});		
	}

	var newRowData = {'processCode' : newProCode};
	grid.appendRow(newRowData,{
		at : grid.getRowCount(),
		focus : true
	});
});

$("#btnInsert").on("click", function(){
		//입력시 안내문구		
		for(var valid of grid.validate()){
			for(var errors of valid.errors){
				var header;
				for(var column of grid.getColumns()){
					if(column.name == errors.columnName)
					header = column.header;
				}
				toast(header+'를 확인하세요.',grid.getValue(valid.rowKey, 'processName'));
			}
		}
		if(grid.validate().length == 0){
		grid.request('modifyData'); 
		}
	});

function toast(text, title){
	toastr.options = {
		closeButton: true,
		showDuration: "200"
 	};
	toastr.error(text,title);
}



$("#btnDelete").on("click",function() {
	grid.removeCheckedRows(false);
	grid.request('deleteData');
})

$('#btnSearch').on('click', function() {
		var prm = $('#frm').serializeObject();
		grid.readData(1, prm, true);
	})
