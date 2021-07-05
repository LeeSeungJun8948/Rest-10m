(function($) {


$("#matCodeModal").on('shown.bs.modal', function () {
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
					align: 'center'
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

});

	
})(jQuery);

	/**
matGrid.on('click', function(ev) {
	var values = matGrid.getRow(ev.rowKey);
	var prdCode = values.productCode;
	$('#productCode').val(prdCode);
	console.log(prdCode);
});
	
$.fn.serializeObject = function() {
	var o = {};
	var a = this.serializeArray();
	$.each(a, function() {
		if (o[this.name]) {
			if (!o[this.name].push) {
				o[this.name] = [ o[this.name] ];
			}
			o[this.name].push(this.value || '');
		} else {
			o[this.name] = this.value || '';
		}
	});
	return o;
};


$('#btnSelectModal').on('click', function() {
	var prm = $('#frm').serializeObject();
	grid.readData(1, prm, true);
})
				
function fnSearch() {
	$("#frm").submit();
}
 */