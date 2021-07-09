// 저장
$("#btnSave").on("click", function() {
	if (formCheck()) {
		$('#workFrm').submit();
		toastr.success("저장되었습니다.");
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

function checkNull(value) {
	return value != null && value != '' && value != '[object HTMLInputElement]';
}

function formCheck() {
	if (!checkNull($('#workCount').val()) || !checkNull($('#startTime').val()) || !checkNull($('#endTime').val())) {
		toastr.warning('값을 입력해주십시오.');
		return false;
	} else {
		return true;
	}
}