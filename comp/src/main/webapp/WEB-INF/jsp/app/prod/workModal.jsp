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
		<form id="dateFrm" name="dateFrm">
			<span>작업일자 </span><input type="date" id="workDtS" name="workDtS">
			<span>&nbsp;~&nbsp;</span><input type="date" id="workDtE" name="workDtE">&nbsp;
			<button type="button" class="btn btn-primary" id="btnRead">조회</button>
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

<script type="text/javascript" src="js/app/prod/workModal.js"></script>