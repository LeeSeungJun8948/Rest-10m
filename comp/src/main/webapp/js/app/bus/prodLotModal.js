(function($) {
	$("#prodLotModal").on('shown.bs.modal', function() {
		if (!checkNull($('#prodLotGrid').html())) {
			var prodLotData = {
				api: {
					readData: {
						url: contextPath+'/ajax/searchProdLot.do',
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
				columns: [
					{
						header: '제품코드',
						name: 'productCode',
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
			var productLot;


			prodLotGrid.on('click', (ev) => {
				productLot = prodLotGrid.getValue(ev.rowKey, 'productLot');
			});

			$('#btnSelect').on('click', function() {
				select();
			});

			prodLotGrid.on('dblclick', function() {
				select();
			});

			function select() {
				$('#productLot').val(productLot);
				$('#prodLotModal').modal('hide');
				$('#modalContent').remove();
			}

		}

	});


})(jQuery);
