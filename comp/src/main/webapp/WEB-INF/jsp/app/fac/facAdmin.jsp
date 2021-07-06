<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<meta name="viewport" content="width=device-width, initial-scale=1">
<script type="text/javascript" src="http://code.jquery.com/jquery-3.2.1.min.js"></script>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

<h1 class="h3 mb-4 text-gray-700">설비관리</h1>

<form action="insertFac.do" method="post" id="frm" encType="multipart/form-data">
	<div class="mb-4">
		<button class="btn btn-primary" id="btnNew" type="reset"> 새입력 </button>
		<input type="submit" class="btn btn-primary" value="저장">
		<button class="btn btn-primary" id="btnUdate" type="button"> 수정 </button>
	</div>
	<div class="flax row">
		<div class="mb-4 col-10f">
			<table class="table">
				<tbody>
					<tr>
						<th>설비코드</th>
						<td><input type="text" id="facCode" name="facCode" 
						style="background-color: #e2e2e2;" readonly></td> 
					</tr>
					<tr>
						<th>설비명</th>
						<td><input type="text" id="facilitiesName"
							name="facilitiesName"></td>
						<th>모델</th>
						<td><input type="text" id="model" name="model"></td>
						<th>설비규격</th>
						<td><input type="text" id="facSize" name="facSize"></td>
					</tr>
					<tr>
						<th>제작업체</th>
						<td><input type="text" id="productionCompany"
							name="productionCompany"></td>
						<th>용도</th>
						<td><input type="text" id="purpose" name="purpose"></td>
						<th>용량/규격</th>
						<td><input type="text" id="volume" name="volume"></td>
					</tr>
					<tr>
						<th>제작일자</th>
						<td><input type="date" id="productionDate"
							name="productionDate">
						<th>사원번호</th>
						<td><input type="text" id="empNo" name="empNo"></td>
						<th>구매금액</th>
						<td><input type="text" id="price" name="price"></td>
					</tr>
					<tr>
						<th>정기점검주기</th>
						<td><input type="text" id="facInspection"
							name="facInspection"></td>
						<th>구매일자</th>
						<td><input type="date" id="purchaseDate" name="purchaseDate"></td>
						<th>공정코드</th>
						<td><input type="text" id="processCode" name="processCode"></td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="col-3">
			<input type="file" id="img" name="uploadFile" accept="image/*" 
			style="display: none" onchange="setThumbnail(event);">
			<button type="button" class="btn btn-primary" id="btnImg">이미지
				업로드</button>
			<h3>이미지 미리보기</h3>
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
	<button type="button" class="btn btn-primary" id="btnDelete">삭제</button>
		<div id="grid"></div>
	</div>	
	<div id="tabs-2">
		<div id="grid2"></div>
	</div>
</div>
<script type="text/javascript" src="js/app/fac/facAdmin.js"></script>