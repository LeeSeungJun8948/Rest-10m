(function($) {

	$("#matLotModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#matLotListGrid').html())){
			var matLotListData = {
				api : {
					readData : {
					url : 'ajax/matLotListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			
			var matLotListGrid = new tui.Grid({	
				el : document.getElementById('matLotListGrid'),
				data : matLotListData,
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
			matLotListGrid.readData(1, param, true);
	
			var lotNo;
			var lotStock;
			
			matLotListGrid.on('click', (ev) => { 
				lotNo = matLotListGrid.getValue(ev.rowKey, 'lotNo');
				lotStock = matLotListGrid.getValue(ev.rowKey, 'lotStock');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			matLotListGrid.on('dblclick', function(){
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
