(function($) {
	$("#workErrorModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#errorGrid').html())){
			var errorData = {
				api : {
					readData : {
					url : 'ajax/workErrorModal.do',
					method : 'POST'
					}
				},
				contentType : 'application/json'
			};
			var errorGrid = new tui.Grid({	
				el : document.getElementById('errorGrid'),
				data : errorData,
				scrollX : false,	
				scrollY : false,
				bodyHeight: 360,
				columns : [ {
					header : '불량코드',
					name : 'errorCode',
					align: 'center',
					width: 80
				}, {
					header : '불량명',
					name : 'errorName',
					align: 'center'
				}, {
					header : '불량설명',
					name : 'errorComment',
					width: 150
				}]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmErrorModal').serializeObject();
				errorGrid.readData(1, param, true);
			});
			
			var errorName;
			var errorCode;
			errorGrid.on('click', (ev) => { 
				errorName = errorGrid.getValue(ev.rowKey, 'errorName');
				errorCode = errorGrid.getValue(ev.rowKey, 'errorCode'); 
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			errorGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				$('#errorName').val(errorName);
				$('#errorCode').val(errorCode);
				$('#workErrorModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});
})(jQuery);