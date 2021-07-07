<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<div class="modal-header">
	<h4>생산계획 조회</h4> 
</div>
<div class="modal-body">
	<div>
		<table class="table">
			<tr>
				<th>계획일자</th>
				<td>
					<div class="row">
						<div class="col-lg-6">
							<form id="modalFrm" name="modalFrm">
								<input type="date" id="searchDtS" name="searchDtS">&nbsp;~&nbsp;
								<input type="date" id="searchDtE" name="searchDtE">
							</form>
						</div>
						<div class="col-lg-6">
							<button type="button" class="btn btn-primary" id="btnSearch" name="btnSearch">검색</button>
						</div>
					</div>
				</td>
			</tr>
		</table>
	</div>	
	<div id="gridModal"/>
</div>
<div class="modal-footer">
   	<a class="btn btn-primary" href="#" rel="modal:close">닫기</a>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/planModal.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/app/prod/planModal.js"></script>