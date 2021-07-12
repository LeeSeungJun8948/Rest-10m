(function($) {
	$("#exportModal").on('shown.bs.modal', function() {

		if (!checkNull($('#modalExportListGrid').html())) {
		var dataSourceModal = {
				contentType: 'application/json',
				api: {
					readData: { url: 'searchExport.do', method: 'POST' },
				}
			}
			var modalExportListGrid = new tui.Grid({
				el: document.getElementById('modalExportListGrid'),
				data: dataSourceModal,
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

// 검색 버튼
			$('#btnSearch').on('click', function() {
				var param = $('#modalFrm').serializeObject();
				console.log(param)
				modalExportListGrid.readData(1, param, true);
			});

			var exportCode;
			var exportDate;
			var companyCode;
			var comments;
			
			modalExportListGrid.on('click', (ev) => {
				exportCode = modalExportListGrid.getValue(ev.rowKey, 'exportCode');
				exportDate = modalExportListGrid.getValue(ev.rowKey, 'exportDate');
				companyCode = modalExportListGrid.getValue(ev.rowKey, 'companyCode');
				comments = modalExportListGrid.getValue(ev.rowKey, 'comments');
			});
$('#btnSelect').on('click', function() {
				select();
			});

			modalExportListGrid.on('dblclick', function() {
				select();
			});
			
			function select() {
				$('#exportCode').val(exportCode);
				$('#exportDate').val(exportDate);
				$('#companyCode').val(companyCode);
				$('#comments').val(comments);
				grid.readData(1, { exportCode: exportCode }, true);
				$('#exportModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});

})(jQuery);
