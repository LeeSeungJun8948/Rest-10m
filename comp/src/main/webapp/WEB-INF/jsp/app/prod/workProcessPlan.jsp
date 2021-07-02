<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-modal/0.9.1/jquery.modal.min.js"></script>
<h1 class="h3 mb-4 text-gray-700">공정실적 관리</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnView">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
	<a id="search" href="workModal.do" rel="modal:open" class="btn btn-primary">모달테스트</a>
	
</div>
<div class="row">	
	<div class="mb-2 col-lg-12">
		<form id="frm" name="frm">
			<table class="table">
				<tbody>
					<tr>
						<th>작업일자</th>
						<td><input type="date" id="workDate" name="workDate"></td>
						<th>제품LOT</th>
						<td><input type="text" id="lotNo" name="lotNo"></td>
						<th>정렬구분</th>
						<td> 
							<span class="mr-1"> 배합공정 <input type="radio" name="sort" value="#" checked></span>&nbsp;&nbsp;&nbsp;
							<span class="mr-1"> 검사공정 <input type="radio" name="sort" value="#"></span>&nbsp;&nbsp;&nbsp;
							<span class="mr-1"> 포장공정 <input type="radio" name="sort" value="#"></span>&nbsp;&nbsp;&nbsp;
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<div class="col-lg-12">
	<div id="grid"></div>
</div>
