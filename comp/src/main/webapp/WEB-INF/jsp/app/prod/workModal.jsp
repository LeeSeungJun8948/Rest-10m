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
			<div class="col-2">
				<span>작업일자</span>
			</div>
			<div class="col-3">
				<input type="date" class="form-control" id="workDtS" name="workDtS">
			</div>
			<div class="col-1">
				<span>~</span>
			</div>
			<div class="col-3">						
				<input type="date" class="form-control" id="workDtE" name="workDtE">
			</div>
			<div class="col-2">
				<button type="button" class="btn btn-primary" id="btnSearch" name="btnRead">검색</button>
			</div>
		</form>
	
		<div class="col-md-11 m-3">
			<div id="workGrid"></div>
		</div>
	</div>
		
	<div class="modal-footer">
		<button id="btnCloseBottom" class="btn btn-primary" data-dismiss="modal">닫기</button>
		<button id="btnSelect" class="btn btn-success">선택</button>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/manageWork.css" rel="stylesheet">
<script type="text/javascript" src="js/app/prod/workModal.js"></script>