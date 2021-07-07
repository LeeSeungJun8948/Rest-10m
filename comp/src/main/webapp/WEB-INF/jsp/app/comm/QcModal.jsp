<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Modal -->

<div class="modal">
<style>
.blocker, .modal {
	z-index: 100;
	}
</style>
<form action="getQcProduct.do" method="post" id="frm">
	<input type="hidden" id="productCode" name="productCode">
</form>
	<div class="modal-content">
		<div class="modal-header">
		</div>
		<div class="modal-body">
			<!-- 필요한것 집어넣기 BODY 부분 -->
			<div id=QcMatGrid></div>
			<div class="modal-footer">
				<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
				<button id=btnSearch type="button" onclick="fnSearch()"
					class="btn btn-primary">검색</button>
			</div>
		</div>
	</div>
</div>
