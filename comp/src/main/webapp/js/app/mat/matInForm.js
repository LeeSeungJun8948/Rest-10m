$( document ).ready(function() {	
	document.getElementById('startDate').valueAsDate = new Date();
	document.getElementById('endDate').valueAsDate = new Date();
});


	const dataSource = {
		api : {
			readData : {url: 'ajax/matInList.do' , method:'GET' },
		},
		contentType: 'application/json'
	};
	
	const grid = new tui.Grid({
		el : document.getElementById('inMatList'),
		data : dataSource,
		scrollX : false,
		scrollY : true,
		bodyHeight: 360,
		columns : [ 
			{
				header : '입고번호',
				name : 'ioCode',
				width : 90,
				align: 'center'
			},
			{
				header : '입고일자',
				name : 'ioDate',
				width : 120,
				align: 'center'
			},
			{
				header : '자재코드',
				name : 'materialCode',
				width : 90,
				align: 'center'
			}, {
				header : '자재명',
				name : 'materialName',
				width : 120,
				align: 'center'
			}, {
				header : '단위',
				name : 'unitNo',
				width : 90,
				align: 'center'
			}, {
				header : '발주번호',
				name : 'inorderCode',
				width : 90,
				align: 'left'
			}, {
				header : '입고량',
				name : 'ioVolume',
				width : 120,
				align: 'center'
			}, {
				header : '단가',
				name : 'unitPrice',
				width : 120,
				align: 'center',
				formatter({value}) {
	      			return format(value);
	    		}
			}, {
				header : '총액',
				name : 'price',
				width : 120,
				align: 'right',
				formatter({value}) {
	      			return format(value);
	    		}
			}, {
				header : 'LOT_NO',
				name : 'lotNo',
				width : 120,
				align: 'right'
			}, {
				header : '자재재고',
				name : 'stock',
				width : 120,
				align: 'right',
				formatter({value}) {
	      			return format(value);
	    		}
			}
		],
		summary : {
			
			height: 40,
		   	position: 'bottom',
		   	columnContent: {
	        	inDate: {
	                template(summary) {
	        			return '합 계';
	                } 
	            },	
				yetCount: {
	                template(summary) {
	        			var summaryResult = (summary.sum);
	        			return format(summaryResult);
	                } 
	            }
			}
		}
	});
	
	function format(value){
		value = value * 1;
		return value.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
	}


$('#btnRead').on('click',  function(){
	var param = $('#searchFrm').serializeObject();
	console.log(param)
	grid.readData(1, param, true);
});



