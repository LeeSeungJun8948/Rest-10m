<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">설비 수리내역 관리</h1>
<form action="insertRepair.do" method="post" id="frm" name="frm"
	onsubmit="return test()">
	<div class="mb-4" style="float:right">
		<input type="submit" class="btn btn-primary" value="저장">
		<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		<button type="reset" class="btn btn-primary">새입력</button>
	</div>
	<div class="row">
		<div class="mb-4">
			<table class="table">
				<tbody>
					<tr>
						<th>수리코드</th>
						<td><input type="text" id="repairCode" name="repairCode" value="${max}"
							style="background-color: #e2e2e2;" readonly></td>
						<th>설비코드*</th>
						<td><input type="text" id="facCode" name="facCode" 
							style="background-color: #e2e2e2;" readonly>
						<button id="btnFacModal" type="button" class="btn btn-toggle"
								data-remote="false" data-toggle="modal" data-target="#facModal">
								<img alt="btn_search"
									src="<c:url value='/images/app/all/btn_search.png'/>"></button>
						</td>
						<th>수리일자</th>
						<td><input type="date" id="repairDate" name="repairDate"></td>
					</tr>
					<tr>
						<th>수리내역</th>
						<td><input type="text" id="repairComment"
							name="repairComment"></td>
						<th>업체코드</th>
						<td><input type="text" id="companyCode" name="companyCode" 
							style="background-color: #e2e2e2;" readonly>
							<button id="btnCompModal" type="button" class="btn btn-toggle"
								data-remote="false" data-toggle="modal" data-target="#compModal">
								<img alt="btn_search"
									src="<c:url value='/images/app/all/btn_search.png'/>">
							</button></td>
						<th>수리금액</th>
						<td><input type="text" id="cost" name="cost" onkeyup="numberWithCommas(this.value)"></td>
					</tr>
					<tr>
						<th>비고</th>
						<td><input type="text" id="etc" name="etc"></td>
					</tr>
				</tbody>
			</table>
		</div>
	</div>
</form>
<div id="grid"></div>

<div class="modal fade" id="compModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="compContent" align="center">
		</div>
	</div>
</div>

<div class="modal fade" id="facModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="facContent" align="center">
		</div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/fac/repList.js"></script>