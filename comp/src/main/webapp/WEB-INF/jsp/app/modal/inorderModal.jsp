<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="modalContent">
	<div class="modal-header">
		<h5 class="modal-title">발주목록 검색</h5>
		<button id="btnCloseTop" type="button" class="close"
			data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
	<div class="modal-body">
		<form id="frmInorderModal" name="frmInorderModal">
			<div class="row">
				<div class="col-md-1"></div>
				<div class="col-md-3">
					<select class="custom-select" name="searchCondition">
						<option value="inorder_code" selected>발주코드</option>
						<option value="material_code">발주자재</option>
						<option value="company_code">발주업체</option>
					</select>
				</div>
				<div class="col-md-5">
					<input id="keyword" name="keyword" type="text" class="form-control">
				</div>
				<div class="col-md-2">
					<button type="button" class="btn btn-primary" id="btnReadModal">조회</button>
				</div>
				<div class="col-md-1"></div>
			</div>
		</form>
	
		<div class="col-md-11 m-3">
			<div id="inorderGrid"></div>
		</div>
	</div>
		
	<div class="modal-footer">
		<button id="btnCloseBottom" class="btn btn-default" data-dismiss="modal">닫기</button>
		<button id="btnSelect" class="btn btn-success">선택</button>
	</div>
	
	<script type="text/javascript" src="js/app/modal/inorderModal.js"></script>
</div>