(function($) {

	$("#matLotModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#matLotGrid').html())){
			var matLotData = {
				api : {
					readData : {
					url : contextPath + '/ajax/matLotListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			
			var matLotGrid = new tui.Grid({	
				el : document.getElementById('matLotGrid'),
				data : matLotData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : 'LOT_NO',
					name : 'lotNo',
					align: 'center'
				}, {
					header : '재고',
					name : 'lotStock',
					align: 'center'
				}, {
					header : '입고일자',
					name : 'ioDate',
					align: 'center'
				} ]
			});
			
			var param = {'materialCode' : materialCode}
			matLotGrid.readData(1, param, true);
	
			var lotNo;
			var lotStock;
			
			matLotGrid.on('click', (ev) => { 
				lotNo = matLotGrid.getValue(ev.rowKey, 'lotNo');
				lotStock = matLotGrid.getValue(ev.rowKey, 'lotStock');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			matLotGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				grid.setValue(rowKey, 'lotNo',lotNo, false);
				grid.setValue(rowKey, 'ioVolume',lotStock, false);
				$('#matLotModal').modal('hide');
				$('#modalContent').remove();
			}
			 
		}
	
	});

	
})(jQuery);
