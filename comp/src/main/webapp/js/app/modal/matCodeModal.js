

var mcDataSource = {
	api : {
			readData : {
				url: contextPath + '/ajax/matListModal.do', 
				method:'get'
				}
			},
			contentType: 'application/json'
		}; 
		
		var matCodeGrid = new tui.Grid({
			el : document.getElementById('matCodeGrid'),
			data : mcDataSource,
			rowHeaders: ['checkbox'],
			scrollX : false,
			scrollY : true,
			bodyHeight: 450,
			selectionUnit: 'row',
			columns : [
			
				{
					header : '자재코드',
					name : 'materialCode',
					align: 'center'
					
				},
				{
					header :'자재명',
					name : 'materialName',
					align: 'center'
				},
				{
					header: '구분',
					name :'matNm',
					align: 'center'
				}
				]
			});
			
		var materialCode;
		var materialName;
	
		matCodeGrid.on('click', (ev) => { 
			materialCode = matCodeGrid.getValue(ev.rowKey, 'materialCode');
			materialName = matCodeGrid.getValue(ev.rowKey, 'materialName');
		});
	
		$('#btnSelect').on('click', function(){
			select();
		});
		
		matCodeGrid.on('dblclick', function(){
			select();
		});
			
			function select(){
				grid.setValue(matCoderowKey, 'materialCode',materialCode, false);
				grid.setValue(matCoderowKey, 'materialName',materialName, false);
				$('.modal').remove();
				$('.jquery-modal').remove(); 
			}
	
	$("#btnReadModal").on("click", function() {
				var param = $('#frmMatModal').serializeObject();
				console.log(param);
				matCodeGrid.readData(1, param, true);
			});
				
			 
		
	
	
		