<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>


<div class="modal">
<style>
.blocker, .modal {
	z-index: 100;
}
</style>
<div class="modal-dialog" role="document" style="z-index: 100">
	<div class="modal-content">
		<div class="modal-header">
			<h3>자재코드 검색</h3>
		</div>
		<div class="modal-body">
		<form id="frmMatModal" name="frmMatModal">
			<div class="row">
				<div class="col-md-4 mr-0 ml-3">
					<select class="custom-select" name="searchCondition">
						<option value="material_code" selected>자재코드</option>
						<option value="material_name">자재명</option>
						<option value="mat_no">자재구분</option>
					</select>
				</div>
				<div class="col-md-5">
					<input id="keyword" name="keyword" type="text" class="form-control">
				</div>
				<div>
					<button type="button" class="btn-two blue small" id="btnReadModal">조회</button>
				</div>
			</div>
			</form>
			<!-- 필요한것 집어넣기 BODY 부분 -->
			<div id=matCodeGrid style="margin-top: 20px"></div>
			<div class="modal-footer">
				<button id=btnSelect type="button"
					class="btn-two cyan small">선택</button>
				</div>
			<a href="#" rel="modal:close" ><button class="btn-two blue small">닫기</button></a>
			</div>
		</div>
	</div>
	<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/modal/matCodeModal.js"></script>
</div>


	
