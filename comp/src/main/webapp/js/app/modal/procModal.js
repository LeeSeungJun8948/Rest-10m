(function($) {

	$("#procModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#modalProcListGrid').html())){
			var procListModalData = {
				api : {
					readData : {
					url : 'ajax/procListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var procListModalGrid = new tui.Grid({	
				el : document.getElementById('modalProcListGrid'),
				data : procListModalData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '공정코드',
					name : 'processCode',
					align: 'center',
					width: 80
				}, {
					header : '공정명',
					name : 'processName',
					align: 'center'
				}]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmProcModal').serializeObject();
				console.log(param);
				procListModalGrid.readData(1, param, true);
			});
			
			var processCode;
			var processName;
			
			procListModalGrid.on('click', (ev) => { 
				processCode = procListModalGrid.getValue(ev.rowKey, 'processCode');
				processName = procListModalGrid.getValue(ev.rowKey, 'processName');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			procListModalGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				$('#processCode').val(processCode);
				$('#processName').val(processName);
				$('#procModal').modal('hide');
				$('#modalContent').remove();
			}
			 
		}
	
	});

	
})(jQuery);
