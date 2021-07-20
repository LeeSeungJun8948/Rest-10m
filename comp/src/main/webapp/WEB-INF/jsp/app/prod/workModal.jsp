<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="modalContent">
	<div class="modal-header">
		<h5 class="modal-title">작업실적 검색</h5>
		<button id="btnCloseTop" type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
	<div class="modal-body">
		<form class="form-row mb-4" id="dateFrm" name="dateFrm">
			<div class="form-inline form-group">
				<span class="ml-4">작업일자</span>
				<input type="date" class="form-control ml-4 mr-2" id="workDtS" name="workDtS">
				<span>~</span>
				<input type="date" class="form-control ml-2 mr-4" id="workDtE" name="workDtE">
				<button type="button" class="btn-two blue small" id="btnSearch" name="btnSearch">검색</button>
			</div>
		</form>
	</div>
	
		<div class="col-md-11 m-3">
			<div id="workGrid"></div>
		</div>
	</div>
		
	<div class="modal-footer">
		<button id="btnSelect" class="btn-two cyan small">선택</button>
		<button id="btnCloseBottom" class="btn-two blue small" data-dismiss="modal">닫기</button>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/manageWork.css" rel="stylesheet">
<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/prod/workModal.js"></script>