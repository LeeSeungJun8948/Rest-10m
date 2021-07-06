<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

		<div class="modal-header">
			<h5 class="modal-title">공정검색</h5>
			<button id="btnCloseTop" type="button" class="close" data-dismiss="modal"
				aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<div class="modal-body">

			<form id="frmMatCodeSrcModal" name="frmMatCodeSrcModal">
				<div class="row">
					<div class="col-md-4">
						<select class="custom-select" name="searchCondition">
							<option value="process_code" selected>공정코드</option>
							<option value="process_name">공정명</option>
							<option value="product_name">제품명</option>
						</select>
					</div>
					<div class="col-md-6 ml-auto">
						<input id="keyword" name="keyword" type="text" class="form-control">
						<button type="button" class="btn btn-primary" id="btnReadModal">조회</button>
					</div>
				</div>
			</form>

			<div class="col-md-10">
				<div id="modalProcListGrid"></div>
			</div>

			<div class="modal-footer">
				<button id="btnCloseBottom" class="btn btn-default" data-dismiss="modal">닫기</button>
				<button id="btnSelect" class="btn btn-success">선택</button>
			</div>

		</div>
		
		<script type="text/javascript" src="js/app/modal/procModal.js"></script>
	