<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tui-grid-summary-area .tui-grid-cell {
    text-align: right;
}
</style>
<h1 class="h3 mb-4 text-gray-700">자재 재고 조정 조회</h1>
<div class="mb-4" align="right">
	<button type="button" class="btn btn-primary" id="btnRead">조회</button>
	<button type="button" class="btn btn-primary" id="btnWrite" data-remote="false" data-toggle="modal" data-target="#myModal">작성</button>
</div>
<form id="searchFrm" name="searchFrm">
	<div class="row">
		<div class="mb-2 col-lg-6">
			<table class="table">
				<tbody>
					<tr>
						<th>자재코드</th>
						<td>
							<input class="w-5" type="text" id="materialCode" name="materialCode">
							<button type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#myModal">
									<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
							</button>									
							<input type="text" id="materialName" name="materialName">
						</td>
						<th>자재구분</th>
						<td>
							<select  class="w-5" id="matNo" name="matNo">
							</select> 
						</td>
					</tr>
					<tr>
						<td>
						전체 <input type="radio" name="ioType" value="" checked>
						정산입고 <input type="radio" name="ioType" value="03">
						정산출고 <input type="radio" name="ioType" value="04">
		
						</td>
						<td>
							작업일자 
							<input type="date" id="startDate" name="startDate">
							~ <input type="date" id="endDate" name="endDate">
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="mb-4 col-lg-6">
		</div>
	</div>
</form>
<div class="col-lg-12">
	<form id="gridFrm" name="gridFrm">
		<div id="matStockList"></div>
	</form>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
</div>
<script type="text/javascript" src="js/app/mat/matStockList.js"></script>
