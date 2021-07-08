<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


	<div id="modalContent">
		<div class="modal-header">
			<h5 class="modal-title">업체검색</h5>
			<button id="btnCloseTop" type="button" class="close"
				data-dismiss="modal" aria-label="Close">
				<span aria-hidden="true">&times;</span>
			</button>
		</div>

		<div class="modal-body">
			<form id="frmCompModal" name="frmCompModal">
				<div class="row">
					<div class="col-md-4 mr-0 ml-3">
						<select class="custom-select" name="searchCondition">
							<option value="company_code" selected>업체코드</option>
							<option value="company_name">업체명</option>
						</select>
					</div>
					<div class="col-md-5">
						<input id="keyword" name="keyword" type="text"
							class="form-control">
					</div>
					<div class="col=md-1">
						<button type="button" class="btn btn-primary" id="btnReadModal">조회</button>
					</div>
				</div>
				<div class="row mt-3">
					<div class="col-md-7"></div>
					<div class="col-md-2 mr-0">
						<input class="form-check-input" type="radio" name="compNo"
							id="compNo1" value="" checked> <label
							class="form-check-label" for="compNo1">전체</label>
					</div>
					<div class="col-md-3 ml-0">
						<input class="form-check-input" type="radio" name="compNo"
							id="compNo2" value="04"> <label class="form-check-label"
							for="compNo2">자재업체</label>
					</div>
				</div>
			</form>

			<div class="col-md-11 m-3">
				<div id="compGrid"></div>
			</div>

			<div class="modal-footer">
				<button id="btnCloseBottom" class="btn btn-default"
					data-dismiss="modal">닫기</button>
				<button id="btnSelect" class="btn btn-success">선택</button>
			</div>

		</div>

		<script type="text/javascript" src="js/app/modal/compModal.js"></script>
	</div>
