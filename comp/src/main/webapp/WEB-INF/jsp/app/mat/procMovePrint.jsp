<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>
.tui-grid-summary-area .tui-grid-cell {
    text-align: right;
}
#processCode, #materialCode{
	background-color: #FFFFFF;
}

.red{	
	b-ac-kgro-und-color: #FFD2D2;
}

.blackText{
	color: #000000;
	background-color: #F4F4F4;
}
</style>
<div class="row">
	<div class="col-md-8">
		<h3 class="h3 mb-4 text-gray-700">공정이동표 발행</h3>
	</div>
</div>

<form id="searchFrm" name="searchFrm">
	<div class="row">
		<div class="mb-2 col-md-5">
			<table class="table">
				<tbody>
					<tr>
						<th>작업일자</th>
						<td>
							<div class="row">
								<div class="col-md-5">
									<input type="date" class="form-control" id="startDate" name="startDate">
								</div>
								~ 	
								<div class="col-md-5">
									<input type="date" class="form-control" id="endDate" name="endDate">
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-md-2"></div>
		<div class="col-md-3 mb-4" align="right" role="form">
			<button type="button" class="btn btn-primary" id="btnRead">조회</button>
			<button type="button" class="btn btn-primary" id="btnPrint">발행</button>
		</div>
	</div>
</form>

<div class="row">
	<div class="col-md-10 mb-2" align="center">
		<div id="planGrid"></div>
	</div>
	<div class="col-md-5">
		<table class="table">
			<tbody>
				<tr>
					<th>투입자재</th>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-md-5">
		<table class="table">
			<tbody>
				<tr>
					<th>진행</th>
				</tr>
			</tbody>
		</table>
	</div>
	<div class="col-md-5"> 
		<div id="inputGrid"> </div>
	</div>
	<div class="col-md-5"> 
		<div id="procGrid"> </div>
	</div>
</div>

<script type="text/javascript" src="${pageContext.request.contextPath}/js/app/mat/procMovePrint.js"></script>
