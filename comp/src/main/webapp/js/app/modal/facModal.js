(function($) {
	$("#facModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#facGrid').html())){
			var matData = {
				api : {
					readData : {
					url : 'ajax/facListModel.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var facGrid = new tui.Grid({	
				el : document.getElementById('facGrid'),
				data : matData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '설비명',
					name : 'facilitiesName',
					align: 'center',
					width: 80
				}, {
					header : '설비코드',
					name : 'facCode',
					align: 'center'
				}, {
					header : '정기점검주기',
					name : 'facInspection',
					align: 'center'
				} ]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmFacModal').serializeObject();
				console.log(param);
				facGrid.readData(1, param, true);
			});
			
			var facCode;
			var facilitiesName;
			var facInspection;
			
			facGrid.on('click', (ev) => { 
				facCode = facGrid.getValue(ev.rowKey, 'facCode');
				facilitiesName = facGrid.getValue(ev.rowKey, 'facilitiesName');
				facInspection = facGrid.getValue(ev.rowKey, 'facInspection');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			facGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				grid.setValue(rowKey, 'facCode', facCode, false);
				grid.setValue(rowKey, 'facilitiesName', facilitiesName, false);
				grid.setValue(rowKey, 'facInspection', facInspection, false);
				$('#facModal').modal('hide');
				$('#facContent').remove();
			}
			 
		}
	
	});

	
})(jQuery);
