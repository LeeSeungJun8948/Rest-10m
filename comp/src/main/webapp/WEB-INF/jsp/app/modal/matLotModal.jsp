<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div id="modalContent">
	<div class="modal-header">
		<h5 class="modal-title">출고자재 LOT_NO</h5>
		<button id="btnCloseTop" type="button" class="close"
			data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
	<div class="modal-body">
		<div class="col-md-11">
			<div id="matLotGrid"></div>
		</div>
	
		<div class="modal-footer">
			<button id="btnSelect" class="btn-two cyan small">선택</button>
			<button id="btnCloseBottom" class="btn-two blue small" data-dismiss="modal">닫기</button>
		</div>
	
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/modal/matLotModal.js"></script>
</div>