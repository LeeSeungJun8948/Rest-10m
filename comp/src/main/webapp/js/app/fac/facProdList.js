const dataSource = {
				api : {
					readData : {url: contextPath + '/ajax/facProd.do', method : 'GET'}
				},
				contentType: 'application/json'
		}
	
		const grid = new tui.Grid({
			el : document.getElementById('grid'),
			data : dataSource,
			scrollX : false,
			scrollY : false,
			columns : [ {
				header : '작업일자',
				name : 'workDate',
				align: 'center'
			}, {
				header : '설비명',
				name : 'facilitiesName',
				align: 'center'
			}, {
				header : '제품명',
				name : 'productName',
				align: 'center'
			}, {
				header : '제품LOT',
				name : 'productLot',
				align: 'center'
			}]
		});
		
		$.fn.serializeObject = function() {
			var o = {};
			var a = this.serializeArray();
			$.each(a, function() {
				if (o[this.name]) {
					if (!o[this.name].push) {
						o[this.name] = [o[this.name]];
					}
					o[this.name].push(this.value || '');
				} else {
					o[this.name] = this.value || '';
				}
			});
			return o;
		};
		
$('#btnRead').on('click',  function(){
	var param = $('#frm').serializeObject();
	grid.readData(1, param, true);
});


// 모달
var forGrid = false;

$("#btnFacModal").on("click", function(e) {
	    $('#facContent').load(contextPath + "/modal/facModal.do");
	});
	
$("#btnProdModal").on("click", function() {
	$('#prodContent').load(contextPath+"/modal/prodModal.do");
});


function checkNull(value) {
	return (value != null && value != '' && value != '[object HTMLInputElement]') || value === 0 || value === '0';
}