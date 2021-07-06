(function($) {

	$("#myModal").on('shown.bs.modal', function () {
		
		if(!checkNull($('#modalMatListGrid').html())){
			var matListModalData = {
				api : {
					readData : {
					url : 'ajax/matListModal.do',
					method : 'GET'
					}
				},
				contentType : 'application/json'
			};
			var matListModalGrid = new tui.Grid({	
				el : document.getElementById('modalMatListGrid'),
				data : matListModalData,
				scrollX : false,	
				scrollY : true,
				bodyHeight: 360,
				columns : [ {
					header : '자재코드',
					name : 'materialCode',
					align: 'center',
					width: 80
				}, {
					header : '자재명',
					name : 'materialName',
					align: 'center'
				}, {
					header : '구분',
					name : 'matNm',
					align: 'center'
				} ]
			});
			
			$("#btnReadModal").on("click", function() {
				var param = $('#frmMatCodeSrcModal').serializeObject();
				console.log(param);
				matListModalGrid.readData(1, param, true);
			});
			
			var materialCode;
			var materialName;
			
			matListModalGrid.on('click', (ev) => { 
				materialCode = matListModalGrid.getValue(ev.rowKey, 'materialCode');
				materialName = matListModalGrid.getValue(ev.rowKey, 'materialName');
			});
			
			$('#btnSelect').on('click', function(){
				select();
			});
			
			matListModalGrid.on('dblclick', function(){
				select();
			});
			
			function select(){
				$('#materialCode').val(materialCode);
				$('#materialName').val(materialName);
				$('#myModal').modal('hide');
			}
			
			/**
			function hideModal() {
			  $("#matCodeModal").removeClass("in");
			  $(".modal-backdrop").remove();
			  $('body').removeClass('modal-open');
			  $('body').css('padding-right', '');
			  $("#matCodeModal").hide();
			}
			 */
		}
	
	});

	
})(jQuery);
