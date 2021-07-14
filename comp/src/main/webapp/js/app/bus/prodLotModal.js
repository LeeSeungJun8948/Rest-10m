(function($) {
	$("#prodLotModal").on('shown.bs.modal', function() {

		if (!checkNull($('#prodLotGrid').html())) {
			var prodLotData = {
				api: {
					readData: {
						url: 'searchProdLot.do',
						method: 'POST'
					}
				},
				contentType: 'application/json'
			};
			var prodLotGrid = new tui.Grid({
				el: document.getElementById('prodLotGrid'),
				data: prodLotData,
				scrollX: false,
				scrollY: true,
				bodyHeight: 360,
				columns: [{
					header: '순번',
					name: 'lotIdx',
					align: 'center'
				},
				{
					header: '제품Lot',
					name: 'productLot',
					align: 'center'
				}]
			});

			$("#btnReadModal").on("click", function() {
				var param = $('#frmProdLotModal').serializeObject();
				console.log(param);
				prodLotGrid.readData(1, param, true);
			});
			var lotIdx;
			var productLot;


			prodLotGrid.on('click', (ev) => {
				lotIdx = prodLotGrid.getValue(ev.rowKey, 'lotIdx');
				productLot = prodLotGrid.getValue(ev.rowKey, 'productLot');
			});

			$('#btnSelect').on('click', function() {
				select();
			});

			prodLotGrid.on('dblclick', function() {
				select();
			});

			function select() {
				$('#lotIdx').val(lotIdx);
				$('#productLot').val(productLot);
				$('#prodLotModal').modal('hide');
				$('#modalContent').remove();
			}

		}

	});


})(jQuery);
