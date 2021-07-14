(function($) {
	$("#prodLotModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#prodLotGrid').html())){
			var prodData = {
				api : {
					readData : {
					url : 'ajax/prodLotModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var prodLotGrid = new tui.Grid({	
				el : document.getElementById('prodLotGrid'),
				data : prodData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '제품Lot',
					name : 'productLot',
					align: 'center',
					width: 80
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
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			prodGrid.on('dblclick', function(){
				select();
			});
	
				function select(){
				$('#productLot').val(productLot);
				$('#prodLotModal').modal('hide');
				$('#modalContent').remove();
			}
			  
		}
	
	});

	
})(jQuery);
