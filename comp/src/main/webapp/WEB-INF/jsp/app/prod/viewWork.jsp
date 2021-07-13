<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">작업실적 조회</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnSearch">조회</button>
	<button type="reset" class="btn btn-primary" id="btnReset">초기화</button>
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
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<div class="col-lg-12">
	<div id="grid"/>
</div>

<script type="text/javascript" src="js/app/prod/viewWork.js"></script>