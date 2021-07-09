// 작업등록 모달
$("#btnEmpSearch").on("click", function(e) {
    $('#workEmpContent').load("workEmpModal.do");
});

// 초기화 버튼
$("#btnReset").click(function() {
	resetPage();
});

// 초기화
function resetPage() {  
	$("form").each(function() {  
        this.reset();
		grid.clear();
    });  
}

// 폼체크
function formCheck() {
	if(checkNull($('#planDate').val()) || checkNull($('#planName').val())) {
		toastr.warning('값을 입력해주십시오.');
		return false;
	} else if(checkNull($('#workCount').val()) && ($('#workCount').val() != $('#inputCount').val())) {
		toastr.warning('소요량이 부족합니다.');
		return false;
	} else {
		return true;
	}
}