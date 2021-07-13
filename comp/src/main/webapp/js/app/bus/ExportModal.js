(function($) {
	$("#ExportModal").on('shown.bs.modal', function() {

		if (!checkNull($('#modalUnExportListGrid').html())) {
			var ExportListModalData = {
				api: {
					readData: {
						url: 'ajax/readExportModal.do',
						method: 'POST'
					}
				},
				contentType: 'application/json'
			};
			var modalUnExportListGrid = new tui.Grid({
				el: document.getElementById('modalExportListGrid'),
				data: unExportListModalData,
				scrollX: false,
				scrollY: true,
				bodyHeight: 1000,
				columns: [{
					header: '출고번호',
					name: 'exportCode',
					align: 'center',
					width: 80
				}, {
					header: '출고일자',
					name: 'exportDate',
					align: 'center'
				}, {
					header: '업체코드',
					name: 'companyCode',
					align: 'center'
				}, {
					header: '특기사항',
					name: 'comments',
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
