<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<div class="modal-header">
			<h5 class="modal-title">자재검색</h5>
			<button type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<div class="modal-body">

			<form id="frmMatCodeSrcModal" name="frmMatCodeSrcModal">
				<div class="row">
					<div class="col-md-4">
						<select class="custom-select" name="searchCondition">
							<option value="material_code" selected>자재코드</option>
							<option value="material_name">자재명</option>
							<option value="mat_no" >자재구분</option>
						</select>
					</div>
					<div class="col-md-6 ml-auto">
						<input id="keyword" name="keyword" type="text" class="form-control">
						<button type="button" class="btn btn-primary" id="btnReadModal">조회</button>
					</div>
				</div>
			</form>

			<div class="col-md-10">
				<div id="modalMatListGrid"></div>
			</div>

			<div class="modal-footer">
				<button class="btn btn-secondary">닫기</button>
				<button class="btn btn-success">선택</button>
			</div>

		</div>
		
		<script type="text/javascript" src="js/app/mat/matModal.js"></script>
	