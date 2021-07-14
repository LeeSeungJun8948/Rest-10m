// 작업저장
$("#btnSave").on("click", function() {
	if(confirm("저장하시겠습니까?")) {
		if (formCheck()) {
			$.ajax({
				type: 'POST',
				url: 'saveWork.do',
				data: $('#workFrm').serialize(),
				dataType: 'json',
				async: false,
				success: function(data) {
					var workCode = data.data.contents.workCode;
					$('#workCode').val(workCode);
					toastr.success("저장되었습니다.");
				}
			});
		}
	}
});

// 초기화 버튼
$("#btnReset").click(function() {
	$('#workCode').val("");
	$('#errorCode').val(0);
	$('#facCode').val(0);
});

// 조회버튼 (모달)
$("#btnWorkModal").on("click", function() {
	$('#workContent').load("workModal.do");
});

// 작업삭제 버튼
$('#btnDel').on('click', function(){
	if(confirm("삭제하시겠습니까?")) {
		$.ajax({
			type: 'POST',
			url: 'deleteWork.do',
			data: {workCode: $('#workCode').val()},
			dataType: 'json',
			success: function(){
				toastr.success("삭제되었습니다.");
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

// 설비코드
$("#btnFacModal").on("click", function() {
	$('#workFacContent').load("workFacModal.do");
});

// 제품LOT 입력시 조회
function findLot(lot) {
	if (checkNull(lot)) {
		$.ajax({
			type: 'POST',
			url: 'selectDetailProrder.do',
			data: { 'productLot': lot },
			success: function(data) {
				if (data.data.contents != null) {
					$("#workDate").val(data.data.contents.workDate);
					$("#prorCode").val(data.data.contents.prorCode);
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
	if (!checkNull($('#prorCode').val())) {
		toastr.warning('공정이동표 바코드를 먼저 찍어주세요.');
	} else if (!checkNull($('#workCount').val()) || !checkNull($('#startTime').val()) || !checkNull($('#endTime').val()) || !checkNull($('#empName').val())) {
		toastr.warning('값을 입력해주십시오.');
		return false;
	} else {
		return true;
	}
}