<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="modalContent">	
	<div class="modal-header">
		<h4 class="modal-title">생산계획 조회</h4>
		<button id="btnCloseTop" type="button" class="close" data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body">
		<form class="form-row mb-4" id="modalFrm" name="modalFrm">
			<div class="col-2">
				<span>계획일자</span>
			</div>
			<div class="col-3">
				<input type="date" class="form-control" id="searchDtS" name="searchDtS">
			</div>
			<div class="col-1">
				<span>~</span>
			</div>
			<div class="col-3">						
				<input type="date" class="form-control" id="searchDtE" name="searchDtE">
			</div>
			<div class="col-2">
				<button type="button" class="btn btn-primary" id="btnSearch" name="btnSearch">검색</button>
			</div>
		</form>	
		<div id="gridModal"></div>
	</div>
	<div class="modal-footer">
		<button id="btnSelect" class="btn btn-success">선택</button>
	   	<button id="btnCloseBottom" class="btn btn-primary" data-dismiss="modal">닫기</button>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/prod.css" rel="stylesheet">
<script type="text/javascript" src="js/app/prod/planModal.js"></script>