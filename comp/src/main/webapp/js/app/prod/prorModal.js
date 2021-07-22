(function($) {
	$("#prorModal").on('shown.bs.modal', function() {
		if (!checkNull($('#gridModal').html())) {
			$("#prorModal").ready(function() {	
				document.getElementById('searchDtS').valueAsDate = new Date();
				document.getElementById('searchDtE').valueAsDate = new Date();
			});
			
			var dataSourceModal = {
				contentType: 'application/json',
				api: {
					readData: { url: 'searchProrder.do', method: 'POST' },
				}
			}

			var gridModal = new tui.Grid({
				el: document.getElementById('gridModal'),
				scrollX: false,
				scrollY: false,
				data: dataSourceModal,
				columns: [{
					header: '생산지시번호',
					name: 'prorCode',
					align: 'center'
				}, {
					header: '지시명',
					name: 'prorName',
					align: 'center'
				}, {
					header: '지시일자',
					name: 'prorDate',
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
				gridModal.readData(1, param, true);
			});

			var prorCode;
			var prorDate;
			var prorName;
			var comments;
			
			gridModal.on('click', (ev) => {
				prorCode = gridModal.getValue(ev.rowKey, 'prorCode');
				prorDate = gridModal.getValue(ev.rowKey, 'prorDate');
				prorName = gridModal.getValue(ev.rowKey, 'prorName');
				comments = gridModal.getValue(ev.rowKey, 'comments');
			});

			$('#btnSelect').on('click', function() {
				select();
			});

			gridModal.on('dblclick', function() {
				select();
			});
			
			function select() {
				$('#prorCode').val(prorCode);
				$('#prorDate').val(prorDate);
				$('#prorName').val(prorName);
				$('#comments').val(comments);
				grid.readData(1, { prorCode: prorCode }, true);
				$('#prorModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});
})(jQuery);