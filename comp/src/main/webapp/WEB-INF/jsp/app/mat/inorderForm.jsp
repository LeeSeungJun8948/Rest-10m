<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<h1 class="h3 mb-4 text-gray-700">발주 조회</h1>

<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnShow">조회</button>
</div>

<div class="row">
	<div class="mb-2 col-lg-12 w-50">
		<form id="frm" name="frm">
			<table class="table">
				<tbody class="w-50">
					<tr>
						<th>발주일자</th>
						<td>
							<input type="date" id="startDate" name="startDate">
							~ <input type="date" id="endDate" name="endDate">
						</td>
					</tr>
					<tr>
						<th>발주업체</th>
						<td>
							<input  class="w-5" type="text" id="companyCode" name="companyCode"> 
							<input  type="text" id="companyName" name="companyName">
						</td>
					</tr>
					<tr>
						<th>자재코드</th>
						<td>
							<input  class="w-5" type="text" id="materialCode" name="materialCode"> 
							<input  type="text" id="materialName" name="materialName">
						</td>
					</tr>
					<tr>
						<th>정렬구분</th>
						<td> 
							<span class="mr-1"> 일자 <input type="radio" name="sort" value="inorderDate"></span>
							<span class="mr-1"> 업체 <input type="radio" name="sort" value="companyCode"></span>
							<span class="mr-1"> 자재 <input type="radio" name="sort" value="materialCode"></span>
						</td>
					</tr>
				</tbody>
			</table>
		</form>
	</div>
</div>
<div class="col-lg-12">
	<div id="inorderList"></div>
</div>

<script type="text/javascript" src="js/app/mat/inorderForm.js"></script>
