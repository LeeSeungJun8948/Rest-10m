(function($) {
	$("#prodModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#prodGrid').html())){
			var prodData = {
				api : {
					readData : {
					url : 'ajax/prodListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var prodGrid = new tui.Grid({	
				el : document.getElementById('prodGrid'),
				data : prodData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '제품코드',
					name : 'productCode',
					align: 'center',
					width: 80
				}, {
					header : '제품명',
					name : 'productName',
					align: 'center'
				}]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmProdModal').serializeObject();
				console.log(param);
				prodGrid.readData(1, param, true);
			});
			
			var productCode;
			var productName;
			
			prodGrid.on('click', (ev) => { 
				productCode = prodGrid.getValue(ev.rowKey, 'productCode');
				productName = prodGrid.getValue(ev.rowKey, 'productName');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			prodGrid.on('dblclick', function(){
				select();
			});
			
			//function select(){
				//$('#productCode').val(productCode);
				//$('#productName').val(productName);
				
				//if(forGrid){
					//grid.setValue(rowKey, 'productCode', productCode, false);
					//forGrid = false;
				//}
				//
				//$('#prodModal').modal('hide');
				//$('#modalContent').remove();
			//}
				function select(){
				$('#productCode').val(productCode);
				$('#productName').val(productName);
				$('#prodModal').modal('hide');
				$('#modalContent').remove();
			}
			  
		}
	
	});

	
})(jQuery);
