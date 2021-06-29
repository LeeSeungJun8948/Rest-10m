<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">자재 입고 관리</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnRead">조회</button>
	<button type="button" class="btn btn-primary" id="btnSave">저장</button>
</div>
<form id="searchFrm" name="searchFrm">
	<div class="row">
		<div class="mb-2 col-lg-6">
			<table class="table">
				<tbody>
					<tr>
						<th>입고일자*</th>
						<td>
							<input type="date" id="startDate" name="startDate">
							~ <input type="date" id="endDate" name="endDate">
						</td>
					</tr>
					<tr>
						<th>입고업체</th>
						<td>
							<input  class="w-5" type="text" id="companyCode" name="companyCode"> 
							<input  type="text" id="companyName" name="companyName">
						</td>
					</tr>
					<tr>
						<th>입고자재</th>
						<td>
							<input  class="w-5" type="text" id="materialCode" name="materialCode"> 
							<input  type="text" id="materialName" name="materialName">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="mb-4 col-lg-6">
		</div>
	</div>
</form>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-info" id="btnGridAdd">추가</button>
	<button type="button" class="btn btn-info" id="btnGridDel">삭제</button>
</div>
<div class="col-lg-12">
	<form id="gridFrm" name="gridFrm">
		<div id="inMatList"></div>
	</form>
</div>
<script type="text/javascript" src="js/app/mat/matInForm.js"></script>