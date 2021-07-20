<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="modalContent">
	<div class="modal-header">
		<h5 class="modal-title">설비검색</h5>
		<button id="btnCloseTop" type="button" class="close"
			data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
	<div class="modal-body">
		<form id="frmFacModal" name="frmFacModal">
			<div class="row">
				<div class="col-md-4 mr-0 ml-3">
					<select class="custom-select" name="searchCondition">
						<option value="facilities_name" selected>설비명</option>
						<option value="fac_code">설비코드</option>
					</select>
				</div>
				<div class="col-md-5">
					<input id="keyword" name="keyword" type="text" class="form-control">
				</div>
				<div class="col=md-1">
					<button type="button" class="btn-two blue small" id="btnReadModal">조회</button>
				</div>
			</div>
		</form>
	
		<div class="col-md-11 m-3">
			<div id="facGrid"></div>
		</div>
	</div>
		
	<div class="modal-footer">
		<button id="btnCloseBottom" class="btn btn-default" data-dismiss="modal">닫기</button>
		<button id="btnSelect" class="btn-two cyan small">선택</button>
	</div>
	
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/modal/facModal.js"></script>
</div>