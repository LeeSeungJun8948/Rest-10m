(function($) {
	$("#empModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#empGrid').html())){
			var empData = {
				api : {
					readData : {
					url : 'ajax/empListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var empGrid = new tui.Grid({	
				el : document.getElementById('empGrid'),
				data : empData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '사원코드',
					name : 'empCode',
					align: 'center',
					width: 80
				}, {
					header : '사원명',
					name : 'employeeName',
					align: 'center'
				}]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmEmpModal').serializeObject();
				console.log(param);
				empGrid.readData(1, param, true);
			});
			
			var empCode;
			var employeeName;
			
			empGrid.on('click', (ev) => { 
				empCode = empGrid.getValue(ev.rowKey, 'empCode');
				employeeName = empGrid.getValue(ev.rowKey, 'employeeName');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			empGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				$('#empNo').val(empCode);
				$('#empModal').modal('hide');
				$('#modalContent').remove();
			}
			 
		}
	
	});

	
})(jQuery);
