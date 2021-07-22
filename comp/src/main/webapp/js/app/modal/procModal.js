(function($) {

	$("#procModal").on('shown.bs.modal', function () { 
		
		if(!checkNull($('#procGrid').html())){
			var procData = {
				api : {
					readData : {
					url : contextPath + '/ajax/procListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var procGrid = new tui.Grid({	
				el : document.getElementById('procGrid'),
				data : procData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '공정코드',
					name : 'processCode',
					align: 'center',
					width: 80,
					sortable: true
				}, {
					header : '공정명',
					name : 'processName',
					align: 'center',
					sortable: true
				}]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmProcModal').serializeObject();
				console.log(param);
				procGrid.readData(1, param, true);
			});
			
			var processCode;
			var processName;
			
			procGrid.on('click', (ev) => { 
				processCode = procGrid.getValue(ev.rowKey, 'processCode');
				processName = procGrid.getValue(ev.rowKey, 'processName');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			procGrid.on('dblclick', function(){
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
