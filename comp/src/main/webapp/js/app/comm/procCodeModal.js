

var pcDataSource = {
	api : {
			readData : {
				url: contextPath + '/ajax/procListModal.do', 
				method:'get'
				}
			},
			contentType: 'application/json'
		}; 
		
		var procCodeGrid = new tui.Grid({
			el : document.getElementById('procCodeGrid'),
			data : pcDataSource,
			rowHeaders: ['checkbox'],
			scrollX : false,
			scrollY : true,
			bodyHeight: 450,
			selectionUnit: 'row',
			columns : [
			
				{
					header : '공정코드',
					name : 'processCode',
					align: 'center'
					
				},
				{
					header :'공정명',
					name : 'processName',
					align: 'center'
				}
			
				]
			});
			
		var processCode;
		var processName;
	
		procCodeGrid.on('click', (ev) => { 
			processCode = procCodeGrid.getValue(ev.rowKey, 'processCode');
			processName = procCodeGrid.getValue(ev.rowKey, 'processName');
		});
	
		$('#btnSelect').on('click', function(){
			select();
		});
		
		matCodeGrid.on('dblclick', function(){
			select();
		});
			
			function select(){
				grid.setValue(matCoderowKey, 'processCode',processCode, false);
				grid.setValue(matCoderowKey, 'processName',processName, false);
				$('.modal').remove();
				$('.jquery-modal').remove(); 
			}
	
	$("#btnReadModal").on("click", function() {
				var param = $('#frmProcModal').serializeObject();
				console.log(param);
				procCodeGrid.readData(1, param, true);
			});
				
			 
		
	
	
		