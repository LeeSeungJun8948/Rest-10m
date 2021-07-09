				var cdataSource = {
					api : {
						readData : {url : 'ajax/getUnitList.do',method : 'GET'}
					},
					contentType : 'application/json'
				};
				var unitGrid = new tui.Grid({
					el : document.getElementById('unitCodeGird'),
					data : cdataSource,
					rowHeaders: ['checkbox'],
					scrollX : false,
					scrollY : false,
					
					columns : [ {
						header : '규격코드',
						name : 'codeId'
					}, {
						header : '규격',
						name : 'code'
					}]
				});