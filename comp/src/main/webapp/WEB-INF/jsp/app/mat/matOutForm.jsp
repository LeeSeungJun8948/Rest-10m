<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tui-grid-summary-area .tui-grid-cell {
    text-align: right;
}
</style>
<h1 class="h3 mb-4 text-gray-700">자재 출고 관리</h1>
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
						<th>출고일자*</th>
						<td>
							<input type="date" id="startDate" name="startDate">
							~ <input type="date" id="endDate" name="endDate">
						</td>
					</tr>
					<tr>
						<th>출고자재</th>
						<td>
							<input class="w-5" type="text" id="materialCode" name="materialCode">
							<button type="button" class="btn btn-toggle" data-remote="false" data-toggle="modal" data-target="#myModal">
								<img alt="btn_search" src="<c:url value='/images/app/all/btn_search.png'/>">
							</button>									
							<input type="text" id="materialName" name="materialName">
						</td>
					</tr>
					<tr>
						<th>출고공정</th>
						<td>
							<input  class="w-5" type="text" id="processCode" name="processCode"> 
							<input  type="text" id="processName" name="processName">
						</td>
					</tr>
					<tr>
						<th>정렬구분</th>
						<td> 
							<span class="mr-1"> 일자 <input type="radio" name="sort" value="io_date" checked></span>
							<span class="mr-1"> 공정 <input type="radio" name="sort" value="process_code"></span>
							<span class="mr-1"> 자재 <input type="radio" name="sort" value="material_code"></span>
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
		<div id="matOutList"></div>
	</form>
</div>

<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
</div>

<script type="text/javascript" src="js/app/mat/matOutForm.js"></script>