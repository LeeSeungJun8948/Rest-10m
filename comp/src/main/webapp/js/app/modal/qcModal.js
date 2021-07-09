			
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
	
	qcGrid.on('click', function(ev) {
		var values = qcGrid.getRow(ev.rowKey);
		var prdCode = values.productCode;
		$('#productCode').val(prdCode);
		console.log(prdCode);

				});

				
				function fnSearch() {
				$("#frm").submit();
				}
				// bom 자재리스트 버튼
				$('#btnSearch').on('click', function() {
					var prm = $('#frm').serializeObject();
					grid.readData(1, prm, true);
				})
