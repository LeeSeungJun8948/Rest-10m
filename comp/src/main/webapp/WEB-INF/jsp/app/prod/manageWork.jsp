<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">생산작업 관리</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
	<button id="btnModal" type="button" class="btn btn-primary" data-remote="false" data-toggle="modal" data-target="#workModal">작업등록</button>	
	
</div>
<div class="row">	
	<div class="mb-2 col-lg-12">
		<form id="frm" name="frm">
			<table class="table">
				<tbody>
					<tr>
						<th>작업일자</th>
						<td><input type="date" id="workDate" name="workDate"></td>
						<th>작업구분</th>
						<td> 
							<span class="mr-4">전체 <input type="radio" name="workDiv" value="#" checked></span>
							<span class="mr-4">배합공정 <input type="radio" name="workDiv" value="배합공정"></span>
							<span class="mr-4">검사공정 <input type="radio" name="workDiv" value="검사공정"></span>
							<span class="mr-4">포장공정 <input type="radio" name="workDiv" value="포장공정"></span>
						</td>
						<th>제품LOT</th>
						<td><input type="text" id="productLot" name="productLot"></td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<div id="grid"/>
</div>

<div class="modal fade" id="workModal" tabindex="-2" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-large" role="document">
		<div class="modal-content" id="workContent" align="center"/>
	</div>
</div>

<link href="${pageContext.request.contextPath}/css/app/prod/manageWork.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="js/app/prod/manageWork.js"></script>