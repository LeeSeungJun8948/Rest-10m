<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="modalContent">
	<div class="modal-header">
		<h5 class="modal-title">불량검색</h5>
		<button id="btnCloseTop" type="button" class="close"
			data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
	<div class="modal-body">
		<form id="frmErrorModal" name="frmErrorModal">
			<div class="row">
				<div class="col-md-4 mr-0 ml-3">
					<select class="custom-select" name="searchCondition">
						<option value="error_code" selected>불량코드</option>
						<option value="error_name">불량명</option>
					</select>
				</div>
				<div class="col-md-5">
					<input id="keyword" class="form-control" name="keyword" type="text" class="form-control">
				</div>
				<div class="col=md-1">
					<button type="button" class="btn btn-primary" id="btnReadModal">조회</button>
				</div>
			</div>
		</form>
	
		<div class="col-md-11 m-3">
			<div id="errorGrid"></div>
		</div>
	</div>
		
	<div class="modal-footer">
		<button id="btnCloseBottom" class="btn btn-primary" data-dismiss="modal">닫기</button>
		<button id="btnSelect" class="btn btn-success">선택</button>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/prod.css" rel="stylesheet">
<script type="text/javascript" src="js/app/prod/workErrorModal.js"></script>