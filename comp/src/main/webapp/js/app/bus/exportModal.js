(function($) {
	$("#exportModal").on('shown.bs.modal', function() {

		if (!checkNull($('#modalExportListGrid').html())) {
		var dataSourceModal = {
				contentType: 'application/json',
				api: {
					readData: { url: contextPath+'/ajax/searchExport.do', method: 'POST' },
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
				}, 
				 {
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
			var companyName;
			var comments;
			
			modalExportListGrid.on('click', (ev) => {
				exportCode = modalExportListGrid.getValue(ev.rowKey, 'exportCode');
				exportDate = modalExportListGrid.getValue(ev.rowKey, 'exportDate');
				companyCode = modalExportListGrid.getValue(ev.rowKey, 'companyCode');
				companyName = modalExportListGrid.getValue(ev.rowKey, 'companyName');
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
				$('#companyName').val(companyName);
				$('#comments').val(comments);
				grid.readData(1, { exportCode: exportCode }, true);
				$('#exportModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});

})(jQuery);
