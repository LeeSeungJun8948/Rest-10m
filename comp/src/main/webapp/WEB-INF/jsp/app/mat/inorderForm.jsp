<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">발주 조회</h1>
<form id="frm">
	<div class="mb-4" align="right">
		<button type="button" class="btn btn-primary" id="btnShow">조회</button>
	</div>
	<div class="row">
		<div class="mb-2 col-lg-6">
			<table class="table">
				<tbody>
					<tr>
						<th>발주일자</th>
						<td>
							<input type="date" id="startDate" name="startDate"> ~ 
							<input type="date" id="endDate" name="endDate">
						</td>
					</tr>
					<tr>
						<th>발주업체</th>
						<td>
							<input readonly type="text" id="companyCode" name="companyCode">
							<input readonly type="text" id="companyName" name="companyName">
						</td>
					</tr>
					<tr>
						<th>자재코드</th>
						<td>
							<input readonly type="text" id="materialCode" name="materialCode">
							<input readonly type="text" id="materialName" name="materialName">
						</td>
					</tr>
					<tr>
						<th>자재코드</th>
						<td>
							<input readonly type="text" id="materialCode" name="materialCode">
							<input readonly type="text" id="materialName" name="materialName">
						</td>
					</tr>
				</tbody>
			</table>
			
			
		</div>
		<div class="mb-4 col-lg-6">
			<div>
				<h5>미생산 검색</h5>
			</div>
			<div>
				<span>납기일자 </span><input type="date" id="planDtS"> <span>
					~ </span><input type="date" id="planDtE">&nbsp;
				<button type="button" class="btn btn-primary" id="btnRead">미생산
					읽기</button>
			</div>
		</div>
	</div>
	<div class="col-lg-10">
		<div id="grid"></div>
	</div>
</form>
<script type="text/javascript" src="js/app/mat/inorderForm.js"></script>
