
(function($) {
	$("#compModal").on('shown.bs.modal', function () {
		if(!checkNull($('#compGrid').html())){
			var compData = {
				api : {
					readData : {
					url : contextPath + '/ajax/compListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var compGrid = new tui.Grid({	
				el : document.getElementById('compGrid'),
				data : compData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '업체코드',
					name : 'companyCode',
					align: 'center',
					width: 80,
					sortable: true
				}, {
					header : '업체명',
					name : 'companyName',
					align: 'center',
					sortable: true
				}]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmCompModal').serializeObject();
				console.log(param);
				compGrid.readData(1, param, true);
			});
			
			var companyCode;
			var companyName;
			
			compGrid.on('click', (ev) => { 
				companyCode = compGrid.getValue(ev.rowKey, 'companyCode');
				companyName = compGrid.getValue(ev.rowKey, 'companyName');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			compGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				
				if(forGrid){
					grid.setValue(rowKey, 'companyCode', companyCode, false);
					grid.setValue(rowKey, 'companyName', companyName, false);
					forGrid = false;
				}else{
					$('#companyCode').val(companyCode);
					$('#companyName').val(companyName);
				}
				
				$('#compModal').modal('hide');
				$('#modalContent').remove();
			}
			 
		}
	
	});

	
})(jQuery);
