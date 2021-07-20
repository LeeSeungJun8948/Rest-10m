(function($) {
	$("#workEmpModal").on('shown.bs.modal', function() {

		if (!checkNull($('#empGrid').html())) {
			var empData = {
				api: {
					readData: {
						url: 'ajax/workEmpModal.do',
						method: 'POST'
					}
				},
				contentType: 'application/json'
			};
			var empGrid = new tui.Grid({
				el: document.getElementById('empGrid'),
				data: empData,
				scrollX: false,
				scrollY: false,
				bodyHeight: 360,
				columns: [{
					header: '사원번호',
					name: 'empCode',
					align: 'center',
					width: 80
				}, {
					header: '부서',
					name: 'dept',
					align: 'center'
				}, {
					header: '직책',
					name: 'auth',
					align: 'center'
				}, {
					header: '사원명',
					name: 'employeeName',
					align: 'center'
				}]
			});

			$("#btnReadModal").on("click", function() {
				var param = $('#frmEmpModal').serializeObject();
				empGrid.readData(1, param, true);
			});

			var empCode;
			var empName;
			empGrid.on('click', (ev) => {
				empName = empGrid.getValue(ev.rowKey, 'employeeName');
				empCode = empGrid.getValue(ev.rowKey, 'empCode');
			});

			$('#btnSelect').on('click', function() {
				select();
			});

			empGrid.on('dblclick', function() {
				select();
			});

			function select() {
				$('#empName').val(empName);
				$('#empCode').val(empCode);
				$('#workEmpModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});
})(jQuery);