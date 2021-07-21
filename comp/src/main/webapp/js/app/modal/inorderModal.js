(function($) {
	$("#inorderModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#inorderGrid').html())){
			var inorderData = {
				api : {
					readData : {
					url : contextPath + '/ajax/inorderListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var inorderGrid = new tui.Grid({	
				el : document.getElementById('inorderGrid'),
				data : inorderData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '발주코드',
					name : 'inorderCode',
					align: 'center',
					width: 80,
					sortable: true
				}, {
					header : '발주일자',
					name : 'inorderDate',
					align: 'center',
					sortable: true
				}, {
					header : '발주자재',
					name : 'materialName',
					align: 'center',
					sortable: true
				}, {
					header : '발주업체',
					name : 'companyName',
					align: 'center'
				}, {
					header : '발주량',
					name : 'inorderCount',
					align: 'right'
				}, {
					header : '입고량',
					name : 'inCount',
					align: 'right',
					hidden: true
				}, {
					header : '미입고량',
					name : 'yetCount',
					align: 'right',
					sortable: true
				}, {
					header : '비고',
					name : 'comments',
					align: 'center'
				}]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmInorderModal').serializeObject();
				console.log(param);
				inorderGrid.readData(1, param, true);
			});
			
			var inorderCode;
			var yetCount;
			
			inorderGrid.on('click', (ev) => { 
				inorderCode = inorderGrid.getValue(ev.rowKey, 'inorderCode');
				yetCount = inorderGrid.getValue(ev.rowKey, 'yetCount') * 1;
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			inorderGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				grid.setValue(rowKey, 'inorderCode', inorderCode, false);
				grid.setValue(rowKey, 'ioVolume', yetCount, false);
				$('#inorderModal').modal('hide');
				$('#modalContent').remove();
			}
			 
		}
	
	});

	
})(jQuery);
