(function($) {
	$("#workModal").on('shown.bs.modal', function() {
		if (!checkNull($('#workGrid').html())) {
			var workData = {
				api: {
					readData: {
						url: 'searchWork.do',
						method: 'POST'
					}
				},
				contentType: 'application/json'
			};
			var workGrid = new tui.Grid({
				el: document.getElementById('workGrid'),
				data: workData,
				scrollX: false,
				scrollY: true,
				bodyHeight: 450,
				columns: [ {
					header: '작업번호',
					name: 'workCode',
					hidden: true
					}, {
					header: '공정코드',
					name: 'processCode',
					hidden: true
					}, {
					header: '시작시간',
					name: 'startTime',
					hidden: true
					}, {
					header: '종료시간',
					name: 'endTime',
					hidden: true
					}, {
					header: '사원번호',
					name: 'empCode',
					hidden: true
					}, {
					header: '사원이름',
					name: 'employeeName',
					hidden: true
					}, {
					header: '불량코드',
					name: 'errorCode',
					hidden: true
					}, {
					header: '불량명',
					name: 'errorName',
					hidden: true
					}, {
					header: '사원이름',
					name: 'empName',
					hidden: true
					}, {
					header: '지시번호',
					name: 'prorCode',
					hidden: true
					}, {
					header: '설비명',
					name: 'facilitiesName',
					hidden: true
					}, {
					header: '작업공정',
					name: 'processName',
					}, {
					header: '작업일자',
					name: 'workDate',
					}, {
					header: '제품코드',
					name: 'productCode',
					hidden: 'true'
					}, {
					header: '제품명',
					name: 'productName',
					}, {
					header: '제품LOT',
					name: 'productLot',
					width: 160
					}, {
					header: '작업량',
					name: 'workCount',
					}, {
					header: '불량량',
					name: 'errorCount',
					}]
			});

			$("#btnSearch").on("click", function() {
				var param = $('#dateFrm').serializeObject();
				workGrid.readData(1, param, true);
			});

			var workCode;
			var processCode;
			var startTime;
			var endTime;
			var empCode;
			var empName;
			var errorCode;
			var errorName;
			var workDate;
			var productCode;
			var productName;
			var productLot;
			var workCount;
			var errorCount;
			var prorCode;
			var facilitiesName;
			
			workGrid.on('click', (ev) => {
				workCode = workGrid.getValue(ev.rowKey, 'workCode');
				processCode = workGrid.getValue(ev.rowKey, 'processCode');
				startTime = workGrid.getValue(ev.rowKey, 'startTime');
				endTime = workGrid.getValue(ev.rowKey, 'endTime');
				empCode = workGrid.getValue(ev.rowKey, 'empCode');
				empName = workGrid.getValue(ev.rowKey, 'employeeName');
				errorCode = workGrid.getValue(ev.rowKey, 'errorCode');
				errorName = workGrid.getValue(ev.rowKey, 'errorName');
				workDate = workGrid.getValue(ev.rowKey, 'workDate');
				productCode = workGrid.getValue(ev.rowKey, 'productCode');
				productName = workGrid.getValue(ev.rowKey, 'productName');
				productLot = workGrid.getValue(ev.rowKey, 'productLot');
				workCount = workGrid.getValue(ev.rowKey, 'workCount');
				errorCount = workGrid.getValue(ev.rowKey, 'errorCount');
				prorCode = workGrid.getValue(ev.rowKey, 'prorCode');
				facilitiesName = workGrid.getValue(ev.rowKey, 'facilitiesName');
			});

			$('#btnSelect').on('click', function() {
				select();
			});

			workGrid.on('dblclick', function() {
				select();
			});

			function select() {
				$('#productLot').val(productLot);
				$('#workCode').val(workCode);
				$('#workDiv').val(processCode);
				$('#startTime').val(startTime);
				$('#endTime').val(endTime);
				$('#empCode').val(empCode);
				$('#empName').val(empName);
				$('#errorCode').val(errorCode);
				$('#errorName').val(errorName);
				$('#workDate').val(workDate);
				$('#productCode').val(productCode);
				$('#productName').val(productName);
				$('#workCount').val(workCount);
				$('#errorCount').val(errorCount);
				$('#prorCode').val(prorCode);
				$('#facilitiesName').val(facilitiesName);
				$('#workModal').modal('hide');
				$('#modalContent').remove();
			}
		}
	});
})(jQuery);