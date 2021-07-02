<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<script src="https://code.jquery.com/jquery-3.6.0.js"
   integrity="sha256-H+K7U5CnXl1h5ywQfKtSj8PCmoN9aaq30gDh27Xc0jk="
   crossorigin="anonymous"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.css" />
<link rel="stylesheet"
   href="https://uicdn.toast.com/grid/latest/tui-grid.css" />
<script src="https://uicdn.toast.com/grid/latest/tui-grid.js"></script>


<h1 class="h3 mb-4 text-gray-700">출고관리</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnView">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">새자료</button>
	<button type="button" class="btn btn-primary" id="btnSave">저장</button>
	<button type="button" class="btn btn-primary" id="btnDel">삭제</button>
</div>
<div class="row">
	<div class="mb-2 col-lg-6">
		<form id="inputFrm" name="inputFrm">
			<input type="hidden" value="${'idx' }" id="idx" name="idx"> <input
				type="hidden" value="${'planCode' }" id="planCode" name="planCode">
			<table class="table">
				<tbody>
					<tr>
						<th>출고일자</th>
						<td><input type="date" id="exportDate" name="exportDate"></td>
						<th>출고번호</th>
						<td><input type="date" id="lot" name="lot"></td>
					</tr>
					<tr>
						<th>고객사</th>
						<td><input type="text" id="compCode" name="compCode">${companyCode }</td>
						<td><a id="search" href="compModal.do" rel="modal:open" class="btn btn-primary"> <img
							src="<c:url value='/images/egovframework/com/cmm/btn/btn_search.png'/>">
						</a></td>
						<th>고객사명</th>
						<td><input type="text" id="compName" name="compName">${companyName }</td>
					</tr>
					<tr>
						<th>특기사항</th>
						<td><input type="text" id="comments" name="comments"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
	<div class="mb-4 col-lg-6">
		<div>
			<h5>검색자료관리</h5>
		</div>
		<div>
			<form id="dateForm" name="dateForm">
				<span>납기일자 </span><input type="date" id="inDate" name="inDate">
				<span> ~ </span><input type="date" id="outDate" name="outDate">&nbsp;
				<button type="button" class="btn btn-primary" id="btnRead">미출고
					읽기</button>
			</form>
		</div>
	</div>
</div>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnGridAdd">추가</button>
	<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<div id="grid" />
</div>
<script type="text/javascript" src="js/app/bus/exportForm.js"></script>