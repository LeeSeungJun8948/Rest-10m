(function($) {
	$("#workFacModal").on('shown.bs.modal', function() {

		if (!checkNull($('#facGrid').html())) {
			var facData = {
				api: {
					readData: {
						url: 'ajax/workFacModal.do',
						method: 'POST'
					}
				},
				contentType: 'application/json'
			};
			var facGrid = new tui.Grid({
				el: document.getElementById('facGrid'),
				data: facData,
				scrollX: false,
				scrollY: false,
				bodyHeight: 360,
				columns: [{
					header: '설비코드',
					name: 'facCode',
					align: 'center',
					width: 80
				}, {
					header: '설비명',
					name: 'facilitiesName',
					align: 'center'
				}, {
					header: '모델',
					name: 'model',
					align: 'center'
				}, {
					header: '용도',
					name: 'purpose',
					align: 'center'
				}]
			});

			$("#btnReadModal").on("click", function() {
				var param = $('#frmFacModal').serializeObject();
				facGrid.readData(1, param, true);
			});

			var facCode;
			var facilitiesName;
			facGrid.on('click', (ev) => {
				facCode = facGrid.getValue(ev.rowKey, 'facCode');
				facilitiesName = facGrid.getValue(ev.rowKey, 'facilitiesName');
			});

			$('#btnSelect').on('click', function() {
				select();
			});

			facGrid.on('dblclick', function() {
				select();
			});

			function select() {
				$('#facilitiesName').val(facilitiesName);
				$('#facCode').val(facCode);
				$('#workFacModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});
})(jQuery);