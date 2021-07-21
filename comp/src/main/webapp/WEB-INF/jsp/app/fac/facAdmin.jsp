<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<!-- <script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script> -->
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
<!--  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>   -->
<style>
#facCode, #empNo, #processCode {
	background-color: #EAECF4;
}
</style>
<form action="insertFacilities.do" method="post" id="frm"
	encType="multipart/form-data" onsubmit="return test()">
	<div class="row">
		<div class="col-md-8">
			<h1 class="h3 mb-4 text-gray-700">설비관리</h1>
		</div>
		<div class="col-md-4 mb-4" align="right">
			<button class="btn-two blue small" id="btnNew" type="reset">
				새입력</button>
			<button type="submit" class="btn-two blue small">저장</button>
			<button type="button" class="btn-two blue small" id="btnDelete">삭제</button>
		</div>
	</div>
	<div class="row">
		<div class="mb-2 col-md-8">
			<table class="table">
				<tbody>
					<tr>
						<th>설비코드</th>
						<td><input type="text" id="facCode" name="facCode"
							value="${max}" readonly class="form-control"></td>
					</tr>
					<tr>
						<th>설비명<span style="color: red">*</span></th>
						<td><input type="text" id="facilitiesName"
							name="facilitiesName" class="form-control"></td>
						<th>모델</th>
						<td><input type="text" id="model" name="model"
							class="form-control"></td>
						<th>설비규격</th>
						<td><input type="text" id="facSize" name="facSize"
							class="form-control"></td>
					</tr>
					<tr>
						<th>제작업체</th>
						<td><input type="text" id="productionCompany"
							name="productionCompany" class="form-control"></td>
						<th>용도</th>
						<td><input type="text" id="purpose" name="purpose"
							class="form-control"></td>
						<th>용량/규격</th>
						<td><input type="text" id="volume" name="volume"
							class="form-control"></td>
					</tr>
					<tr>
						<th>제작일자</th>
						<td><input type="date" id="productionDate"
							name="productionDate" class="form-control">
						<th>사원번호<span style="color: red">*</span></th>
						<td>
							<div class="row">
								<div class="col-md-3">
									<input type="text" id="empNo" name="empNo" readonly
										class="form-control">
								</div>
								<button id="btnEmpModal" type="button" class="btn btn-toggle"
									data-remote="false" data-toggle="modal" data-target="#empModal">
									<img alt="btn_search"
										src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
								<div class="col-md-5">
									<input type="text" id="employeeName" name="employeeName" readonly
										class="form-control">
								</div>
							</div>
						</td>
						<th>구매금액</th>
						<td><input type="text" id="price" name="price"
							onkeyup="numberWithCommas(this.value)" class="form-control"></td>
					</tr>
					<tr>
						<th>정기점검주기(DAY)<span style="color: red">*</span></th>
						<td><input type="text" id="facInspection"
							name="facInspection" class="form-control"></td>
						<th>구매일자</th>
						<td><input type="date" id="purchaseDate" name="purchaseDate"
							class="form-control"></td>
						<th>공정코드<span style="color: red">*</span></th>
						<td>
							<div class="row">
								<div class="col-md-3">
									<input type="text" id="processCode" name="processCode" readonly
										class="form-control">
								</div>
								<button id="btnProcModal" type="button" class="btn btn-toggle"
									data-remote="false" data-toggle="modal"
									data-target="#procModal">
									<img alt="btn_search"
										src="<c:url value='/images/app/all/btn_search.png'/>">
								</button>
								<div class="col-md-6">
								<input type="text" id="processName" name="processName" readonly
										class="form-control">
								</div>
							</div>
						</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-3">
			<input type="file" id="img" name="uploadFile" accept="image/*"
				style="display: none" onchange="setThumbnail(event);">
			<button type="button" class="btn-two blue small" id="btnImg">이미지
				업로드</button>
			<h3 class="h3 mb-4 text-gray-700">이미지 미리보기</h3>
			<div id="imagePreview">
				<img id="image" />
			</div>
		</div>
	</div>
</form>

<div id="tabs">
	<ul>
		<li><a href="#tabs-1">설비 관리 목록</a></li>
		<li><a href="#tabs-2">설비 공정 목록</a></li>
	</ul>

	<div id="tabs-1">
		<div id="grid"></div>
	</div>
	<div id="tabs-2">
		<div id="grid2"></div>
	</div>
</div>

<div class="modal fade" id="procModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content" id="procContent" align="center"></div>
	</div>
</div>

<div class="modal fade" id="empModal" tabindex="-1" role="dialog"
	aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog modal-lg" role="document">
		<div class="modal-content" id="empContent" align="center"></div>
	</div>
</div>

<script type="text/javascript"
	src="${pageContext.request.contextPath}/js/app/fac/facAdmin.js"></script>