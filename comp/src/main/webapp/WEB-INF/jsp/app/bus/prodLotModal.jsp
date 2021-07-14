<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div id="prodLotContent">
	<div class="modal-header">
		<h5 class="modal-title">제품Lot 검색</h5>
		<button id="btnCloseTop" type="button" class="close"
			data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	
	<div class="modal-body">
		<form id="frmProdLotModal" name="frmProdLotModal">
			<div class="row">
				<div class="col-md-4 mr-0 ml-3">
					<select class="custom-select" name="searchCondition">
						<option value="product_lot"selected>제품Lot코드</option>
						<option value="lot_idx">순번</option>
					</select>
				</div>
				<div class="col-md-5">
					<input id="keyword" name="keyword" type="text" class="form-control">
				</div>
				<div>
					<button type="button" class="btn btn-primary" id="btnReadModal">조회</button>
				</div>
			</div>
			
		</form>
	
		<div class="col-md-11 m-3">
			<div id="prodLotGrid"></div>
		</div>
	
		<div class="modal-footer">
			<button id="btnCloseBottom" class="btn btn-default" data-dismiss="modal">닫기</button>
			<button id="btnSelect" class="btn btn-success">선택</button>
		</div>
	
	</div>
	
	<script type="text/javascript" src="js/app/bus/prodLotModal.js"></script>
</div>