// 저장
$("#btnSave").on("click", function() {
	if (formCheck()) {
		$.ajax({
			type: 'POST',
			url: 'saveWork.do',
			data: $('#workFrm').serialize(),
			dataType: 'json',
			async: false,
			success: function() {
				toastr.success("저장되었습니다.");
				$("#workFrm")[0].reset();
			}
		});
	}
});

// 작업자
$("#btnEmpModal").on("click", function() {
	$('#workEmpContent').load("workEmpModal.do");
});

// 불량코드
$("#btnErrorModal").on("click", function() {
	$('#workErrorContent').load("workErrorModal.do");
});

// 제품LOT 입력시 조회
function findLot(lot) {
	if (checkNull(lot)) {
		$.ajax({
			type: 'POST',
			url: 'selectDetailPlan.do',
			data: { 'productLot': lot },
			success: function(data) {
				if (data.data.contents != null) {
					$("#workDate").val(data.data.contents.workDate);
					$("#orderNo").val(data.data.contents.orderNo);
					$("#productName").val(data.data.contents.productName);
					$("#productCode").val(data.data.contents.productCode);
					$("#productLot").val(data.data.contents.productLot);
					$("#workCount").val(data.data.contents.workCount);
				} else {
					$("#workFrm")[0].reset();
				}
			}
		});
	}
}

function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

function formCheck() {
	if (!checkNull($('#orderNo').val())) {
		toastr.warning('공정이동표 바코드를 먼저 찍어주세요.');
	} else if (!checkNull($('#workCount').val()) || !checkNull($('#startTime').val()) || !checkNull($('#endTime').val()) || !checkNull($('#empName').val())) {
		toastr.warning('값을 입력해주십시오.');
		return false;
	} else {
		return true;
	}
}