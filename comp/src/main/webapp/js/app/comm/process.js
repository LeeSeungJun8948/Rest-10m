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
	if(checkNull(newProCode)){
		newProCode = newProCode * 1 + 1;
	}else{
		$.ajax({
			type : "get",
			url : "ajax/maxProcessCode.do",
			dataType : "json",
			async : false,
			success : function(data) {
				newProCode = data.newProCode;
				alert(성공);
			},
			error : function() {
				alert(실패);
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
