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



$("#btnRowInsert").on("click", function(){
		grid.appendRow();
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
		girdList.readData(1, param, true);
		})
	//불량내역 행추가
	$("#errorRowInsert").on("click", function(){
		girdList.appendRow();
			});
	//불량내역 추가
	$("#btnInsertErrorList").on("click", function(){
		//girdList.request('createData');
		girdList.request('modifyData', {
		checkedOnly: true
		});
	})
	$("#btnDelteErrorList").on("click",function() {
		girdList.removeCheckedRows(false);
		girdList.request('deleteData');
	})
