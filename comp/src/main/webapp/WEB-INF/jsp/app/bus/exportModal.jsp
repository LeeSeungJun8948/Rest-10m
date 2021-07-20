<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<div id="modalContent">
	<div class="modal-header">
		<h4>출고 조회</h4>
		<button id="btnCloseTop" type="button" class="close"
			data-dismiss="modal" aria-label="Close">
			<span aria-hidden="true">&times;</span>
		</button>
	</div>
	<div class="modal-body">
		<div>
			<table class="table">
				<tr>
					<th>출고일자</th>
					<td>
						<div class="row">
							<div class="col-lg-8">
								<form id="modalFrm" name="modalFrm">
									<input type="date" id="fromDate" name="fromDate">&nbsp;~&nbsp;
									<input type="date" id="toDate" name="toDate">
								</form>
							</div>
							<div class="col-lg-4">
								<button type="button" class="btn-two blue small" id="btnSearch"
									name="btnSearch">검색</button>
							</div>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div id="modalExportListGrid"></div>
	</div>
	<div class="modal-footer">
		<button id="btnSelect" class="btn-two cyan small">선택</button>
		<button id="btnCloseBottom" class="btn-two blue small"
			data-dismiss="modal">닫기</button>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/bus/exportModal.js"></script>
