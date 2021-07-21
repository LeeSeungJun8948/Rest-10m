(function($) {
	$("#matModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#matGrid').html())){
			var matData = {
				api : {
					readData : {
					url : contextPath + '/ajax/matListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var matGrid = new tui.Grid({	
				el : document.getElementById('matGrid'),
				data : matData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '자재코드',
					name : 'materialCode',
					align: 'center',
					width: 80,
					sortable: true
				}, {
					header : '자재명',
					name : 'materialName',
					align: 'center',
					sortable: true
				}, {
					header : '구분',
					name : 'matNm',
					align: 'center',
					sortable: true
				} ]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmMatModal').serializeObject();
				console.log(param);
				matGrid.readData(1, param, true);
			});
			
			var materialCode;
			var materialName;
			
			matGrid.on('click', (ev) => { 
				materialCode = matGrid.getValue(ev.rowKey, 'materialCode');
				materialName = matGrid.getValue(ev.rowKey, 'materialName');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			matGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				
				if(forGrid){
					grid.setValue(rowKey, 'materialCode', materialCode, false);
					grid.setValue(rowKey, 'materialName', materialName, false);
					forGrid = false;
				}else{
					$('#materialCode').val(materialCode);
					$('#materialName').val(materialName);
				}
				
				$('#matModal').modal('hide');
				$('#modalContent').remove();
			}
			 
		}
	
	});

	
})(jQuery);
