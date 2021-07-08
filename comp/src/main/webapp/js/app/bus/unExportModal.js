(function($) {
	$("#unExportModal").on('shown.bs.modal', function() {
		
		$('#fromDateModal').val($('#fromDate'));
		$('#toDateModal').val($('#toDate'));
		if (!checkNull($('#modalUnExportListGrid').html())) {
			var unExportListModalData = {
				api: {
					readData: {
						url: 'ajax/unExportModal.do',
						method: 'POST'
					}
				},
				contentType: 'application/json'
			};
			var modalUnExportListGrid = new tui.Grid({
				el: document.getElementById('modalUnExportListGrid'),
				data: unExportListModalData,
				scrollX: false,
				scrollY: true,
				bodyHeight: 1000,
				columns: [{
					header: '제품코드',
					name: 'productCode',
					align: 'center',
					width: 80
				}, {
					header: '제품명',
					name: 'productName',
					align: 'center'
				}, {
					header: '규격',
					name: 'stdId',
					align: 'center'
				}  , {
					header: '단위',
					name: 'unitId',
					align: 'center'
				}, {
					header: '주문번호',
					name: 'orderNo',
					align: 'center'
				},{
					header: '미출고량',
					name: 'unExport',
					align: 'center'
				}]
			});

var param = $('#dateForm').serializeObject();
				console.log(param);
				modalUnExportListGrid.readData(1, param, true);
				
			$("#btnReadModal").on("click", function() {
				var param = $('#dateForm').serializeObject();
				console.log(param);
				modalUnExportListGrid.readData(1, param, true);
			});

			

		}

	});


})(jQuery);
