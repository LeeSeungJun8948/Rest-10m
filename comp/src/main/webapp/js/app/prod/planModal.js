(function($) {
	$("#planModal").on('shown.bs.modal', function() {
		if (!checkNull($('#gridModal').html())) {
			$("#planModal").ready(function() {	
				document.getElementById('searchDtS').valueAsDate = new Date();
				document.getElementById('searchDtE').valueAsDate = new Date();
			});

			var dataSourceModal = {
				contentType: 'application/json',
				api: {
					readData: { url: 'searchPlan.do', method: 'POST' },
				}
			}

			var gridModal = new tui.Grid({
				el: document.getElementById('gridModal'),
				scrollX: false,
				scrollY: false,
				data: dataSourceModal,
				columns: [{
					header: '생산계획번호',
					name: 'planCode',
				}, {
					header: '계획명',
					name: 'planName',
				}, {
					header: '계획일자',
					name: 'planDate',
				}, {
					header: '특기사항',
					name: 'comments',
				}]
			});

			// 검색 버튼
			$('#btnSearch').on('click', function() {
				var param = $('#modalFrm').serializeObject();
				gridModal.readData(1, param, true);
			});

			var planCode;
			var planDate;
			var planName;
			var comments;
			
			gridModal.on('click', (ev) => {
				planCode = gridModal.getValue(ev.rowKey, 'planCode');
				planDate = gridModal.getValue(ev.rowKey, 'planDate');
				planName = gridModal.getValue(ev.rowKey, 'planName');
				comments = gridModal.getValue(ev.rowKey, 'comments');
			});

			$('#btnSelect').on('click', function() {
				select();
			});

			gridModal.on('dblclick', function() {
				select();
			});
			
			function select() {
				$('#planCode').val(planCode);
				$('#planDate').val(planDate);
				$('#planName').val(planName);
				$('#comments').val(comments);
				grid.readData(1, { planCode: planCode }, true);
				$('#planModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});
})(jQuery);